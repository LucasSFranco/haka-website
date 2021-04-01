import Background from './home-header/Background'
import Banner from './home-header/Banner'

tag Header

	notIntersected = true

	def mount
		window.addEventListener('scroll', &) do
			if window.pageYOffset > document.querySelector('#about').offsetTop
				self.style.visibility = 'hidden'
			if window.pageYOffset <= document.querySelector('#about').offsetTop
				self.style.visibility = 'visible'

	def render
		<self#header
			[d: block w: 100% h: calc(100vh + 1px)]
			.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<Background>
			<Banner>

export default Header
