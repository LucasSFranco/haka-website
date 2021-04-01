tag Loader

	<self.loader>
		<div[animation-delay: .0s]>
		<div[animation-delay: .1s]>
		<div[animation-delay: .2s]>

	css &
		d: flex
		size: 10px
		jc: center
		ai: center

		@keyframes loader-animation
			0% transform: scale(1)
			80% transform: scale(1.6)
			100% transform: scale(1.6)

		div
			ml: 1rem
			size: 10px
			bd: 3px solid grey5
			animation-fill-mode: both
			animation-duration: 500ms
			animation-iteration-count: infinite
			animation-timing-function: ease
			animation-direction: alternate
			animation-name: loader-animation


export default Loader
