
tag Image

	<self.image>
		<slot>

	css &
		mb: 1rem
		pos: relative
		d: flex
		w: 100%
		us: none
		cursor: pointer

		>>> .badge
			z-index: 1
			opacity: 0
			position: absolute
			top: 50%
			left: 50%
			x: -50%
			y: -50%
			color: grey5
			display: flex
			justify-content: center
			align-items: center
			size: 3rem
			border-radius: full
			background: var(--black5)

		@hover
			>>> .badge
				o: 1

		@md
			w: calc(100% / 3 - 2rem / 3)

		>>> img
			w: 100%

export default Image
