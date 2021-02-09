import { firestore, storage } from 'server/firebase'

class Categories

	static prop createLoading = false
	static prop getLoading = false

	static def queryCategories
		const categoriesCollection = firestore.collection('categories')
		let categories = await categoriesCollection.get()
		categories = categories.docs
		return categories

	static def getCategories
		getLoading = true
		let categories = await queryCategories()
		categories = await arrangeCategoriesInfo(categories)
		getLoading = false
		return categories

	static def arrangeCategoriesInfo categories
		return Promise.all(categories.map do |category|
			let arrangedCategory = {
				id: category.id
				name: category.data().name
			}
			return arrangedCategory
		)

	static def createCategory category
		createLoading = true
		const categoriesCollection = firestore.collection('categories')
		await categoriesCollection.add(
			name: category.name
			createdAt: Date.now()
		)
		createLoading = false

	static def deleteCategory id
		const categoriesCollection = firestore.collection('categories')
		const jobsCollection = firestore.collection('jobs')
		const jobs = await jobsCollection.where('categoryId', '==', id).get()
		console.log jobs
		jobs.docs.map do |job|
			const imagesRef = await storage.ref(job.id).listAll()
			imagesRef.items.map do |imageRef|
				await imageRef.delete()
			await jobsCollection.doc(job.id).delete()
		await categoriesCollection.doc(id).delete()
		

export default Categories