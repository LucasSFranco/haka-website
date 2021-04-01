tag ToTopButton

	def returnToTop
		window.scrollTo(0, 0)

	def render
		<self.to-top-button @click=returnToTop>
			<i.fas.fa-angle-double-up>
			'Voltar ao início'

	css &
		user-select: none
		display: block
		padding: 1rem
		color: white
		font-family: 'Bison'
		font-size: 1.5rem
		margin-top: calc(12.25rem - 3px)
		text-align: center
		background: var(--black2)
		cursor: pointer
		tween: 500ms
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: 1200ms
		animation-name: fade-in, scale-in-quint

		@hover
			background: var(--black3)

		@active
			background: var(--black4)
			tween: 100ms

		i
			margin-right: 1rem

export default ToTopButton
