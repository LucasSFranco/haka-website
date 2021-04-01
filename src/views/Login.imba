import { auth } from '../firebase'
import Credential from '../models/Credential'

import { authErrors } from '../translations/authErrors'

import Container from '../components/layout/Container'
import Row from '../components/layout/Row'
import Title from '../components/form/Title'
import Form from '../components/form/Form'
import Input from '../components/form/Input'
import Button from '../components/form/Button'
import Message from '../components/form/Message'

tag Login

	def setup
		credential = new Credential
		message = {}

	def signIn
		isLoading = true

		await auth.signInWithEmailAndPassword(credential.email, credential.password).then(do
			credential = new Credential
			message.success = 'Autenticação realizada com sucesso.'
			router.go('/admin/management')
		).catch do |error|
			message.error = authErrors[error.code] || error.message

		isLoading = false

	def mount
		auth.onAuthStateChanged do |user|
			if user
				router.go('/admin/management')
			else
				notAuthenticated = true
				render()

	def unmount
		setup()

	<self.login> if notAuthenticated
		<Container[py: 5rem]>
			<Row>
				<Form>
					<Title.secondary>
						'Login'
						<small> 'Admin'
					<Input
						autofocus=true
						bind.data=credential.email
						@focusin=(do message={})
						@keydown.enter.if(!isLoading)=signIn>
						'E-mail'
					<Input
						type="password"
						bind.data=credential.password
						@focusin=(do message={})
						@keydown.enter.if(!isLoading)=signIn>
						'Senha'
					<Button.secondary
						@click.if(!isLoading)=signIn>
						if isLoading
							<i.fas.fa-spinner.fa-pulse>
						else
							<i.fas.fa-sign-in-alt>
						'Entrar'
					<Message
						.error=message..error
						.success=message..success>
						message..error || message..success || ''

export default Login
