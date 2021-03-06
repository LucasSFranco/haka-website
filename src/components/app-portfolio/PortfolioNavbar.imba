tag PortfolioNavbar

	prop categories
	prop loading

	def changeActive navItem
		let activeNavItem =	self.querySelector('.active')
		activeNavItem.classList.remove('active')
		navItem.classList.add('active')

	def render
		<self#portfolio-navbar.pause
			@intersect(frame, 1).in=(do this.classList.remove('pause'))>
			unless loading
				<NavItem.active
					@click.emit-changeCategoryId(null)=changeActive(this)>
					'Tudo'
				for category, multiplier in categories
					<NavItem
						[$delay: {(multiplier + 1) * 100}ms]
						@click.emit-changeCategoryId(category.id)=(do
							changeActive(this))>
						category.name

	css &
		display: flex
		flex-wrap: wrap
		user-select: none

tag NavItem

	def render
		<self>
			<slot>

	css
		$delay: 0ms

		font-family: 'Poppins'
		padding: .5rem .75rem
		border: 1px solid var(--yellow5)
		margin-right: .5rem
		cursor: pointer
		font-size: .875rem
		tween: 500ms
		font-weight: 600
		color:  var(--black5)
		margin-bottom: .5rem
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $delay
		animation-name: fade-in, slide-in-right

		@hover
			background: var(--yellow2)

		@active
			background: var(--yellow4)
			tween: 100ms

		&.active
			background: var(--yellow3)
			cursor: default

export default PortfolioNavbar
