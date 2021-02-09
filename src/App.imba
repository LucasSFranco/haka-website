import 'imba/router'

import '@/style.imba'

import Navbar from 'app/Navbar'
import Header from 'app/Header'
import About from 'app/About'
import Services from 'app/Services'
import Portfolio from 'app/Portfolio'
import Contact from 'app/Contact'
import Footer from 'app/Footer'

import AdminLogin from 'app/admin/AdminLogin'
import AdminControl from 'app/admin/AdminControl'
import JobCreate from 'app/admin/job-crud/Create'
import CategoryCreate from 'app/admin/category-crud/Create'
import JobDelete from 'app/admin/job-crud/Delete'
import CategoryDelete from 'app/admin/category-crud/Delete'

import Auth from 'server/Auth'

tag App

	prop menuItems = {
		header:
			name: 'Home'
			active: !false
		about:
			name: 'Sobre'
			active: !false
		services:
			name: 'Serviços'
			active: !false
		portfolio:
			name: 'Portfólio'
			active: !false
		contact:
			name: 'Contato'
			active: !false
	}
	
	def toggleMenuItem sectionRef
		menuItems[sectionRef].active = !menuItems[sectionRef].active

	def mount
		console.log $.test
		console.log $.toggle

		console.log $.test

	def render
		<self>
			<div route.exact="/">
				<Navbar$
					menuItems=menuItems>
				<Header
					@intersect=toggleMenuItem('header')>
				<About
					@intersect=toggleMenuItem('about')>
				<Services
					@intersect=toggleMenuItem('services')>
				<Portfolio
					@intersect=toggleMenuItem('portfolio')>
				<Contact
					@intersect=toggleMenuItem('contact')>
				<Footer
					@intersect=(do
						let navbarMenu = document.querySelector('#navbar-menu')
						if navbarMenu
							navbarMenu.classList.toggle('footer-fade-in')
							navbarMenu.classList.toggle('footer-fade-out'))
					@intersect.out=(do
						delay = false
						let navbarMenu = document.querySelector('#navbar-menu')
						if navbarMenu
							navbarMenu.classList.remove('delay'))>
			<div route="/admin">
				<AdminLogin route="">
				<div route="control">
					<AdminControl route="">
					<div route="category">
						<CategoryCreate route="create">
						<CategoryDelete route="delete/:id">
					<div route="job">
						<JobCreate route="create">
						<JobDelete route="delete/:id">

imba.mount <App>

