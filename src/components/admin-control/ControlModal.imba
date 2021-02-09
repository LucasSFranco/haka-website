import Loader from '#/Loader'

tag ControlModal

	prop image
	prop loading
	prop open

	def closeModal
		document.querySelector('html').style.overflowY = 'auto'
		emit('closeModal')

	def render
		<self#control-modal
			.show=open
			.unshow=!open
			@click.self=closeModal>
			<div.modal-wrapper>
				if loading
					<Loader>
				<div.scrollable-container [d: none]=loading>
					image
				<i.fas.fa-times
					@click=closeModal>


	css &

		us: none
		position: fixed
		t: 0
		l: 0
		zi: 1000 @md: 998
		width: 100%
		height: 100vh
		background: black/50
		animation-duration: 500ms
		animation-fill-mode: both
		animation-timing-function: ease
		d: block

		&.show
			animation-name: fade-in

		&.unshow
			animation-name: fade-out
			visibility: hidden
			transition: visibility 0ms ease 500ms

		::-webkit-scrollbar
			width: 3px @md: 10px

		::-webkit-scrollbar-thumb
			background: var(--black5)

		.modal-wrapper
			pos: relative
			width: 100vw
			height: 100%
			d: flex
			jc: center
			ai: center

			@md
				width: 85vw
				margin: 0 7.5vw

			.scrollable-container
				width: 100%
				overflow-y: auto
				height: 100%

				>> img
					width: 100%
					h: auto

			i
				color: var(--yellow5)
				font-size: 1.5rem
				pos: absolute
				t: 2rem
				r: 2rem
				cursor: pointer
				tween: 500ms

				@md
					r: calc(-3.25vw - 10px)

				@hover
					rotate: 180deg
					color: var(--yellow6)

export default ControlModal
