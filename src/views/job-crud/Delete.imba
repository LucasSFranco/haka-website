import { auth, firestore, storage } from '../../firebase'

import Container from '../../components/layout/Container'
import Row from '../../components/layout/Row'

import Form from '../../components/form/Form'
import Title from '../../components/form/Title'
import Button from '../../components/form/Button'
import Message from '../../components/form/Message'

tag JobDelete

	def setup
		jobId = null
		existent = null
		message = {}
		isLoading = false
		isAuthenticated = false

	def deleteJob
		message = {}

		isLoading = true

		const {items} = await storage.ref(jobId).listAll()
		.catch do |error|
			message.error = error.message

		await Promise.all
			items.map do |item|
				await item.delete()
				.catch do |error|
					message.error = error.message

		await firestore.collection('jobs').doc(jobId).delete()
		.catch do |error|
			message.error = error.message

		message.success = 'Serviço excluído com sucesso.'

		existent = null

		isLoading = false
		render()

	def verifyJobExistence
		if jobId
			existent = await firestore.collection('jobs').doc(jobId).get()
			.catch do |error|
				message.error = error.message

		render()

	def mount
		setup()
		jobId = route.params.id

		auth.onAuthStateChanged do |user|

			if user
				isAuthenticated = user
				render()
				verifyJobExistence()
			else
				router.go('/admin')

	def render
		<self.job-delete> if isAuthenticated
			<Container[py: 5rem]>
				<Row>
					<Form>
						<Title.delete>
							'Excluir'
							<small> 'Serviço'
						<Message> 'Tem certeza que deseja excluir este serviço?'
						<Button.delete
							.disabled=!existent..data()
							@click.if(!isLoading && existent..data())=deleteJob>
							if isLoading
								<i.fas.fa-spinner.fa-pulse>
							else
								<i.fas.fa-times>
							'Excluir'
						<Button.secondary
							route-to="/admin/management">
							<i.fas.fa-chevron-left>
							'Voltar'
						<Message
							.error=message..error
							.success=message..success>
							message..error || message..success || ''

export default JobDelete
