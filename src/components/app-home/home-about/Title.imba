import SectionTitle from '../../layout/SectionTitle'

tag Title

	<self.title>
		<SectionTitle>
			'Quem somos'
			<small
				[t: 100% r: 0]> 'Sobre'
			<div.title-ornament
				[h: 3px w: 30px b: calc(100% + 5px) r: -15px]
				[$animation-name: slide-in-right]>
			<div.title-ornament
				[h: 5px w: 90px t: calc(100% + 10px) l: -10px]
				[$animation-name: slide-in-left]>

export default Title
