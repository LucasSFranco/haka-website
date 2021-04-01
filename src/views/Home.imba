import Navbar from '../components/app-home/Navbar'
import Header from '../components/app-home/Header'
import About from '../components/app-home/About'
import Services from '../components/app-home/Services'
import Portfolio from '../components/app-home/Portfolio'
import Contact from '../components/app-home/Contact'
import Footer from '../components/app-home/Footer'

tag Home

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

	<self.home>
		<Navbar
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

export default Home
