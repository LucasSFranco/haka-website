import { auth, firestore, storage } from '../../firebase'

import Container from '../../components/layout/Container'
import Row from '../../components/layout/Row'

import Form from '../../components/form/Form'
import Title from '../../components/form/Title'
import Input from '../../components/form/Input'
import Button from '../../components/form/Button'
import Message from '../../components/form/Message'

tag CategoryDelete

	def setup
		categoryId = null
		existent = null
		category = null
		confirmation = ''
		message = {}
		isLoading = false
		isAuthenticated = false

	def deleteCategory
		message = {}

		if confirmation === category.name
			isLoading = true

			const { docs } = await firestore.collection('jobs')
			.where('categoryId', '==', categoryId).get()
			.catch do |error|
				message.error = error.message

			await Promise.all
				docs.map do |doc|
					const { items } = await storage.ref(doc.id).listAll()
					.catch do |error|
						message.error = error.message

					await Promise.all
						items.map do |item|
							await item.delete()
							.catch do |error|
								message.error = error.message

						await firestore.collection('jobs').doc(doc.id).delete()
						.catch do |error|
							message.error = error.message

			await firestore.collection('categories').doc(categoryId).delete()
			.catch do |error|
				message.error = error.message

			message.success = 'Categoria excluída com sucesso.'

			category = {}
			confirmation = ''
			existent = null
			category =
				name: 'indefinido'

			isLoading = false
			render()
		else
			message.error = 'Você deve digitar corretamente a palavra de segurança.'
			render()

	def verifyCategoryExistence
		if categoryId
			existent = await firestore.collection('categories')
			.doc(categoryId).get()
			.catch do |error|
				console.error error.message

		if existent..data()
			category =
				id: existent.id
				name: existent.data().name
		else
			category =
				name: 'indefinido'

		render()

	def mount
		setup()
		categoryId = route.params.id

		auth.onAuthStateChanged do |user|
			if user
				isAuthenticated = true
				render()

				verifyCategoryExistence()
			else
				router.go('/admin')

	def render
		<self.category-delete> if isAuthenticated
			<Container[py: 5rem]>
				<Row>
					<Form>
						<Title.delete>
							'Excluir'
							<small>	'Categoria'
						<Message.error>
							'A exclusão desta categoria irá excluir também todos os serviços cadastrados nela.'
						<Message>
							'Confirme a ação digitando, no campo abaixo, o nome da categoria: '
							<span>
								if category
									category.name
								else
									<i.fas.fa-spinner.fa-pulse>
							'.'
						<Input
							disabled=!existent..data()
							@focusin=(do message={})
							bind.data=confirmation>
						<Button.delete
							.disabled=!existent..data()
							@click.if(!isLoading && existent..data())=deleteCategory>
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

export default CategoryDelete
