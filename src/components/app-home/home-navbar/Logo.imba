import 'svgs/app-logo'

tag Logo

	prop delay = true

	def changeColor
		const services = document.querySelector('#services .container')
		const scrollPos = window.pageYOffset
		if scrollPos >= services.offsetTop && scrollPos <= services.offsetTop + services.clientHeight
			document.querySelector('#navbar-logo').style.backgroundColor = "var(--yellow5)"
			document.querySelector('.symbol').style.transition = "500ms"
			document.querySelector('.symbol').style.fill = "var(--brown5)"
		else
			document.querySelector('#navbar-logo').style.backgroundColor = "var(--brown5)"
			document.querySelector('.symbol').style.transition = "500ms"
			document.querySelector('.symbol').style.fill = "var(--yellow5)"

	def mount
		window.addEventListener('scroll', changeColor)

	def unmount
		window.removeEventListener('scroll', changeColor)

	def render
		<self#navbar-logo.in>
			<app-logo>

	css &
		pos: absolute
		width: 100%
		margin-left: 0
		display: inline-block
		padding: 1rem 5% 1rem
		background: var(--brown5)
		animation-duration: 500ms @md: 1000ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-name: fade-in, slide-in-up
		tween: 500ms

		&.in
			animation-delay@lt-md: 500ms
			animation-name@lt-md: fade-in

		&.out
			animation-name@lt-md: fade-out

		@md
			width: auto
			margin-left: calc(7.5% - 1rem)
			padding: 1.5rem 2rem 1rem

export default Logo
