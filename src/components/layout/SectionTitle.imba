import Row from './Row'
import Col from './Col'

tag SectionTitle < Row

	notIntersected = true

	def render
		<self.title.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<Col.col.span-12>
				<h1>
					<slot>

	css &
		$justify-content: flex-start
		$color: var(--brown5)

		.col
			display: flex
			justify-content: center @md: $justify-content

			h1
				user-select: none
				font-family: 'Bison'
				font-size: 3rem
				margin-bottom: 5rem
				color: $color
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

export default SectionTitle
