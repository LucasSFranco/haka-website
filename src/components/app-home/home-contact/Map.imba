import Col from '../../layout/Col'

tag Map < Col

	notIntersected = true
	loaded = false

	def render
		<self.map.span-12.pause=(notIntersected || !loaded)
			@intersect(frame)=(do
				if e.entry.isIntersecting
					notIntersected=false)>
			<iframe
				@load=(do loaded = true)
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3551.5316795441627!2d-52.6216144853928!3d-27.108058807907806!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94e4b41e5d82f22f%3A0xb33ac537b5f26266!2sR.%20Clevel%C3%A2ndia%2C%20589-D%20-%20Jardim%20It%C3%A1lia%2C%20Chapec%C3%B3%20-%20SC%2C%2089802-405!5e0!3m2!1spt-BR!2sbr!4v1611834347753!5m2!1spt-BR!2sbr">

	css &
		h@md: 500px
		overflow: hidden @md: initial
		padding-top: 133.33% @md: initial
		position: relative @md: initial
		d: block

		iframe
			position: absolute @md: initial
			top: 0 @md: initial
			left: 0 @md: initial
			bottom: 0 @md: initial
			right: 0 @md: initial
			width: 100%
			height: 100%
			animation-duration: 1000ms
			animation-timing-function: ease
			animation-fill-mode: both
			animation-name: fade-in, scale-in-quint

export default Map
