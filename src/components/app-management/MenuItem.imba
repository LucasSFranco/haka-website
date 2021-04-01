
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
		bd: 1px solid grey5

		@hover
			bg: grey2

		@active
			bg: grey5

		&.active
			bg: grey4
			cursor: default

export default MenuItem
