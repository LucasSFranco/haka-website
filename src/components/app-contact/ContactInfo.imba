import Col from '#/Col'
import Corner from '#/Corner'

tag ContactInfo < Col

	def render
		<self#contact-info.span-5.pause
			@intersect(frame, 1).in=(do this.classList.remove('pause'))>
			<ContactCard
				[$delay: 200ms]>
				<fragment slot="icon">
					<i.fa.fa-envelope>
				<p.info> 'juliane@agenciahaka.com.br'
				<p.info> 'sergio@agenciahaka.com.br'
			<ContactCard
				[$delay: 100ms]>
				<fragment slot="icon">
					<i.fa.fa-map-marker-alt>
				<p.info> 'Rua Clevelândia, 589-D'
				<p.info
					[mt: .125rem]> 'B. Jardim Itália - Chapecó, SC'
				<p.info> 'CEP 89802-405'
			<ContactCard>
				<fragment slot="icon">
					<i.fa.fa-phone-alt>
				<p.info> '(49) 3323-6083'
				<p.info> '(49) 98829-6761'

	css &
		margin-bottom: 4rem @md: 0

tag ContactCard

	def render
		<self>
			<div.icon>
				<slot name="icon">
			<div.card-wrapper>
				<slot>
			<Corner.corner.top-left>
			<Corner.corner.top-right>
			<Corner.corner.bottom-left>
			<Corner.corner.bottom-right>

	css &
		$delay: 0ms

		padding: 1rem
		display: flex
		align-items: center
		position: relative
		tween: 500ms
		background: var(--yellow2)
		animation-duration: 250ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $delay
		animation-name: fade-in, slide-in-down

		@not-first
			margin-top: 1rem

		@hover
			background:  var(--yellow3)

			.card-wrapper
				>> .info
					color: var(black6)

		.icon
			display: flex
			align-items: center
			justify-content: center
			margin-right: 1.5rem
			font-size: 1.5rem
			width: 2.5rem
			color: var(--brown5)
			animation-duration: 250ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-delay: calc(600ms + $delay)
			animation-name: fade-in, scale-in

		.card-wrapper
			width: calc(100% - 2.5rem - 1.5rem)

			>> .info
				mt: initial

				font-family: 'Poppins'
				width: 100%
				color:  var(--black5)
				font-size: 14px
				tween: 500ms
				line-height: 1.3
				animation-duration: 500ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-delay: calc(800ms + $delay)
				animation-name: fade-in

				@not-first
					margin-top: .5rem

				@selection
					background: blue3
					color: white

		.corner
			$corner-delay: calc(250ms + $delay)

export default ContactInfo
