tag Message

	def render
		<self.message.primary>
			<slot>

	css &
		font-family: 'Poppins'
		font-size: .875rem
		margin-top: .5rem
		width: 100%

		&.primary
			color: grey5

		&.error
			color: red5

		&.success
			color: green5

export default Message