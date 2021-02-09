import 'svgs/app-logo'

tag NavbarLogo

	prop delay = true

	def render
		<self#navbar-logo.in>
			<app-logo>

	css &
		width: 100%
		margin-left: 0
		display: inline-block
		padding: 1rem 5% 1rem
		background: var(--brown5)
		animation-duration: 500ms @md: 1000ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-name: fade-in, slide-in-up

		&.in
			animation-delay@lt-md: 500ms
			animation-name@lt-md: fade-in

		&.out
			animation-name@lt-md: fade-out
		
		@md
			width: auto
			margin-left: calc(7.5% - 1rem)
			padding: 1.5rem 2rem 1rem

export default NavbarLogo
