import Row from '../../layout/Row'
import Col from '../../layout/Col'
import Corner from '../../layout/Corner'

import '../../../svgs/icons/creation-and-evolution-of-logos'
import '../../../svgs/icons/integrated-communication'
import '../../../svgs/icons/content-for-social-networks'
import '../../../svgs/icons/audiovisuals-and-short-videos'
import '../../../svgs/icons/website-development'
import '../../../svgs/icons/communication-planning'
import '../../../svgs/icons/promocional-and-institucional-campaigns'
import '../../../svgs/icons/social-media-management'

tag ServicesList < Row

	def render
		<self>
			<Col.span-6>
				<ServiceCard>
					<fragment slot="icon">
						<creation-and-evolution-of-logos.svg>
						<Corner.corner.top-left>
						<Corner.corner.bottom-right>
					'Criação e evolução de marcas'
				<ServiceCard>
					<fragment slot="icon">
						<integrated-communication.svg>
						<Corner.corner.top-left>
						<Corner.corner.bottom-left>
					'Comunicação integrada'
				<ServiceCard>
					<fragment slot="icon">
						<promocional-and-institucional-campaigns.svg>
						<Corner.corner.bottom-left>
						<Corner.corner.top-right>
						<Corner.corner.top-left>
					'Campanhas promocionais e institucionais'
				<ServiceCard>
					<fragment slot="icon">
						<audiovisuals-and-short-videos.svg>
						<Corner.corner.bottom-left>
						<Corner.corner.bottom-right>
					'Audiovisuais e short vídeos'
			<Col.span-6>
				<ServiceCard>
					<fragment slot="icon">
						<social-media-management.svg>
						<Corner.corner.top-left>
						<Corner.corner.top-right>
					'Gerenciamento de redes sociais'
				<ServiceCard>
					<fragment slot="icon">
						<content-for-social-networks.svg>
						<Corner.corner.top-left>
						<Corner.corner.bottom-right>
						<Corner.corner.bottom-left>
					'Conteúdo para redes sociais'
				<ServiceCard>
					<fragment slot="icon">
						<website-development.svg>
						<Corner.corner.bottom-left>
						<Corner.corner.top-right>
					'Desenvolvimento de sites'
				<ServiceCard>
					<fragment slot="icon">
						<communication-planning.svg>
						<Corner.corner.bottom-right>
						<Corner.corner.top-right>
					'Planejamento de comunicação'

tag ServiceCard

	notIntersected = true

	def render
		<self.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<div.card-icon>
				<slot name="icon">
			<div.card-wrapper>
				<p.card-description>
					<slot>

	css &
		display: flex
		align-items: center
		margin-bottom: 3rem
		user-select: none

		@hover
			.card-icon
				background: var(--yellow5)

				>> .svg
					fill: var(--black6)

			.card-wrapper
				.card-description
					color: white

					@after
						scale-x: 1

		.card-icon
			tween: 500ms
			size: 5rem
			position: relative
			display: flex
			align-items: center
			justify-content: center
			margin-right: 1.5rem
			animation-duration: 750ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: scale-in

			>> .svg
				fill: var(--black5)
				tween: 500ms
				animation-duration: 750ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-name: fade-in
				scale: .8

			>> .corner
				$corner-delay: 500ms

		.card-wrapper
			width: calc(100% - 5rem - 1.5rem)

			.card-description
				display: inline-block
				font-family: 'Bison'
				font-size: 1.5rem
				color: var(--black5)
				position: relative
				animation-duration: 750ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-name: fade-in, slide-in-right
				tween: 500ms

				@after
					content: ''
					transform-origin: left
					tween: 500ms
					position: absolute
					top: calc(100% + 5px)
					left: 0
					height: 3px
					background: var(--yellow5)
					width: 100%
					scale-x: 0

export default ServicesList
