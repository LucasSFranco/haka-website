import 'imba/router'

import './style'

import Home from './views/Home'
import Login from './views/Login'
import Management from './views/Management'
import CreateCategory from './views/category-crud/Create'
import DeleteCategory from './views/category-crud/Delete'
import CreateJob from './views/job-crud/Create'
import DeleteJob from './views/job-crud/Delete'

tag App

	<self>
		<div route.exact="/">
			<Home route="">
		<div route="/admin">
			<Login route="">
			<div route="management">
				<Management route="">
				<div route="category">
					<CreateCategory route="create">
					<DeleteCategory route="delete/:id">
				<div route="job">
					<CreateJob route="create">
					<DeleteJob route="delete/:id">

imba.mount <App>

