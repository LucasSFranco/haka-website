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
		bd: 1px solid grey5

		&.disabled
			bg: grey3
			c: grey5
			cursor: default

			@hover
				bg: grey3

			@active
				bg: grey3

		@hover
			bg: grey2

		@active
			bg: grey5

		&.active
			bg: grey4
			cursor: default

export default PaginationButton
