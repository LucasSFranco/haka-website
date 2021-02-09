tag Form

	def render
		<self.form>
			<slot>

	css &
		width: 400px
		box-shadow: lg
		padding: 1rem
		display: flex
		flex-wrap: wrap
		justify-content: center

export default Form