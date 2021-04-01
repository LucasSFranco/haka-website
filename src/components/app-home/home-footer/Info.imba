import Col from '../../layout/Col'
import Corner from '../../layout/Corner'

import icon-email from '../../../svgs/icons/icon-email'
import icon-address from '../../../svgs/icons/icon-address'
import icon-phone from '../../../svgs/icons/icon-phone'
import icon-whatsapp from '../../../svgs/icons/icon-whatsapp'

tag Info < Col

	notIntersected = true

	def render
		<self.info.span-6.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<ContactCard
				[$delay: 300ms]>
				<fragment slot="icon">
					<icon-email.icon>
				<p.info> <a target="_blank" href="mailto:juliane@agenciahaka.com.br"> 'juliane@agenciahaka.com.br'
				<p.info> <a target="_blank" href="mailto:sergio@agenciahaka.com.br"> 'sergio@agenciahaka.com.br'
			<ContactCard
				[$delay: 200ms]>
				<fragment slot="icon">
					<icon-address.icon>
				<p.info> 'Rua Clevelândia, 589-D'
				<p.info
					[mt: .125rem]> 'B. Jardim Itália - Chapecó, SC'
				<p.info> 'CEP 89802-405'
			<ContactCard
				[$delay: 100ms]>
				<fragment slot="icon">
					<icon-phone.icon>
				<p.info> '(49) 3323-6083'
			<ContactCard>
				<fragment slot="icon">
					<icon-whatsapp.icon>
				<p.info> '(49) 98829-6761'

	css &
		margin-bottom: 4rem @md: 0

tag ContactCard

	def render
		<self>
			<slot name="icon">
			<div.card-wrapper>
				<slot>
			<Corner[bc: var(--black3)].corner.top-left>
			<Corner[bc: var(--black3)].corner.top-right>
			<Corner[bc: var(--black3)].corner.bottom-left>
			<Corner[bc: var(--black3)].corner.bottom-right>

	css &
		$delay: 0ms

		padding: 1rem
		display: flex
		align-items: center
		position: relative
		tween: 500ms
		background: var(--black2)
		animation-duration: 250ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-delay: $delay
		animation-name: fade-in, slide-in-down

		@not-first
			margin-top: 1rem

		@hover
			background:  var(--black3)

			.card-wrapper
				>>> .info
					color: var(--black7)

			>>> .icon
				fill: white

		>>> .icon
			svg
				h: auto
			display: flex
			align-items: center
			justify-content: center
			margin-right: 1.5rem
			font-size: 1.5rem
			width: 2.5rem
			fill: var(--white9)
			tween: 500ms
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

				a
					c: blue6
					tween: 500ms

					@hover
						c: blue7

					@active
						c: blue8
						tween: 100ms

		.corner
			$corner-delay: calc(250ms + $delay)

export default Info
