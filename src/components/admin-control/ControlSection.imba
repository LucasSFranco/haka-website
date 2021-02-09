import Loader from '#/Loader'

tag ControlSection

	prop images
	prop loading

	def render
		<self#control-section>
			if loading
				<Loader[py: 10rem]>
			else
				<div.images-wrapper[scale-y: 0]=loading>
					for image in images
						<ImageCard @click.emit-openModal(image.alt)>
							image
							<div.delete-button
								@click.stop.emit-deleteJob(image.alt)>
								<i.fas.fa-times>
								'Excluir'

	css &
		.images-wrapper
			display: block
			column-count: 1 @md: 3
			column-gap: 1rem
			column-fill: balance
			padding: .5rem 0
			user-select: none

tag ImageCard

	def render
		<self.pause
			@intersect(frame, .5).in=(do this.classList.remove('pause'))>
			<div.badge> 
				<i.fas.fa-link>
			<slot>

	css &
		margin: 0
		display: flex
		margin-bottom: 1rem
		break-inside: avoid
		cursor: pointer
		pos: relative
		tween: filter 500ms

		@hover
			>> img
				filter: saturate(1)

			.badge
				opacity: 1

			>> .delete-button
				opacity: 1

		>> img
			filter: saturate(.25)
			tween: filter 500ms
			width: 100%
			animation-duration: 500ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: fade-in, scale-in-tenth

		.badge
			z-index: 1
			opacity: 0
			tween: 500ms
			position: absolute
			top: 50%
			left: 50%
			x: -50%
			y: -50%
			color: var(--yellow5)
			display: flex
			justify-content: center
			align-items: center
			size: 3rem
			border-radius: full
			background: var(--black5)

		>> .delete-button
			z-index: 1
			opacity: 0
			tween: 500ms
			width: 100%
			position: absolute
			font-family: 'Poppins'
			text-transform: uppercase 
			bottom: 0
			left: 0
			color: white
			padding: .5rem .75rem
			background: red5
			text-align: center

			@hover
				background: red6

			@active
				background: red7

			i
				margin-right: .5rem

export default ControlSection
