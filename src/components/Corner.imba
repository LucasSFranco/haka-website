tag Corner

	def render
		<self.corner>

	css &
		$corner-delay: 0ms
		border-color: var(--yellow5)

		border-style: solid
		position: absolute
		size: 1rem
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $corner-delay

		&.top-left
			top: -3px
			left: -3px
			border-top-width: 3px
			border-left-width: 3px
			animation-name: fade-in, slide-in-top-left

		&.top-right
			top: -3px
			right: -3px
			border-top-width: 3px
			border-right-width: 3px
			animation-name: fade-in, slide-in-top-right

		&.bottom-left
			bottom: -3px
			left: -3px
			border-bottom-width: 3px
			border-left-width: 3px
			animation-name: fade-in, slide-in-bottom-left

		&.bottom-right
			bottom: -3px
			right: -3px
			border-bottom-width: 3px
			border-right-width: 3px
			animation-name: fade-in, slide-in-bottom-right

export default Corner
