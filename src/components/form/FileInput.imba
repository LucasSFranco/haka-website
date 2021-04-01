tag FileInput

	data = null
	selected = ''
	progress = 0

	def bindData e
		data = e.target.files[0] || data
		selected = data..name || ''

	def render
		<self.file-input>
			<label>
				<slot>
			<div.input-wrapper>
				<input.viewer
					disabled
					value=(data && selected)
					placeholder="Selecione uma imagem...">
				<button>
					<i.fas.fa-upload>
				<input
					title=""
					type="file"
					accept="image/png, image/jpeg, image/jpg"
					@click=(do this.value = null)
					@change=bindData>
			<div.progress-wrapper>
				<progress
					max="100"
					value=progress>

	css &
		d: block
		mb: .5rem

		label
			us: none
			d: block
			c: grey5
			fs: .75rem
			ff: 'Poppins'
			tt: uppercase

		.input-wrapper
			d: flex
			pos: relative
			bd: 1px solid grey5

			@hover
				button
					bg: grey6

			@active
				button
					bg: grey7

			.viewer
				d: flex
				c: grey8
				pe: none
				fs: .875rem
				p: .34375rem .75rem
				ff: 'Poppins'
				w: calc(100% - 1.875rem)

				@placeholder
					c: grey5

			input[type="file"]
				o: 0
				t: 0
				l: 0
				size: 100%
				pos: absolute
				cursor: pointer

				&::-webkit-file-upload-button
					visibility: hidden

			button
				d: flex
				c: white
				pe: none
				bg: grey5
				ai: center
				jc: center
				size: 2.125rem
				bdl: 1px solid grey5

		.progress-wrapper
			d: flex
			pt: 3px
			ai: flex-start

			progress
				h: 5px
				w: 100%

				&::-webkit-progress-bar
					h: 5px
					bg: grey3

				&::-webkit-progress-value
					bg: blue4

export default FileInput
