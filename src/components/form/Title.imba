tag Title

	<self.title>
		<h1>
			<slot>

	css &
		us: none
		d: block
		mb: 2.5rem
		ta: center

		&.secondary
			h1
				c: grey5

		&.delete
			h1
				c: red5

		&.create
			h1
				c: green5

		h1
			c: blue4
			ff: 'Bison'
			fs: 2rem
			pos: relative
			d: inline-block

			>>> small
				c: grey5
				ff: 'Poppins'
				fs: .75rem
				tt: uppercase
				pos: absolute
				t: 0
				l: calc(100% + .25rem)


export default Title
