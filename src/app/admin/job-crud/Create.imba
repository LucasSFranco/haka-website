import Title from '#/admin-form/Title'
import Form from '#/admin-form/Form'
import FileInput from '#/admin-form/FileInput'
import Select from '#/admin-form/Select'
import Button from '#/admin-form/Button'
import Message from '#/admin-form/Message'

import Auth from 'server/Auth'
import Jobs from 'server/Jobs'
import Categories from 'server/Categories'

tag JobCreate

	prop categories = []

	def mount
		categories = await Categories.getCategories()

	def createJob
		await Jobs.createJob()

	def render
		<self#job-create>
			if Auth.user
				<Form>
					<Title>
						'Criar'
						<small> 'Serviço'
					<Select
						options=categories
						loading=Categories.getLoading
						bind.data=Jobs.job.firestore.categoryId>
						'Categoria'
					<FileInput
						progress=Jobs.progress.previewImage
						bind.data=Jobs.job.storage.previewImage>
						'Imagem de pré-visualização'
					<FileInput
						progress=Jobs.progress.fullImage
						bind.data=Jobs.job.storage.fullImage>
						'Imagem da apresentação'
					<Button
						@click=createJob>
						if Jobs.createLoading
							<i.fas.fa-spinner.fa-pulse>
						else
							<i.fas.fa-plus>
						'Criar'
					<Button[mt: .5rem].secondary
						@click.if(!loading)=(do router.go('/admin/control'))>
						<i.fas.fa-chevron-left>
						'Voltar'
					<Message
						.error=Jobs.errorMessage
						.success=Jobs.successMessage>
						Jobs.errorMessage || Jobs.successMessage

	css &
		display: flex
		align-items: center
		justify-content: center
		width: 100vw
		height: 100vh

export default JobCreate
