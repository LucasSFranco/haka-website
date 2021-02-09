import Row from '#/Row'
import Col from '#/Col'

import Admin from 'server/models/Admin'
import Auth from 'server/Auth'

import {errors} from 'server/translate/errors'

tag AdminLogin

	prop credential = new Admin
	prop errorMessage = ''

	prop loading = false

	def signIn
		loading = true
		Auth.signIn(credential).then(do
			router.go("/admin/control")
			credential = new Admin
			loading = false	
			render()
		).catch(&) do |err|
			errorMessage = errors[err.code]
			loading = false
			render()

	def render
		<self#admin-login>
			<Row>
				<Col.span-4.offset-5.form>
					<h1.title> 'Entrar'
					<input
						.invalid=errorMessage
						type="text"
						placeholder="E-mail"
						autofocus
						@keydown.enter=signIn
						bind=credential.email>
					<input
						.invalid=errorMessage
						type="password"
						placeholder="Senha"
						@keydown.enter=signIn
						bind=credential.password>
					<button
						@click=signIn>
						if loading
							<i.fas.fa-spinner.fa-pulse>
						else
							<i.fas.fa-sign-in-alt>
						'Entrar'
					<button @click=Auth.signOut>
					<p.message> errorMessage

	css &
		display: flex
		align-items: center
		width: 100vw
		height: 100vh
		background: var(--brown5)

		.form
			background: white
			box-shadow: lg
			padding: 1rem
			display: flex
			flex-wrap: wrap
			justify-content: center

			.title
				font-family: 'Bison'
				color: var(--brown5)
				font-size: 2rem
				margin-bottom: 2rem
				text-align: center
				position: relative
				display: inline-block
				user-select: none

				@after
					content: 'Admin'
					text-transform: uppercase
					position: absolute
					top: 0
					left: calc(100% + .5rem)
					font-family: 'Poppins'
					font-size: .875rem
					font-weight: 600
					color: var(--black4)

			input
				text-align: center
				font-weight: 500
				color: var(--black7) @placeholder: var(--black4)
				width: 100%
				background: grey3
				padding: .5rem .75rem
				font-size: 1rem
				font-family: 'Poppins'
				outline: none
				margin-bottom: .5rem

				&.invalid
					background: red2

				@selection
					color: white
					background: blue3

			button
				outline: none
				width: 100%
				background: var(--yellow5)
				color: white
				font-family: 'Poppins'
				padding: .5rem .75rem
				font-size: 1rem
				text-transform: uppercase
				font-weight: 500
				cursor: pointer
				tween: 500ms
				user-select: none

				@hover
					background: var(--yellow6)

				i margin-right: .5rem

			.message
				font-family: 'Poppins'
				font-size: .875rem
				color: red6
				margin-top: .5rem
				width: 100%

export default AdminLogin
