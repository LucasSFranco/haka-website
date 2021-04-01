import Col from '../../layout/Col'

tag Membership < Col

	def render
		<self.membership.span-7>
			<MemberCard
				[l@md: 15% t@md: 1rem]>
				<fragment slot="image">
					<div>
				<h3.card-title>
					'Sérgio Rogério Franco'
				<p.card-description>
					'Minim et anim dolore ad velit in ullamco voluptate voluptate irure.'
			<MemberCard
				[t@md: 3rem]
				[$text-align: right $justify-content: flex-end]>
				<fragment slot="image">
					<div
						[animation-name@lt-md: fade-in, slide-out-top-left]>
				<h3.card-title>
					'Juliane Cristina Surdi Franco'
				<p.card-description>
					'Officia do id do mollit velit labore. Voluptate voluptate ea duis do est.'

tag MemberCard

	notIntersected = true

	def render
		<self.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<div.card-image>
				<slot name="image">
			<div.card-wrapper>
				<slot>

	css &
		$justify-content: flex-start
		$text-align: left

		t: initial
		l: initial
		b: initial
		r: initial

		margin-top@not-first: 1.5rem @md: 0rem
		user-select: none
		display: flex
		justify-content: $justify-content @md: flex-start
		flex-wrap: wrap @md: nowrap
		position: relative
		width: 100% @md: 85%
		align-items: center
		animation-duration: 500ms
		animation-timing-function: ease
		animation-fill-mode: both
		animation-name: fade-in

		.card-image
			margin-right: 0rem @md: 2.5rem
			position: relative
			size: 150px
			animation-duration: 750ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: fade-in

			@after
				content: ''
				position: absolute
				size: 150px
				border: 1px solid var(--yellow5)
				z-index: -1

			>> div
				animation-name@lt-md: fade-in, slide-out-top-right

				position: absolute
				background: grey3
				size: 100%
				animation-duration: 750ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-delay: 100ms
				animation-name: fade-in, slide-out-top-right

		.card-wrapper
			width: 85% @md: calc(100% - 150px - 2.5rem)
			padding-bottom: 1rem
			text-align: $text-align @md: left

			>> .card-title
				margin-top: 1.5rem @md: 0rem
				font-family: 'Bison'
				color: var(--yellow5)
				font-size: 1.5rem
				margin-bottom: 1rem
				animation-duration: 1000ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-delay: 400ms
				animation-name: fade-in

			>> .card-description
				font-family: 'Poppins'
				color: var(--black5)
				font-weight: 500
				font-size: .875rem
				line-height: 1.5
				animation-duration: 1000ms
				animation-timing-function: ease
				animation-fill-mode: both
				animation-delay: 450ms
				animation-name: fade-in

export default Membership
