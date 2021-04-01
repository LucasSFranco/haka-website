tag Modal

	<self>
		<slot>

	css &
		d: none

		&.show
			d: block


		&.loading
			>>> .loader
				visibility: visible
			>>> .container
				.container-child
					visibility: hidden

		>>> .container
			gtc@lt-md: repeat(12, 1fr) 10%

			div
				gc@lt-md: span 12

		>>> .loader
			w: min-content
			visibility: hidden
			pos: absolute
			t:50%
			l:50%
			transform: translate(-50%, -50%)

		>>> .container
			pos: fixed
			w: 100vw
			h: 100vh
			t: 0
			l: 0
			bg: black/50

			zi: 9999

			d: flex
			jc: center
			ai: flex-start

			.container-child
				height: 100vh
				ofy: scroll
				visibility: visible

				&::-webkit-scrollbar
					w: 0
					h: 0

				.image-wrapper
					min-width: 100%
					min-height: 100vh
					d: flex
					ai: center

					img
						object-fit: scale-down;
						object-position: top;
						us: none
						max-width: 100%
						mb: -3px

			i
				us: none
				mt: .5rem
				mr: .5rem
				pos: fixed
				t: 0
				r: 0
				fs: 1.5rem
				c: grey5
				cursor: pointer

				@hover
					c: grey6

				@active
					c: grey7

export default Modal
