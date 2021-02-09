tag Col

	def render
		<self.col>
			<slot>

	css &
		display: block
		grid-column-end: span 12 @md: span 6

		&.span-1 grid-column-end@md: span 1
		&.span-2 grid-column-end@md: span 2
		&.span-3 grid-column-end@md: span 3
		&.span-4 grid-column-end@md: span 4
		&.span-5 grid-column-end@md: span 5
		&.span-6 grid-column-end@md: span 6
		&.span-7 grid-column-end@md: span 7
		&.span-8 grid-column-end@md: span 8
		&.span-9 grid-column-end@md: span 9
		&.span-10 grid-column-end@md: span 10
		&.span-11 grid-column-end@md: span 11
		&.span-12 grid-column-end@md: span 12

		&.offset-1 grid-column-start@md: 1
		&.offset-2 grid-column-start@md: 2
		&.offset-3 grid-column-start@md: 3
		&.offset-4 grid-column-start@md: 4
		&.offset-5 grid-column-start@md: 5
		&.offset-6 grid-column-start@md: 6
		&.offset-7 grid-column-start@md: 7
		&.offset-8 grid-column-start@md: 8
		&.offset-9 grid-column-start@md: 9
		&.offset-10 grid-column-start@md: 10
		&.offset-11 grid-column-start@md: 11
		&.offset-12 grid-column-start@md: 12

export default Col
