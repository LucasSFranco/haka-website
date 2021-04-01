tag Modal

	<self>
		<slot>

	css &
		d: none
		pos: relative
		zi: 999 @md: 99
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-name: fade-in
		animation-delay@xl-md: 500ms

		&.show
			d: block

		&.loading
			>>> .loader
				visibility: visible
			>>> .container
				.container-child
					visibility: hidden

		>>> .loader
			visibility: hidden
			pos: absolute
			w: 85%
			h: 100%

			div
				bd: 3px solid var(--yellow5)

		>>> .container
			pos: fixed
			w: 100vw
			h: 100vh
			t: 0
			l: 0
			bg: black/50
			gtc@lt-md: repeat(12, 1fr) 10%

			div
				d: flex
				jc: center
				ai: flex-start
				gc@lt-md: span 12
				pe: none

			.container-child

				height: 100vh
				ofy: scroll
				visibility: visible
				pe: auto

				&::-webkit-scrollbar
					w: 0
					h: 0

				.image-wrapper
					max-width: 100%
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
				pe: auto
				us: none
				mt: .5rem
				mr: .5rem
				pos: absolute
				t: 0
				r: 0
				fs: 1.5rem
				c: var(--yellow5)
				cursor: pointer
				tween: 500ms
				animation-duration: 500ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-name: fade-in
				animation-delay: 1000ms @md: 500ms

				@hover
					c: var(--yellow6)

				@active
					c: var(--yellow7)
					tween: 100ms

export default Modal
