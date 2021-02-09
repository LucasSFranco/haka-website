tag Container

	def render
		<self.container>
			<slot>

	css &
		display: block
		padding: 5rem 5%
		background: white

		@md
			padding: 10rem 7.5%

export default Container