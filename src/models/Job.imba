class Job

	constructor
		categoryId = null
		images =
			previewImage: null
			fullImage: null

	def validate
		let isValid = true
		unless categoryId
			isValid = false
		unless images.previewImage
			isValid = false
		unless images.fullImage
			isValid = false
		return isValid

export default Job
