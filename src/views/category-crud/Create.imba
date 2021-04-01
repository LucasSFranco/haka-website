import { auth, firestore } from '../../firebase'

import Category from '../../models/Category'

import Container from '../../components/layout/Container'
import Row from '../../components/layout/Row'

import Form from '../../components/form/Form'
import Title from '../../components/form/Title'
import Input from '../../components/form/Input'
import Button from '../../components/form/Button'
import Message from '../../components/form/Message'

tag CategoryCreate

	def setup
		message = {}
		category = new Category
		isLoading = false
		isAuthenticated = false

	def createCategory
		message = {}

		if category.validate()
			isLoading = true

			await firestore.collection('categories').add(
				name: category.name
				createdAt: Date.now()
			).catch do |error|
				message.error = error.message

			message.success = 'Categoria cadastrada com sucesso.'

			category = new Category

			isLoading = false
			render()
		else
			message.error = 'Você deve preencher todos os campos.'
			render()

	def mount
		setup()

		auth.onAuthStateChanged do |user|
			if user
				isAuthenticated = true
				render()
			else
				router.go('/admin')

	def render
		<self.category-create> if isAuthenticated
			<Container[py: 5rem]>
				<Row>
					<Form>
						<Title.create>
							'Criar'
							<small> 'Categoria'
						<Input
							bind.data=category..name
							@focusin=(do message = {})>
							'Nome'
						<Button.create
							@click.if(!isLoading)=createCategory>
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

export default CategoryCreate
