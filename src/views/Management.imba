import Masonry from 'masonry-layout'

import { auth, firestore } from '../firebase'

import Container from '../components/layout/Container'
import Col from '../components/layout/Col'
import Loader from '../components/layout/Loader'

import Title from '../components/app-management/Title'
import Menu from '../components/app-management/Menu'
import MenuItem from '../components/app-management/MenuItem'
import Images from '../components/app-management/Images'
import Image from '../components/app-management/Image'
import Pagination from '../components/app-management/Pagination'
import PaginationButton from '../components/app-management/PaginationButton'
import Button from '../components/app-management/Button'
import Modal from '../components/app-management/Modal'

tag Management

	def setup
		jobs = null
		pages = null
		categories = null

		selectedPage = 1
		selectedJob = null
		selectedCategoryId = null

		images = []

	def changePage page
		if pages.includes(page) && page !== selectedPage
			selectedPage = page
			await getJobs()
			createImageElements()

	def changeCategoryId categoryId
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
		else
			document.querySelector('html').style.overflowY = 'hidden'
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
		auth.onAuthStateChanged do |user|
			if user
				isAuthenticated = user
				render()

				getCategories()
				getPages()
				await getJobs()
				initMasonry()
				createImageElements()
			else
				router.go('/admin')

	def unmount
		setup()

	def render
		<self.management> if isAuthenticated
			<Container[py: 2.5rem]>
				<Title>
					<h1> 'Gerenciamento'
					<button
						route-to="/admin"
						@click=auth.signOut()>
						<i.fas.fa-sign-out-alt>
						'Sair'
				<Menu
					.show=categories>
					<MenuItem[mr: .5rem]
						.active=!selectedCategoryId
						@click.if(jobs && images.every(do |image| image.complete))=changeCategoryId(null)>
						'Tudo'
					for category in categories
						<div[d: flex mr: .5rem]>
							<MenuItem
								.active=(category.id === selectedCategoryId)
								@click.if(jobs && images.every(do |image| image.complete))=changeCategoryId(category.id)>
								category.name
							<Button[ml: .125rem].delete
								route-to="/admin/management/category/delete/{category.id}">
								<i.fas.fa-times>
					<Button.create
						route-to="/admin/management/category/create">
						<i.fas.fa-plus>
				<Images
					.show=(jobs && images.length === jobs.length && images.every(do |image| image.complete))>
					if categories..length
						<Button.create.grid-item
							route-to="/admin/management/job/create">
							<i.fas.fa-plus>
					for job, index in jobs
						<Image.grid-item
							@click=changeJob(job)>
							images[index]
							<div.badge> <i.fas.fa-link>
							<Button[pos: absolute t: 0 r: 0].delete
								route-to="/admin/management/job/delete/{job.id}"
								@click.stop>
								<i.fas.fa-times>
				<Pagination
					.show=(pages && pages.length > 1 && jobs..length)>
					<PaginationButton.prev
						.disabled=(selectedPage === 1)
						@click.if(jobs && images.every(do |image| image.complete))=changePage(selectedPage - 1)>
						<i.fas.fa-chevron-left>
					for page in pages
						<PaginationButton
							.active=(page === selectedPage)
							@click.if(jobs && images.every(do |image| image.complete))=changePage(page)>
							page
					<PaginationButton.next
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

export default Management
