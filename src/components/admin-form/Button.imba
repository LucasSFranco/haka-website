tag Button

	def render
		<self.button.primary>
			<slot>

	css &
		outline: none
		text-align: center
		width: 100%
		color: white
		font-family: 'Poppins'
		padding: .75rem 1rem
		font-size: .875rem
		text-transform: uppercase
		font-weight: 500
		cursor: pointer
		tween: 500ms
		user-select: none

		>> i
			margin-right: .5rem

		&.primary
			background: var(--yellow5)
			
			@hover
				background: var(--yellow6)
			
			@active
				background: var(--yellow7)

		&.secondary
			background: grey5
			
			@hover
				background: grey6
			
			@active
				background: grey7

export default Button