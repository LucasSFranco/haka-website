tag Menu

	prop menuItems

	def scrollToSection sectionRef
		if sectionRef == 'header'
			window.scrollTo(0, 0)
		else
			let section = document.querySelector("#{sectionRef}")
			window.scrollTo(0, section.offsetTop + 1)

	def render
		<self#navbar-menu.in.footer-fade-out>
			<div.first-wrapper>
				<div.menu-wrapper>
					<h1.menu-title @click=(do self.classList.toggle('active'))>
						'Menu'
						<i.fas.fa-bars>
					for own sectionRef, menuItem of menuItems
						<div.menu-item .active=menuItem.active @click=scrollToSection(sectionRef)>
							<div.indicator-wrapper>
								<div.indicator>
							<a.description> menuItem.name

	css &
		mt: 3.6875rem
		display: block
		user-select: none
		animation-duration: 1000ms
		animation-timing-function: ease
		animation-fill-mode: backwards

		&.in
			animation-name: fade-in
			animation-delay: 1000ms

		&.out
			animation-name: fade-out
			transition-property: visibility
			transition-duration: 0ms
			transition-delay: 1000ms
			visibility: hidden

		&.footer-fade-in
			@md
				opacity: 1
				transition-property: opacity
				transition-timing-function: ease
				transition-duration: 500ms

		&.footer-fade-out
			@md
				opacity: 0
				visibility: hidden
				transition-property: opacity, visibility
				transition-timing-function: ease
				transition-duration: 500ms, 0ms
				transition-delay: 0ms, 1000ms

		&.active
			@lt-md
				@keyframes
					scale-in
						0% transform: scale(0)
						100% transform: scale(1)
					scale-out
						0% transform: scale(1)
						100% transform: scale(0)

				.menu-wrapper
					height: calc(5 * 38px)

					.menu-item
						width: 100%
						padding: 0 5%

						@hover
							background: var(--brown7)

						.description
							padding: .75rem .5rem
							opacity: 1
							scale-x: 1
							transition-delay: 1000ms, 500ms

		.menu-wrapper
			height: 31px
			background: var(--brown6)
			position: relative
			display: flex
			flex-wrap: wrap
			justify-content: space-around
			transition-delay: 500ms
			transition-duration: 500ms
			transition-property: height

			.menu-title
				font-family: 'Bison'
				position: absolute
				bottom: calc(100% + 1.75rem)
				y: 50%
				right: 5%
				font-size: 1.25rem
				color: white
				cursor: pointer
				tween: 500ms

				@hover
					color: var(--yellow3)

				i
					margin-left: .5rem

			.menu-item
				box-sizing: content-box
				align-items: center
				width: 15px
				padding: 0 8px
				display: flex
				cursor: pointer
				transition-delay: 500ms
				transition-duration: 0ms
				transition-property: width, padding

				&.active
					.indicator-wrapper
						.indicator
							size: 15px
							border-width: 4px

					@hover
						.indicator-wrapper
							.indicator
								border-width: 6px

				@hover
					.indicator-wrapper
						.indicator
							border-width: 4px

					.description
						color: var(--yellow3)

				.indicator-wrapper
					width: 15px
					height: 31px
					display: flex
					justify-content: center
					align-items: center

					.indicator
						size: 10px
						border-color: var(--yellow5)
						border-style: solid
						border-width: 3px
						animation-duration: 500ms
						animation-timing-function: ease
						animation-fill-mode: both, forwards
						animation-delay: 0ms, 1000ms
						animation-name: scale-out, scale-in
						transition-timing-function: ease-out
						transition-duration: 50ms, 100ms
						transition-property: border, width, height

				.description
					color: white
					font-size: .875rem
					font-family: 'Poppins'
					width: calc(100% - 15px)
					opacity: 0
					scale-x: 0
					padding: 0
					transition-delay: 0ms, 500ms
					transition-duration: 500ms, 0ms
					transition-property: opacity, transform, padding

		@md
			mt: 0
			.first-wrapper
				width: 7.5%
				display: flex
				align-items: center
				justify-content: center
				height: 100vh
				right: 0
				top: 0
				position: absolute
				transition-delay: 300ms
				transition-duration: 500ms
				transition-property: width, background

				@hover
					background: var(--brown5)
					width: 200px
					transition-delay: 0ms

					.menu-wrapper
						width: 60%
						transition-delay: 0ms

						.menu-title
							cursor: initial
							left: 0
							rotate: 0deg
							transition-delay: 200ms, 0ms
							transition-duration: 500ms
							transition-timing-function: ease-in, ease

						.menu-item
							width: 100%

							.description
								padding: 0 .5rem
								opacity: 1
								scale-x: 1
								transition-delay: 500ms, 0ms

				.menu-wrapper
					background: initial
					display: initial
					height: initial

					width: 31px
					position: absolute
					transition-delay: 300ms
					transition-duration: 500ms
					transition-property: width

					.menu-title
						color: var(--yellow3)
						font-size: 1.5rem
						rotate: -90deg
						left: calc(50% + 12px)
						bottom: calc(100% + 2rem)
						transform-origin: bottom left
						transition-timing-function: ease, ease-out
						transition-delay: 0ms, 350ms
						transition-duration: 500ms
						transition-property: transform, left

						i
							display: none

					.menu-item
						margin-bottom: 1rem

						.description
							transition-delay: 0ms, 500ms
							transition-duration: 500ms, 0ms

export default Menu
