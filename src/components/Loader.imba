tag Loader

	def render
		<self.loader>
			<div>
			<div
				[$delay: 100ms]>
			<div
				[$delay: 200ms]>

	global css
		@keyframes loader-animation
			0% transform: scale(1)
			80% transform: scale(1.6)
			100% transform: scale(1.6)

	css &
		display: flex
		justify-content: center

		div
			$delay: 0ms

			margin-left: 15px
			size: 10px
			border: 3px solid var(--yellow5)
			animation-duration: 500ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-delay: $delay
			animation-iteration-count: infinite
			animation-direction: alternate
			animation-name: loader-animation


export default Loader
