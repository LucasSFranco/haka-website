import HeaderBackground from '#/app-header/HeaderBackground'
import HeaderBanner from '#/app-header/HeaderBanner'

tag Header

	def mount
		window.addEventListener('scroll', &) do
			if window.pageYOffset > document.querySelector('#about').offsetTop
				self.style.visibility = 'hidden'
			if window.pageYOffset <= document.querySelector('#about').offsetTop
				self.style.visibility = 'visible'

	def render
		<self#header
			[d: block w: 100% h: calc(100vh + 1px)]>
			<HeaderBackground>
			<HeaderBanner>

export default Header
