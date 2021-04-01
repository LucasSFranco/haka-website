tag Row

	<self.row>
		<slot>

	css &
		d: grid
		gtc: 1fr @md: repeat(12, 1fr)

		&.xs gcg@md: .25rem
		&.sm gcg@md: .5rem
		&.md gcg@md: 1rem
		&.lg gcg@md: 2rem
		&.xl gcg@md: 4rem

export default Row
