import Container from '../layout/Container'
import Row from '../layout/Row'
import Col from '../layout/Col'

import Social from './home-footer/Social'
import ToTopButton from './home-footer/ToTopButton'
import Info from './home-footer/Info'

tag Footer

	notIntersected = true

	def render
		<self.footer>
			<Container[py: 3rem bg: var(--yellow5) pos: relative of: hidden]>
				<Row.lg>
					<Info>
					<Col.span-6.pause=notIntersected
						@intersect(frame)=(do
							if e.entry.isIntersecting
								notIntersected=false)>
						<Social>
						<ToTopButton>

export default Footer
