import Row from '#/Row'
import Col from '#/Col'
import Corner from '#/Corner'

tag AboutText < Col

	def render
		<self#about-text.span-5.pause
			@intersect(frame, .5).in=(do this.classList.remove('pause'))>
			<p> 'Labore eu pariatur in est deserunt fugiat nulla est consectetur sint laboris eu. Laboris sint magna ut esse do velit aliquip ullamco Lorem adipisicing tempor irure. Consequat eu ut velit cillum exercitation do aliquip. Anim velit duis enim minim in anim id irure esse tempor tempor. Labore quis voluptate nostrud esse ex nisi eiusmod qui fugiat non culpa nisi consectetur.'
				<Corner.corner.top-right>
				<Corner.corner.top-left>
				<Corner.corner.bottom-right>
				<Corner.corner.bottom-left>

	css &
		margin-bottom: 4rem @md: 0

		p
			padding: 1rem
			font-family: 'Poppins'
			text-align: justify
			background: var(--yellow2)
			color: var(--black5)
			font-weight: 500
			line-height: 2
			position: relative
			user-select: none
			animation-duration: 1000ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: fade-in
			tween: 500ms

			@hover
				background: var(--yellow3)
				color: var(--black6)

			.corner
				$corner-delay: 500ms

export default AboutText
