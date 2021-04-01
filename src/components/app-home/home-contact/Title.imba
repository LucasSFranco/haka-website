import SectionTitle from '../../layout/SectionTitle'

tag Title

	def render
		<self.title>
			<SectionTitle
				[$justify-content: center]>
				'Fale conosco'
				<small
					[b: 100% l: 0]> 'Contato'
				<div.title-ornament
					[h: 3px w: 50px t: calc(100% + 5px) l: -20px]
					[$animation-name: slide-in-left]>
				<div.title-ornament
					[h: 5px w: 100px b: calc(100% + 5px) r: -20px]
					[$animation-name: slide-in-right]>

export default Title
