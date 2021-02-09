import { auth } from 'server/firebase'

class Auth

	static prop user = null

	static def signIn { email, password }
		user = await auth.signInWithEmailAndPassword(email, password)

	static def signOut
		user = await auth.signOut()


export default Auth

console.log (Auth.user)