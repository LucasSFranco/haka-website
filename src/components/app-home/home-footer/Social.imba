import Row from '../../layout/Row'
import Col from '../../layout/Col'
import Corner from '../../layout/Corner'

tag Social < Col

	def render
		<self.social.span-5>
			<SocialTitle>
			<div.social-wrapper>
				<SocialCard
					href="https://www.facebook.com/hakamulticomunicativa"
					target="_blank">
					<i.fab.fa-facebook-f>
					<Corner.corner.top-right
						[$corner-delay: 500ms]>
					<Corner.corner.top-left
						[$corner-delay: 500ms]>
				<SocialCard
					href="https://www.instagram.com/hakamulticomunicativa/"
					target="_blank"
					[$delay: 100ms]>
					<i.fab.fa-instagram>
					<Corner.corner.top-right
						[$corner-delay: 600ms]>
					<Corner.corner.bottom-left
						[$corner-delay: 600ms]>
				<SocialCard
					href="https://www.behance.net/agenciahaka"
					target="_blank"
					[$delay: 200ms]>
					<i.fab.fa-behance>
					<Corner.corner.top-left
						[$corner-delay: 700ms]>
					<Corner.corner.bottom-left
						[$corner-delay: 700ms]>
					<Corner.corner.bottom-right
						[$corner-delay: 700ms]>
				<SocialCard
					[$delay: 300ms]>
					<i.fab.fa-linkedin-in>
					<Corner.corner.top-right
						[$corner-delay: 800ms]>
					<Corner.corner.bottom-right
						[$corner-delay: 800ms]>

	css &
		.social-wrapper
			display: flex

tag SocialTitle < Row

	def render
		<self>
			<Col.span-12>
				<div.title> 'Acompanhe nosso trabalho'

	css &
		.title
			user-select: none
			display: inline-block
			font-family: 'Bison'
			color: var(--brown5)
			font-size: 1.75rem
			margin-bottom: 3rem
			position: relative
			animation-duration: 500ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: fade-in, slide-in-down

			@after, @before
				content: ''
				background: white
				position: absolute
				animation-duration: 500ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-delay: 500ms

			@after
				bottom: calc(100% + 5px)
				right: -10px
				height: 3px
				width: 50px
				animation-name: fade-in, slide-in-right
				animation-delay: 600ms

			@before
				top: calc(100% + 5px)
				left: -5px
				height: 5px
				width: 90px
				animation-name: fade-in, slide-in-left

tag SocialCard < a

	def render
		<self>
			<slot>

	css &
		$delay: 0ms

		position: relative
		td: none
		display: flex
		background: var(--black2)
		size: 2.5rem
		align-items: center
		justify-content: center
		tween: 500ms
		cursor: pointer
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $delay
		animation-name: fade-in, slide-in-down

		@not-first
			margin-left: 2rem

		@hover
			background: var(--black3)

		@active
			background: var(--black4)
			tween: 100ms

			>> .corner
				border-color@force: var(--black4)
				tween: 100ms

		>> .corner
			border-color: var(--black3)
			tween: 500ms

		>> i
			color: white
			font-size: 1.25rem

export default Social
