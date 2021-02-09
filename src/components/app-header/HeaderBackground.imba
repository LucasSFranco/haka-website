tag HeaderBackground

	def render
		<self#header-background>
			<img src="/assets/background.svg">

	css &
		z-index: -1
		display: block
		position: relative
		padding-top: 177.77%
		background-color: #46443d

		img
			position: fixed
			top: 0
			right: 0
			left: 0
			bottom: 0

export default HeaderBackground
