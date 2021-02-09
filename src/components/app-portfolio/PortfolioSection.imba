import Loader from '#/Loader'

tag PortfolioSection

	prop images
	prop loading

	def render
		<self#portfolio-section>
			if loading
				<Loader[py: 10rem]>
			else
				<div.images-wrapper[scale-y: 0]=loading>
					for image in images
						<ImageCard @click.emit-openModal(image.alt)>
							image

	css &
		.images-wrapper
			display: flex
			flex-wrap: wrap
			padding: .5rem 0
			user-select: none
			justify-content: space-between

tag ImageCard

	def render
		<self.pause
			@intersect(frame).in=(do this.classList.remove('pause'))>
			<div.badge> <i.fas.fa-link>
			<slot>

	css &
		width: 100% @md: calc(100% / 3 - .75rem)
		margin: 0
		display: flex
		margin-bottom: 1rem
		cursor: pointer
		pos: relative
		tween: filter 500ms

		@hover
			>> img
				filter: saturate(1)

			.badge
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

export default PortfolioSection
