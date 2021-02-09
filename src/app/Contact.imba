import Container from '#/Container'
import Row from '#/Row'

import ContactTitle from '#/app-contact/ContactTitle'
import ContactMap from '#/app-contact/ContactMap'
import ContactInfo from '#/app-contact/ContactInfo'

tag Contact < Container

	def render
		<self#contact>
			<ContactTitle>
			<Row.spacing-lg>
				<ContactInfo>
				<ContactMap>

export default Contact
