tag Button

	<self.button>
		<slot>

	css &
		fw: 600
		us: none
		c: white
		d: block
		mb: .5rem
		ta: center
		fs: .875rem
		ff: 'Poppins'
		tt: uppercase
		cursor: pointer
		p: .625rem .75rem

		>>> i
			mr: .5rem

		&.primary
			bg: yellow5
			@hover bg: yellow6
			@active bg: yellow7

		&.secondary
			bg: grey5
			@hover bg: grey6
			@active bg: grey7

		&.create
			bg: green5
			@hover bg: green6
			@active bg: green7

		&.delete
			bg: red5
			@hover bg: red6
			@active bg: red7

		&.disabled
			cursor: default
			bg: grey4
			c: grey5
			@hover bg: grey4
			@active bg: grey4

export default Button
