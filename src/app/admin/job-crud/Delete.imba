import Title from '#/admin-form/Title'
import Form from '#/admin-form/Form'
import Input from '#/admin-form/Input'
import Button from '#/admin-form/Button'
import Message from '#/admin-form/Message'

import Auth from 'server/Auth'
import Jobs from 'server/Jobs'

tag JobDelete

	def deleteJob
		loading = true
		let id = route.params.id
		await Jobs.deleteJob(id)
		loading = false

	def render
		<self#job-delete>
			if Auth.user
				<Form>
					<Title>
						'Excluir'
						<small> 'Serviço'
					<Message[mb: 1rem]> 'Tem certeza que deseja excluir este serviço?'
					<Button
						@click.if(!loading)=deleteJob>
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

export default JobDelete
