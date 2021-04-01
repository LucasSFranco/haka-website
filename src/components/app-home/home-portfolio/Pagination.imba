tag Pagination

	notIntersected = true

	<self.pagination.pause=notIntersected
		@intersect(frame)=(do
			if e.entry.isIntersecting
				notIntersected=false)>
		<slot>

	css &
		d: flex
		flw: wrap
		ai: flex-start
		visibility: hidden

		&.show
			visibility: visible

			>>> .pagination-button
				animation-duration: 500ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-name: fade-in, slide-in-right

export default Pagination
