import Col from '../../layout/Col'

tag Form < Col

	notIntersected = true

	def render
		<self.form.span-7.pause=notIntersected
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<input placeholder="Nome">
			<input
				[$delay: 100ms]
				placeholder="E-mail">
			<input
				[$delay: 200ms]
				placeholder="Assunto">
			<textarea
				[$delay: 300ms]
				placeholder="Mensagem"
				rows="5">
			<button
				[$delay: 450ms]>
				<i.fas.fa-paper-plane>
				'Enviar mensagem'

	css &
		margin-bottom: 4rem @md: 0

		::-webkit-scrollbar
			width: 5px

		::-webkit-scrollbar-track
			background: var(--black1)

		::-webkit-scrollbar-thumb
			background: var(--black1)

		input, textarea, button
			$delay: 0ms

			font-family: 'Poppins'
			font-size: .875rem
			padding: .5rem .75rem
			outline: none
			border: 1px solid var(--black2)
			animation-duration: 500ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-delay: $delay

		textarea
			overflow-y: auto
			resize: none

		input, textarea
			width: 100%
			color: var(--black7)
			margin-bottom: .5rem
			background: var(--black0)
			font-weight: 500
			tween: 500ms
			animation-name: fade-in, slide-in-left

			@placeholder
				color:  var(--black5)

			@selection
				background: blue3
				color: white

			@focus
				background: var(--black2)

		button
			margin-top: 1rem
			user-select: none
			cursor: pointer
			tween: 500ms
			font-weight: 600
			color:  var(--black5)
			background: var(--black0)
			animation-name: fade-in, slide-in-left

			i
				margin-right: .5rem

			@hover
				background: var(--black2)

export default Form
