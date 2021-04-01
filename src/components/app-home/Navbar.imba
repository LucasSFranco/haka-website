import Logo from './home-navbar/Logo'
import Menu from './home-navbar/Menu'

tag Navbar

	prop navMenuFadeIn
	prop navMenuFadeOut

	def render
		<self.navbar>
			<Logo
				fadeIn=navMenuFadeIn
				fadeOut=navMenuFadeOut
				delay=delay>
			<Menu
				fadeIn=navMenuFadeIn
				fadeOut=navMenuFadeOut
				delay=delay
				menuItems=menuItems>

	css &
		width: 100%
		height: auto
		position: fixed
		z-index: 999

		@md
			height: 0

export default Navbar
