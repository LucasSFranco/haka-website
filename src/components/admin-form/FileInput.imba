tag FileInput

	prop data = null
	prop progress = 0
	prop message = ''
	prop viwerValue = ''

	def bindData e
		[data] = e.target.files || data
		viewerValue = data.name

	def render
		<self.file-input.primary>
			<label>
				<slot>
			<label.input-wrapper>
				<input
					type="file"
					accept="image/png, image/jpeg , image/jpg"
					@change=bindData>
				<input.viewer
					value=(data ? viewerValue : '')
					placeholder="Escolha uma imagem..."
					disabled>
				<span.button>
					<i.fas.fa-upload>
			<div.progress-wrapper>
				<progress
					value=progress
					max="100">
			<small> message

	css &
		width: 100%
		user-select: none
		margin-bottom: .5rem

		label
			font-size: .75rem
			font-family: 'Poppins'
			text-transform: uppercase

		.input-wrapper
			display: flex

			.viewer
				color: grey8
				display: flex
				cursor: default
				user-select: auto
				background: white
				font-size: .875rem
				align-items: center
				text-transform: none
				padding: .5rem .75rem
				font-family: 'Poppins'
				width: calc(100% - 2.3125rem)

				@placeholder
					color: grey5

				@selection
					color: white
					background: blue3

			input
				display: none

			.button
				tween: 500ms
				color: white
				display: flex
				outline: none
				cursor: pointer
				font-size: 1rem
				size: 2.3125rem
				align-items: center
				justify-content: center

		.progress-wrapper
			display: flex
			padding-top: 3px
			align-items: flex-start

			progress
				width: 100%
				height: 5px

			progress::-webkit-progress-bar
				height: 5px
				background: grey3

			progress::-webkit-progress-value
				background: var(--yellow5)

		small
			color: grey5
			display: block
			line-height: 1
			font-size: .75rem
			margin-top: .25rem

		&.primary
			label color: grey5
			small color: grey5
			.button background: grey5
				@hover background: grey6
			.input-wrapper border: 1px solid grey5

		&.error
			label color: red5
			small color: red5
			.button background: red5
				@hover background: red6
			.input-wrapper border: 1px solid red5

		&.success
			label color: green5
			small color: green5
			.button background: green5
				@hover background: green6
			.input-wrapper border: 1px solid green5


export default FileInput
