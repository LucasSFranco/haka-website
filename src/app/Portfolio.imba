import Container from '#/Container'

import PortfolioTitle from '#/app-portfolio/PortfolioTitle'
import PortfolioNavbar from '#/app-portfolio/PortfolioNavbar'
import PortfolioSection from '#/app-portfolio/PortfolioSection'
import PortfolioPagination from '#/app-portfolio/PortfolioPagination'
import PortfolioModal from '#/app-portfolio/PortfolioModal'

import Jobs from 'server/Jobs'
import Categories from 'server/Categories'

tag Portfolio < Container

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

	def getLastPage
		paginationLoading = true
		lastPage = await Jobs.getJobsCount()
		lastPage = Math.ceil(lastPage / 6)
		paginationLoading = false

	def openModal jobId
		document.querySelector('html').style.overflowY = 'hidden'
		document.querySelector('#navbar-logo').classList.add('out')
		document.querySelector('#navbar-logo').classList.remove('in')
		document.querySelector('#navbar-menu').classList.add('out')
		document.querySelector('#navbar-menu').classList.remove('in')
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
		document.querySelector('#navbar-logo').classList.remove('out')
		document.querySelector('#navbar-logo').classList.add('in')
		document.querySelector('#navbar-menu').classList.remove('out')
		document.querySelector('#navbar-menu').classList.add('in')

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
		<self#portfolio>
			<PortfolioTitle>
			<PortfolioNavbar
				categories=categories
				loading=navbarLoading
				@changeCategoryId=changeCategoryId(e.detail)>
			<PortfolioSection
				images=images
				loading=sectionLoading
				@openModal=openModal(e.detail)>
			<PortfolioPagination
				page=Jobs.page
				lastPage=lastPage
				loading=paginationLoading
				@changePage=changePage(e.detail)>
			<PortfolioModal
				open=modalOpen
				loading=modalLoading
				image=modalImage
				@closeModal=closeModal>

export default Portfolio