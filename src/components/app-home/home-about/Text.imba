import Col from '../../layout/Col'
import Corner from '../../layout/Corner'

tag Text < Col

	notIntersected = true

	def render
		<self.text.span-12.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<p>
				<span> 'Ut eiusmod est qui laborum nulla irure mollit quis incididunt qui officia irure non. Excepteur laboris exercitation enim cillum mollit elit amet consequat proident adipisicing sit ullamco. Pariatur Lorem reprehenderit sunt ea non eu mollit ad nulla duis laborum id minim non. Deserunt nulla ea sunt adipisicing et cillum voluptate ut labore nisi et est proident do. Id dolor sint dolor proident culpa irure aute do et. Veniam ad ea ullamco reprehenderit sint commodo ipsum reprehenderit sit culpa nisi. Quis deserunt culpa aliqua excepteur do nostrud.'

				<span> 'Et cillum laboris enim anim ea. Anim magna velit cupidatat esse enim nulla non excepteur excepteur proident proident. Id commodo mollit laboris eiusmod tempor aliqua pariatur velit. Proident ullamco do duis adipisicing voluptate est labore sint dolore ullamco eiusmod ea elit. Ipsum esse irure adipisicing ullamco et commodo eu minim ullamco. Officia incididunt commodo culpa laborum.Labore eu pariatur in est deserunt fugiat nulla est consectetur sint laboris eu. Laboris sint magna ut esse do velit aliquip ullamco Lorem adipisicing tempor irure. Consequat eu ut velit cillum exercitation do aliquip. Anim velit duis enim minim in anim id irure esse tempor tempor. Labore quis voluptate nostrud esse ex nisi eiusmod qui fugiat non culpa nisi consectetur.'
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

			span
				d: block
				mb: 1rem

			@hover
				background: var(--yellow3)
				color: var(--black6)

			.corner
				$corner-delay: 500ms

export default Text
