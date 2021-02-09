import { firestore, storage } from 'server/firebase'
import Job from 'server/models/Job'

class Jobs

	static prop job = new Job
	static prop categoryId = null
	static prop page = 1
	static prop createLoading = false
	static prop progress = {
		previewImage: 0
		fullImage: 0
	}
	static prop successMessage = ''
	static prop errorMessage = ''

	static def queryByCategoryId query
		if categoryId
			return query.where('categoryId', '==', categoryId)
		return query

	static def queryByPage query
		return query.limit(page * 6)

	static def getJobsCount
		const jobsCollection = firestore.collection('jobs')
		let query = queryByCategoryId(jobsCollection)
		let jobs = await query.get()
		return jobs.size

	static def queryJobs
		const jobsCollection = firestore.collection('jobs')
		let query = jobsCollection.orderBy('createdAt', 'desc')
		query = queryByCategoryId(query)
		query = queryByPage(query)
		let jobs = await query.get()
		jobs = jobs.docs
		jobs = jobs.slice((page - 1) * 6, jobs.length)
		return jobs

	static def arrangeJobsInfo jobs
		return Promise.all(jobs.map do |job|
			let arrangedJob = {
				id: job.id
				previewImage: job.data().previewImage
				fullImage: job.data().fullImage
			}
			return arrangedJob
		)

	static def getJobs
		let jobs = await queryJobs()
		jobs = await arrangeJobsInfo(jobs)
		return jobs

	static def createJob
		successMessage = ''
		errorMessage = ''
		createLoading = true
		job.firestore.createdAt = Date.now()
		const jobsCollection = firestore.collection('jobs')
		let jobRef = await jobsCollection.add(job.firestore)
		for own fieldName, image of job.storage
			let path = "{jobRef.id}/"
			path += "{image.name.replace(/.*(?=\.)/, fieldName)}"
			let task = storage.ref(path).put(image)
			task.on('state_changed', 
				(do |snapshot|
					progress[fieldName] = (snapshot.bytesTransferred / snapshot.totalBytes) * 100
					imba.commit()
				), (do |err|
					errorMessage = err.message
					imba.commit()
				), (do
					let url = await task.snapshot.ref.getDownloadURL()
					await jobsCollection.doc(jobRef.id).update({ [fieldName]: url })
					createLoading = false
					job = new Job
					progress = {
						previewImage: 0
						fullImage: 0
					}
					successMessage = 'Cadastro concluído com sucesso'
					imba.commit()
				)
			)

	static def deleteJob id
		const jobsCollection = firestore.collection('jobs')
		const job = await jobsCollection.doc(id).get()
		const imagesRef = await storage.ref(job.id).listAll()
		imagesRef.items.map do |imageRef|
			await imageRef.delete()
		await jobsCollection.doc(id).delete()
		
export default Jobs