import SectionTitle from '../../layout/SectionTitle'

tag Title

	def render
		<self>
			<SectionTitle
				[$justify-content: center $color: white]>
				'O que fazemos'
				<small
					[b: 100% r: 0]> 'Serviços'
				<div.title-ornament
					[h: 3px w: 30px b: calc(100% + 15px) l: 90px]
					[$animation-name: slide-in-left]>
				<div.title-ornament
					[h: 5px w: 95px b: calc(100% + 5px) l: -15px]
					[$animation-name: slide-in-left]
					[$ornament-delay: 350ms]>
				<div.title-ornament
					[h: 3px w: 50px t: calc(100% + 5px) r: -5px]
					[$animation-name: slide-in-right]>

export default Title
