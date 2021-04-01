tag Input

	data = null
	type = 'text'
	disabled = false
	autofocus = false

	<self.input
		.disabled=disabled>
		<label> <slot>
		<input
			type=type
			disabled=disabled
			autofocus=autofocus
			bind=data>

	css &
		d: block
		mb: .5rem

		&.disabled
			input
				bg: grey2
				bd: 1px solid grey4

		label
			d: block
			ff: 'Poppins'
			fs: .75rem
			tt: uppercase
			c: grey5

		input
			d: block
			w: 100%
			bd: 1px solid grey5
			p: .34375rem .75rem
			outline: none
			ff: 'Poppins'
			fs: .875rem
			c: grey8

export default Input
