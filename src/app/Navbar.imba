import NavbarLogo from '#/app-navbar/NavbarLogo'
import NavbarMenu from '#/app-navbar/NavbarMenu'

tag Navbar

	prop navMenuFadeIn
	prop navMenuFadeOut

	set test value
		#test = value

	get test
		#test || false

	def toggle
		test = true

	def render
		<self#navbar>
			<NavbarLogo
				fadeIn=navMenuFadeIn
				fadeOut=navMenuFadeOut
				delay=delay>
			<NavbarMenu
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