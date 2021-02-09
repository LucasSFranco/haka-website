tag ControlPagination

	prop page
	prop lastPage
	prop loading

	def changeActive pageNumberButton
		let activePageNumberButton = self.querySelector('.active')
		activePageNumberButton.classList.remove('active')
		pageNumberButton.classList.add('active')

	def render
		<self#control-pagination.pause
			@intersect(frame, 1).in=(do this.classList.remove('pause'))>
			if !loading and lastPage > 1
				<PaginationButton.prev .disable=(page === 1)
					@click.emit-changePage(page - 1)>
					<i.fas.fa-chevron-left>
				for number in [1 .. lastPage]
					<PaginationButton.page-number .active=(page === number)
						[$delay: {number*100}ms]
						@click.if(page !== number).emit-changePage(number)>
						number
					delay = number + 1
				<PaginationButton.next .disable=(page === lastPage)
					[$delay: {delay*100}ms]
					@click.emit-changePage(page + 1)>
					<i.fas.fa-chevron-right>

	css &
		display: flex
		margin-top: .5rem
		user-select: none

tag PaginationButton

	def render
		<self>
			<slot>

	css &

		$delay: 0ms

		font-family: 'Poppins'
		display: flex
		align-items: center
		justify-content: center
		border: 1px solid var(--yellow5)
		size: 2rem
		margin-right: .5rem
		cursor: pointer
		font-size: .875rem
		tween: 500ms
		font-weight: 600
		color:  var(--black5)
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $delay
		animation-name: fade-in, slide-in-right

		@hover
			background: var(--yellow2)

		@active
			background: var(--yellow4)
			tween: 100ms

		&.prev.disable, &.next.disable
			background: var(--black2)
			border: 1px solid var(--black2)
			color: var(--black3)
			cursor: default

		&.page-number
			&.active
				background: var(--yellow3)
				cursor: default

export default ControlPagination
