import Container from '#/Container'
import ControlTitle from '#/admin-control/ControlTitle'
import ControlNavbar from '#/admin-control/ControlNavbar'
import ControlSection from '#/admin-control/ControlSection'
import ControlPagination from '#/admin-control/ControlPagination'
import ControlModal from '#/admin-control/ControlModal'

import Jobs from 'server/Jobs'
import Categories from 'server/Categories'
import Auth from 'server/Auth'

tag AdminControl < Container

	prop categories = []
	prop jobs = []
	prop images = []
	prop lastPage = null

	prop modalLoading = false
	prop modalOpen = false
	prop modalImage = null

	prop paginationLoading = true
	prop navbarLoading = true
	
	prop sectionLoading = true
	prop imagesLoaded = 0

	def changePage number
		if number >= 1 and number <= lastPage
			Jobs.page = number
			await getJobs()

	def changeCategoryId categoryId
		Jobs.page = 1
		Jobs.categoryId = categoryId
		await getLastPage()
		await getJobs()

	def getAllCategories
		navbarLoading = true
		render()
		categories = await Categories.getCategories()
		navbarLoading = false
		imba.commit()
		render()

	def deleteJob id
		router.go("/admin/control/job/delete/{id}")

	def deleteCategory id
		router.go("/admin/control/category/delete/{id}")

	def getLastPage
		paginationLoading = true
		lastPage = await Jobs.getJobsCount()
		lastPage = Math.ceil(lastPage / 6)
		paginationLoading = false

	def openModal jobId
		document.querySelector('html').style.overflowY = 'hidden'
		modalOpen = true
		modalLoading = true
		for job in jobs
			if job.id === jobId
				modalImage = new Image
				modalImage.onload = do
					modalLoading = false
					render()
				modalImage.src = job.fullImage
				modalImage.alt = job.id

	def getJobs
		jobs = await Jobs.getJobs()
		createImageElements()
		imba.commit()
		render()

	def closeModal
		modalOpen = false

	def createImageElements
		
		sectionLoading = true
		images = []
		imagesLoaded = 0
		for job in jobs
			let image = new Image
			image.onload = do
				imagesLoaded += 1
				if imagesLoaded === jobs.length
					sectionLoading = false
					render()
			image.src = job.previewImage
			image.alt = job.id
			images.push(image)

	def mount
		await getLastPage()
		await getAllCategories()
		await getJobs() 

	def render
		<self#admin-control>
			if Auth.user

				<ControlTitle>
				<ControlNavbar
					categories=categories
					loading=navbarLoading
					@changeCategoryId=changeCategoryId(e.detail)
					@deleteCategory=deleteCategory(e.detail)>
				<ControlSection
					images=images
					loading=sectionLoading
					@openModal=openModal(e.detail)
					@deleteJob=deleteJob(e.detail)>
				<ControlPagination
					page=Jobs.page
					lastPage=lastPage
					loading=paginationLoading
					@changePage=changePage(e.detail)>
				<ControlModal
					open=modalOpen
					loading=modalLoading
					image=modalImage
					@closeModal=closeModal>

export default AdminControl
