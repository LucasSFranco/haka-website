tag Message

	<self.message>
		<slot>

	css &
		d: block
		ff: 'Poppins'
		fs: .875rem
		c: grey8
		mb: .5rem

		@selection
			c: white
			bg: blue3

		&.error
			c: red5

		&.success
			c: green5

		>>> span
			c: blue4

			@selection
				c: white
				bg: blue3

export default Message
