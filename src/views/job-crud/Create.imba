import { auth, firestore, storage } from '../../firebase'

import Job from '../../models/Job'

import Container from '../../components/layout/Container'
import Row from '../../components/layout/Row'

import Form from '../../components/form/Form'
import Title from '../../components/form/Title'
import Select from '../../components/form/Select'
import FileInput from '../../components/form/FileInput'
import Button from '../../components/form/Button'
import Message from '../../components/form/Message'

tag JobCreate

	def setup
		categories = []
		job = new Job
		message = {}
		progress =
			previewImage: 0
			fullImage: 0
		isLoading = false
		isAuthenticated = false

	def createJob
		message = {}

		if job.validate()
			isLoading = true

			const { id } = firestore.collection('jobs').doc()

			await Promise.all
				Object.entries(job.images).map do |[field, image]|
					const task = storage.ref(`{id}/{image.name}`).put(image)

					task.on 'state_changed'
						do |{ bytesTransferred, totalBytes }|
							progress[field] = bytesTransferred / totalBytes * 100
							render()
					await task
					.catch do |error|
						message.error = error.message

					const URL = await task.snapshot.ref.getDownloadURL()
					.catch do |error|
						message.error = error.message

					job[`{field}URL`] = URL

			await firestore.collection('jobs').doc(id).set(
				categoryId: job.categoryId
				previewImageURL: job.previewImageURL
				fullImageURL: job.fullImageURL
				createdAt: Date.now()
			).catch do |error|
				message.error = error.message

			message.success = 'Serviço cadastrado com sucesso'

			progress =
				previewImage: 0
				fullImage: 0
			job = new Job

			isLoading = false
			imba.commit()
			render()
		else
			message.error = 'Você deve preencher todos os campos'

			render()

	def getCategories
		const { docs } = await firestore.collection('categories').get()
		.catch do |error|
			console.error error.message

		categories = docs.map do |doc|
			id: doc.id
			name: doc.data().name

		render()

	def mount
		setup()

		auth.onAuthStateChanged do |user|
			if user
				isAuthenticated = true
				render()
				getCategories()
			else
				router.go('/admin')

	def render
		<self.job-create> if isAuthenticated
			<Container[py: 5rem]>
				<Row>
					<Form>
						<Title.create>
							'Criar'
							<small> 'Serviço'
						<Select
							options=categories
							bind.data=job.categoryId
							@focusin=(do message = {})>
							'Categoria'
						<FileInput
							progress=progress['previewImage']
							bind.data=job.images['previewImage']
							@focusin=(do message = {})>
							'Pré-visualização'
						<FileInput
							progress=progress['fullImage']
							bind.data=job.images['fullImage']
							@focusin=(do message = {})>
							'Apresentação'
						<Button.create
							@click.if(!isLoading)=createJob>
							if isLoading
								<i.fas.fa-spinner.fa-pulse>
							else
								<i.fas.fa-plus>
							'Criar'
						<Button.secondary
							route-to="/admin/management">
							<i.fas.fa-chevron-left>
							'Voltar'
						<Message
							.error=message..error
							.success=message..success>
							message..error || message..success || ''

export default JobCreate
