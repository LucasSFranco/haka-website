
tag Button

	<self.button>
		<slot>

	css &
		d: flex
		fw: 600
		c: white
		us: none
		ai: center
		jc: center
		size: 32px
		fs: .875rem
		ff: 'Poppins'
		tt: uppercase
		cursor: pointer

		&.primary
			bg: grey5

			@hover
				bg: grey6

			@active
				bg: grey7

		&.create
			bg: green5

			@hover
				bg: green6

			@active
				bg: green7

		&.delete
			bg: red5

			@hover
				bg: red6

			@active
				bg: red7

export default Button
