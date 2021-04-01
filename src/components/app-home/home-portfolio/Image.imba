
tag Image

	notIntersected = true

	<self.image.pause=notIntersected
		@intersect(frame)=(do
			if e.entry.isIntersecting
				notIntersected=false)>
		<slot>
		<div.badge>
			<i.fas.fa-link>

	css &
		mb: 1rem
		pos: relative
		d: flex
		w: 100%
		us: none
		cursor: pointer

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

		@hover
			.badge
				opacity: 1

		@md
			w: calc(100% / 3 - 2rem / 3)

		>>> img
			w: 100%

export default Image
