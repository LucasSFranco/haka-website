global css

	@root
		$grey0: #fafafa
		$grey1: #f4f4f5
		$grey2: #e4e4e7
		$grey3: #d4d4d8
		$grey4: #a1a1aa
		$grey5: #71717a
		$grey6: #52525b
		$grey7: #3f3f46
		$grey8: #27272a
		$grey9: #18181b

	html, body
		scroll-behavior: smooth
		overflow-x: hidden

	.pause
		animation@force: none
		opacity@force: 0

		*, *@after, *@before
			animation@force: none
			opacity@force: 0

	@keyframes
		fade-in
			0% opacity: 0
			100% opacity: 1

		fade-out
			0% opacity: 1
			100% opacity: 0

		scale-in-quint
			0% transform: scale(.8)
			100% transform: scale(1)

		scale-out-quint
			0% transform: scale(1)
			100% transform: scale(.8)

		scale-in-tenth
			0% transform: scale(.9)
			100% transform: scale(1)

		scale-out-tenth
			0% transform: scale(1)
			100% transform: scale(.9)

		scale-in
			0% transform: scale(0)
			100% transform: scale(1)

		scale-out
			0% transform: scale(1)
			100% transform: scale(0)

		slide-in-up
			0% transform: translateY(-2rem)
			100% transform: translateY(0)

		slide-out-up
			0% transform: translateY(0)
			100% transform: translateY(-2rem)

		slide-in-down
			0% transform: translateY(2rem)
			100% transform: translateY(0)

		slide-out-down
			0% transform: translateY(0)
			100% transform: translateY(2rem)

		slide-in-left
			0% transform: translateX(-2rem)
			100% transform: translateX(0)

		slide-out-left
			0% transform: translateX(0)
			100% transform: translateX(-2rem)

		slide-in-right
			0% transform: translateX(2rem)
			100% transform: translateX(0)

		slide-out-right
			0% transform: translateX(0)
			100% transform: translateX(2rem)

		slide-in-top-right
			0% transform: translate(1rem, -1rem)
			100% transform: translate(0, 0)

		slide-out-top-right
			0% transform: translate(0, 0)
			100% transform: translate(1rem, -1rem)

		slide-in-top-left
			0% transform: translate(-1rem, -1rem)
			100% transform: translate(0, 0)

		slide-out-top-left
			0% transform: translate(0, 0)
			100% transform: translate(-1rem, -1rem)

		slide-in-bottom-right
			0% transform: translate(1rem, 1rem)
			100% transform: translate(0, 0)

		slide-out-bottom-right
			0% transform: translate(0, 0)
			100% transform: translate(1rem, 1rem)

		slide-in-bottom-left
			0% transform: translate(-1rem, 1rem)
			100% transform: translate(0, 0)

		slide-out-bottom-left
			0% transform: translate(0, 0)
			100% transform: translate(-1rem, 1rem)
