tag PaginationButton

	<self.pagination-button>
		<slot>

	css &
		d: flex
		fw: 600
		us: none
		mr: .5rem
		mb: .5rem
		size: 32px
		ai: center
		jc: center
		fs: .875rem
		c: black/50
		ff: 'Poppins'
		cursor: pointer
		bd: 1px solid var(--yellow5)
		tween: 500ms

		&.disabled
			bg: var(--black2)
			c: var(--black3)
			bd: 1px solid var(--black2)
			cursor: default

			@hover
				bg: var(--black2)

			@active
				bg: var(--black2)

		@hover
			bg: var(--yellow2)

		@active
			bg: var(--yellow5)
			tween: 100ms

		&.active
			bg: var(--yellow4)
			cursor: default

export default PaginationButton
