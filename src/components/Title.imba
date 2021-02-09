import Row from '#/Row'
import Col from '#/Col'

tag Title < Row

	def render
		<self.title.pause
			@intersect(frame, 1).in=(do this.classList.remove('pause'))>
			<Col.col.span-12>
				<h1>
					<slot>

	css &
		$justify-content: flex-start

		.col
			display: flex
			justify-content: center @md: $justify-content

			h1
				user-select: none
				font-family: 'Bison'
				font-size: 3rem
				margin-bottom: 5rem
				color: var(--brown5)
				position: relative
				display: inline-block
				animation-duration: 500ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-name: fade-in, slide-in-down

				>> .title-ornament
					$animation-name: none
					$ornament-delay: 250ms

					h: initial
					w: initial
					t: initial
					r: initial
					b: initial
					l: initial

					position: absolute
					background: var(--yellow5)
					animation-duration: 500ms
					animation-timing-function: ease
					animation-fill-mode: both
					animation-delay: 250ms, $ornament-delay
					animation-name: fade-in, $animation-name

				>> small
					t: initial
					r: initial
					b: initial
					l: initial

					position: absolute
					color: var(--yellow3)
					font-size: 1.5rem
					animation-duration: 500ms
					animation-timing-function: ease
					animation-fill-mode: both
					animation-delay: 250ms
					animation-name: fade-in, scale-in-quint

export default Title
