import Masonry from 'masonry-layout'

import Loader from '../../layout/Loader'

tag Images

	<self.images>
		<Loader>
		<div.grid>
			<slot>

	css &
		w: 100%
		d: block
		pos: relative
		h: calc(20rem + 10px)
		of: hidden

		.grid
			visibility: hidden
			mt: 1rem

		.loader
			w: 100%
			ta: center
			pos: absolute
			visibility: visible
			py: 10rem

			>>> div
				bd: 3px solid var(--yellow5)

			i
				py: 5rem
				fs: 3rem
				c: blue4

		&.show
			h: auto

			.loader
				visibility: hidden

			.grid
				visibility: visible

				>>> .image
					animation-duration: 500ms
					animation-timing-function: ease
					animation-fill-mode: both
					animation-name: fade-in, scale-in-tenth

		>>> .create
			mb: 1rem
			pos: relative
			w: 100%
			pt: 125%

			@md
				w: calc(100% / 3 - 2rem / 3)
				pt: calc(125% / 3 - 2rem / 3)

			i
				t: 50%
				l: 50%
				y: -50%
				x: -50%
				fs: 2rem
				pos: absolute

export default Images
