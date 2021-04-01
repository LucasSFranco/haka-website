
tag Title

	<self.title>
		<slot>

	css &
		d: flex
		jc: space-between
		ai: center
		mb: 2.5rem

		>>> h1
			us: none
			c: grey5
			fs: 2rem
			ff: 'Bison'

		>>> button
			d: inline-block
			cursor: pointer
			c: white
			outline: none
			bg: grey5
			tt: uppercase
			ff: 'Poppins'
			fw: 500
			p: .5rem .75rem
			fs: .875rem

			@hover
				bg: grey6

			@active
				bg: grey7

			i
				mr: .5rem

export default Title
