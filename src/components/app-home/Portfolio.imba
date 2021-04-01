import Masonry from 'masonry-layout'

import { firestore } from '../../firebase'

import Container from '../layout/Container'
import Col from '../layout/Col'
import Loader from '../layout/Loader'

import Title from './home-portfolio/Title'
import Menu from './home-portfolio/Menu'
import MenuItem from './home-portfolio/MenuItem'
import Images from './home-portfolio/Images'
import Image from './home-portfolio/Image'
import Pagination from './home-portfolio/Pagination'
import PaginationButton from './home-portfolio/PaginationButton'
import Button from './home-portfolio/Button'
import Modal from './home-portfolio/Modal'

tag Portfolio

	def setup
		jobs = null
		pages = null
		categories = null

		selectedPage = 1
		selectedJob = null
		selectedCategoryId = null

		images = []

	def changePage page
		let section = document.querySelector("#portfolio")
		window.scrollTo(0, section.offsetTop + 160)

		if pages.includes(page) && page !== selectedPage
			selectedPage = page
			await getJobs()
			createImageElements()

	def changeCategoryId categoryId
		let section = document.querySelector("#portfolio")
		window.scrollTo(0, section.offsetTop + 160)

		if categoryId !== selectedCategoryId
			selectedPage = 1
			selectedCategoryId = categoryId
			getPages()
			await getJobs()
			createImageElements()

	def changeJob job
		modalLoaded = false
		selectedJob = job
		if document.querySelector('html').style.overflowY == 'hidden'
			document.querySelector('html').style.overflowY = 'auto'
			document.querySelector('#navbar-logo').classList.add('in')
			document.querySelector('#navbar-logo').classList.remove('out')
			document.querySelector('#navbar-menu').classList.add('in')
			document.querySelector('#navbar-menu').classList.remove('out')
		else
			document.querySelector('html').style.overflowY = 'hidden'
			document.querySelector('#navbar-logo').classList.add('out')
			document.querySelector('#navbar-logo').classList.remove('in')
			document.querySelector('#navbar-menu').classList.add('out')
			document.querySelector('#navbar-menu').classList.remove('in')
		masonry.layout()

	def getPages

		let query = firestore.collection('jobs')
		if selectedCategoryId
			query = query.where('categoryId', '==', selectedCategoryId)
		const { size } = await query.get()
		.catch do |error|
			console.error error

		pages = []

		const lastPage = Math.ceil(size / 6)
		for page in [1 .. lastPage]
			pages.push(page)

		render()

	def getJobs

		let query = firestore.collection('jobs').orderBy('createdAt', 'desc')
		if selectedCategoryId
			query = query.where('categoryId', '==', selectedCategoryId)
		if selectedPage
			query = query.limit(selectedPage * 6)

		const { docs } = await query.get()
		.catch do |error|
			console.error = error.message

		jobs = docs.slice((selectedPage - 1) * 6).map do |job|
			id: job.id
			previewImageURL: job.data().previewImageURL
			fullImageURL: job.data().fullImageURL

		render()

	def createImageElements
		images = []

		for job in jobs
			let image = document.createElement('img')
			image.onload = do
				if jobs && images.every(do |image| image.complete)
					render()
					masonry.layout()
					masonry.reloadItems()
					masonry.layout()
			image.src = job.previewImageURL
			image.alt = job.id
			images.push(image)

		masonry.reloadItems()
		masonry.layout()

	def getCategories
		const { docs } = await firestore.collection('categories').get()
		.catch do |error|
			console.error = error.message

		categories = docs.map do |doc|
			id: doc.id
			name: doc.data().name

		render()

	def initMasonry
		masonry = new Masonry
			'.grid'
			transitionDuration: 0
			itemSelector: '.grid-item'
			gutter: 16

	def mount

		getCategories()
		getPages()
		await getJobs()
		initMasonry()
		createImageElements()

	def unmount
		setup()

	def render
		<self #portfolio>
			<Container[py: 10rem]>
				<Title>
				<Menu
					.show=categories>
					<MenuItem[mr: .5rem]
						.active=!selectedCategoryId
						@click.if(jobs && images.every(do |image| image.complete))=changeCategoryId(null)>
						'Tudo'
					for category, index in categories
						<div[d: flex mr: .5rem]>
							<MenuItem[animation-delay: {(index+1)*100}ms]
								.active=(category.id === selectedCategoryId)
								@click.if(jobs && images.every(do |image| image.complete))=changeCategoryId(category.id)>
								category.name
				<Images
					.show=(jobs && images.length === jobs.length && images.every(do |image| image.complete))>
					for job, index in jobs
						<Image.grid-item
							@click=changeJob(job)>
							images[index]
				<Pagination
					.show=(pages && pages.length > 1 && jobs..length)>
					<PaginationButton.prev
						.disabled=(selectedPage === 1)
						@click.if(jobs && images.every(do |image| image.complete))=changePage(selectedPage - 1)>
						<i.fas.fa-chevron-left>
					for page, index in pages
						<PaginationButton[animation-delay: {(index+1)*100}ms]
							.active=(page === selectedPage)
							@click.if(jobs && images.every(do |image| image.complete))=changePage(page)>
							page
					<PaginationButton.next[animation-delay: {(pages..length+1)*100}ms]
						.disabled=(pages && selectedPage === pages[pages.length - 1])
						@click.if(jobs && images.every(do |image| image.complete))=changePage(selectedPage + 1)>
						<i.fas.fa-chevron-right>
				<Modal
					.show=selectedJob
					.loading=!modalLoaded>
					<Container
						@click.self=changeJob(null)>
						<Loader>
						<div.container-child>
							<div.image-wrapper
								@click.self=changeJob(null)>
								<img
									src=selectedJob..fullImageURL
									alt=selectedJob..id
									@load=(do modalLoaded=true)>
						<i.fas.fa-times
							@click=changeJob(null)>

export default Portfolio
