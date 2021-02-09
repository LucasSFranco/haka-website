tag Title

	def render
		<self.title>
			<slot>

	css &
		font-family: 'Bison'
		color: var(--brown5)
		font-size: 2rem
		margin-bottom: 2rem
		text-align: center
		position: relative
		display: inline-block
		user-select: none

		>> small
			content: 'Serviço'
			text-transform: uppercase
			position: absolute
			top: 0
			left: calc(100% + .25rem)
			font-family: 'Poppins'
			font-size: .75rem
			color: grey5

export default Title