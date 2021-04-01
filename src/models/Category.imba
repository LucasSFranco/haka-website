class Category

	constructor
		name = ''

	def validate
		let isValid = true
		unless name
			isValid = false
		return isValid

export default Category
