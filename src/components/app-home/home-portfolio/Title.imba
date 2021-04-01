import SectionTitle from '../../layout/SectionTitle'

tag Title

	def render
		<self.title>
			<SectionTitle>
				'Nosso trabalho'
				<small
					[t: 100% l: 0]> 'Portfólio'
				<div.title-ornament
					[h: 3px w: 50px b: calc(100% + 5px) l: -10px]
					[$animation-name: slide-in-left]
					[$ornament-delay: 350ms]>
				<div.title-ornament
					[h: 3px w: 30px b: calc(100% + 12.5px) l: 35px]
					[$animation-name: slide-in-left]>
				<div.title-ornament
					[h: 5px w: 100px t: calc(100% + 5px) r: -15px]
					[$animation-name: slide-in-right]>

export default Title
