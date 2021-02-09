tag Select

	prop options = ['link 1', 'link 2', 'link 3']
	prop message = ''
	prop data = ''
	prop viwerValue = ''
	prop loading = false

	def openDropdown
		unless loading
			$dropdown.classList.toggle('show')

	def changeInputValue e, value
		unless loading
			viewerValue = e.target.textContent
			data = value
			$dropdown.classList.remove('show')

	def mount
		window.addEventListener('click', &) do |e|
			if $select != e.target.closest('.input-wrapper')
				$dropdown.classList.remove('show')
			render!

	def render
		<self.select.primary>
			<label>
				<slot>
			<div$select.input-wrapper
				@click=openDropdown>
				<input value=(data ? viewerValue : '')
					type="text"
					placeholder="Selecione uma opção..."
					disabled>
				<button>
					if loading
						<i.fas.fa-spinner.fa-pulse>
					else
						if $dropdown and $dropdown.classList.contains('show')
							<i.fas.fa-chevron-up>
						else
							<i.fas.fa-chevron-down>
				<div$dropdown
					@click.stop>
					<div>
						for option in options
							<a.option
								@click=changeInputValue(e, option.id)>
								option.name
			<small> message

	css &
		width: 100%
		user-select: none
		margin-bottom: .5rem

		label
			font-size: .75rem
			text-transform: uppercase
			font-family: 'Poppins'

		.input-wrapper
			display: flex
			cursor: pointer
			position: relative

			input
				padding: .5rem .75rem
				font-size: .875rem
				width: calc(100% - 2.3125rem)
				outline: none
				user-select: auto
				color: grey8
				background: white
				cursor: pointer
				font-family: 'Poppins'

				@placeholder
					font-size: .875rem
					color: grey5

			button
				padding: 0
				outline: none
				color: white
				cursor: pointer
				size: 2.3125rem
				tween: 500ms

			.rotate
				rotate: 180deg

			.dropdown
				z-index: 10
				position: absolute
				min-width: 200px
				background: white
				colro: grey8
				display: none
				padding: .5rem 0
				box-shadow: lg
				max-height: 9.5rem
				overflow: auto
				cursor: default
				top: calc(100% + 5px)

				&.show
					display: block

				.option
					font-family: 'Poppins'
					display: block
					padding: .5rem .75rem
					width: 100%
					cursor: pointer
					fs: .75rem
					
					@hover
						background: blue4

			::-webkit-scrollbar
				width: 5px

			::-webkit-scrollbar-track
				background: grey3

			::-webkit-scrollbar-thumb
				background: grey5
			
				@hover
					background: grey6

		&.primary
			label color: grey5
			small color: grey5
			button background: grey5
			.input-wrapper border: 1px solid grey5
				@hover button background: grey6

		&.error
			label color: red5
			small color: red5
			button background: red5
			.input-wrapper border: 1px solid red5
				@hover button background: red6

		&.success
			label color: green5
			small color: green5
			button background: green5
			.input-wrapper border: 1px solid green5
				@hover button background: green6

export default Select
