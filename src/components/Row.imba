tag Row

	def render
		<self.row>
			<slot>

	css &
		display: grid
		grid-template-columns: 1fr @md: repeat(12, 1fr)
		grid-column-gap@md: 1rem

		&.spacing-xs grid-column-gap@md: .25rem
		&.spacing-sm grid-column-gap@md: .5rem
		&.spacing-md grid-column-gap@md: 1rem
		&.spacing-lg grid-column-gap@md: 2rem
		&.spacing-xl grid-column-gap@md: 4rem

export default Row
