
tag MenuItem

	<self.menu-item>
		<slot>

	css &
		fw: 600
		us: none
		mb: .5rem
		fs: .875rem
		c: black/50
		ff: 'Poppins'
		p: .5rem .75rem
		d: inline-block
		cursor: pointer
		bd: 1px solid var(--yellow5)
		tween: 500ms

		@hover
			bg: var(--yellow2)

		@active
			bg: var(--yellow5)
			tween: 100ms

		&.active
			bg: var(--yellow4)
			cursor: default

export default MenuItem
