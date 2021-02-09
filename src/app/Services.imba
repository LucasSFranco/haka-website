import Container from '#/Container'

import ServicesList from '#/app-services/ServicesList'
import ServicesTitle from '#/app-services/ServicesTitle'

tag Services < Container

	def render
		<self#services>
			<ServicesTitle>
			<ServicesList>

export default Services

