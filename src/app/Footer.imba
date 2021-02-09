import Container from '#/Container'
import Row from '#/Row'
import Col from '#/Col'

import FooterForm from '#/app-footer/FooterForm'
import FooterSocial from '#/app-footer/FooterSocial'
import FooterToTopButton from '#/app-footer/FooterToTopButton'

tag Footer < Container

	def render
		<self#footer[py: 5rem bg: var(--yellow5) pos: relative of: hidden]>
			<Row.spacing-lg>
				<FooterForm>
				<Col.span-5.pause
					@intersect(frame, 1).in=(do this.classList.remove('pause'))>
					<FooterSocial>
					<FooterToTopButton>

export default Footer
