import firebase from 'firebase/app'
import 'firebase/firestore'
import 'firebase/storage'
import 'firebase/auth'

# Put your firebase config below
const config = {
	apiKey: ''
	authDomain: ''
	projectId: ''
	storageBucket: ''
	messagingSenderId: ''
	appId: ''
	measurementId: ''
}

firebase.initializeApp(config)

export const firestore = firebase.firestore()
export const storage = firebase.storage()
export const auth = firebase.auth()
