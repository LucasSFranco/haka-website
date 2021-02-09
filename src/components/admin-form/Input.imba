tag Input

	prop type = "text"
	prop message = ""
	prop data = ""

	attr color = "primary"

	def render
		<self.input>
			<label> <slot>
			<input type=type bind=data>
			<small> message

	css &
		w: 100%
		us: none
		mb: .5rem

		label
			fs: .75rem
			tt: uppercase
			ff: 'Poppins'

		input
			ff: 'Poppins'
			w: 100%
			fs: .875rem
			p: .5rem .75rem
			outline: none
			us: auto
			c: grey8

		small
			mt: .25rem
			d: block
			lh: 1
			fs: .75rem

		&[color="primary"]
			label c: grey5
			input bd: grey5
			small c: grey5
		&[color="danger"]
			label c: red5
			input bd: red5
			small c: red5
		&[color="success"]
			label c: green5
			input bd: green5
			small c: green5

export default Input
