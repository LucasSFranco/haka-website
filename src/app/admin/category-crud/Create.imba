import Title from '#/admin-form/Title'
import Form from '#/admin-form/Form'
import Input from '#/admin-form/Input'
import Button from '#/admin-form/Button'
import Message from '#/admin-form/Message'

import Category from 'server/models/Category'

import Auth from 'server/Auth'
import Categories from 'server/Categories'

tag CategoryCreate

	prop category = new Category

	def createCategory
		console.log category
		loading = true
		await Categories.createCategory(category)
		category = new Category
		loading = false

	def render
		<self#category-create>
			if Auth.user
				<Form>
					<Title>
						'Criar'
						<small> 'Categoria'
					<Input bind.data=category.name> 'Nome'
					<Button @click.if(!loading)=createCategory>
						if loading
							<i.fas.fa-spinner.fa-pulse>
						else
							<i.fas.fa-plus>
						'Criar'
					<Button[mt: .5rem].secondary
						@click=(do router.go('/admin/control'))>
						<i.fas.fa-chevron-left>
						'Voltar'

	css &
		d: flex
		ai: center
		jc: center
		w: 100vw
		h: 100vh

export default CategoryCreate
