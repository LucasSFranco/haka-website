import Container from '#/Container'
import Row from '#/Row'

import AboutTitle from '#/app-about/AboutTitle'
import AboutText from '#/app-about/AboutText'
import AboutMembership from '#/app-about/AboutMembership'

tag About < Container

	def render
		<self#about>
			<AboutTitle>
			<Row.spacing-xl>
				<AboutText>
				<AboutMembership>

export default About
