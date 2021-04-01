tag Select

	data = null
	selected = ''
	options = []
	isShow = false

	def bindData option

		data = option.id
		selected = option.name

		isShow = false

	def toggleShow
		isShow = !isShow

	def mount
		window.addEventListener('click', &) do |e|
			if $input-wrapper != e.target.closest('.input-wrapper')
				self.querySelector('.options').classList.remove('show')

	<self.select>
		<label>
			<slot>
		<div$input-wrapper
			@click.if(options.length)=toggleShow>
			<input.viewer
				disabled
				value=(data && selected)
				placeholder="Selecione uma opção...">
			<button>
				if options.length
					if isShow
						<i.fas.fa-chevron-up>
					else
						<i.fas.fa-chevron-down>
				else
					<i.fas.fa-spinner.fa-pulse>
		<div.options
			.show=isShow>
			for option in options
				<div.option
					.active=(option.id === data)
					@click=bindData(option)>
					option.name

	css &
		d: block
		mb: .5rem
		pos: relative

		label
			d: block
			c: grey5
			us: none
			fs: .75rem
			ff: 'Poppins'
			tt: uppercase

		.input-wrapper
			d: flex
			cursor: pointer
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
				ff: 'Poppins'
				p: .34375rem .75rem
				w: calc(100% - 1.875rem)

				@placeholder
					c: grey5

			button
				d: flex
				c: white
				pe: none
				bg: grey5
				ai: center
				jc: center
				size: 2.125rem
				bdl: 1px solid grey5

		.options
			l: 0
			zi: 9
			d: none
			bxs: lg
			us: none
			bg: white
			ofy: auto
			pos: absolute
			min-width: 200px
			t: calc(100% + 5px)
			max-height: calc(30px * 5)

			&::-webkit-scrollbar
				w: 5px

			&::-webkit-scrollbar-track
				bg: grey3

			&::-webkit-scrollbar-thumb
				bg: grey5 @hover: grey6 @active: grey7

			&.show
				d: block

			.option
				d: block
				c: grey8
				fs: .875rem
				ff: 'Poppins'
				p: .5rem .75rem
				cursor: pointer

				@hover
					c: white
					bg: blue3

				@active
					c: white
					bg: blue4

				&.active
					c: white
					bg: blue4
					cursor: default

export default Select
