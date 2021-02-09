import firebase from 'firebase/app'
import 'firebase/firestore'
import 'firebase/storage'
import 'firebase/auth'

const config = {
	apiKey: "AIzaSyDNTIx41y-H10pPmpQ9YcprTvJ1Qxm6s94"
	authDomain: "haka-website.firebaseapp.com"
	projectId: "haka-website"
	storageBucket: "haka-website.appspot.com"
	messagingSenderId: "67782794172"
	appId: "1:67782794172:web:f70d097b995a92839da9b9"
	measurementId: "G-91HB3MB335"
}

firebase.initializeApp(config)

export const firestore = firebase.firestore()
export const storage = firebase.storage()
export const auth = firebase.auth()
