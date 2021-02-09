import Title from '#/admin-form/Title'
import Form from '#/admin-form/Form'
import Input from '#/admin-form/Input'
import Button from '#/admin-form/Button'
import Message from '#/admin-form/Message'

import Auth from 'server/Auth'
import Categories from 'server/Categories'

tag CategoryDelete

	def deleteCategory
		loading = true
		let id = route.params.id
		await Categories.deleteCategory(id)
		loading = false

	def render
		<self#category-delete>
			if Auth.user
				<Form>
					<Title>
						'Excluir'
						<small> 'Categoria'
					<Message[mb: 1rem]> 'Esta ação excluirá todos os serviços cadastrados nesta categoria, tem certeza que deseja excluí-la?'
					<Button @click.if(!loading)=deleteCategory>
						if loading
							<i.fas.fa-spinner.fa-pulse>
						else
							<i.fas.fa-times>
						'Excluir'
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

export default CategoryDelete
