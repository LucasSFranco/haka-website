tag Banner

	<self.banner>
		<h4> 'O principal é...'
		<h3
			[animation-delay: 100ms]> 'Não repetir fórmulas,'
		<h2
			[animation-delay: 200ms]> 'Não fazer igual,'
		<h1
			[animation-delay: 300ms]> 'Não ser mais um.'

	css &
		z-index: -1
		width: 90%
		display: block
		top: calc(50vh + 45px) @md: 50vh
		y: -50%
		left: 5% @md: 7.5%
		position: fixed

		h4, h3, h2, h1
			font-family: 'Bison'
			animation-duration: 1000ms
			animation-fill-mode: both
			animation-timing-function: ease
			animation-name: fade-in, slide-in-left

		h4
			color: white
			margin-bottom: 1rem
			font-size: 2.75rem @md: 2.5rem

		h3, h2, h1
			color: var(--yellow5)

		h3
			margin-left: 3rem
			font-size: 3rem

		h2
			margin-left: 1.5rem
			font-size: 3.5rem

		h1
			margin-left: 4.5rem
			font-size: 4rem

export default Banner
