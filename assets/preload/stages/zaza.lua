function onCreate()
	makeLuaSprite("whbg", nil, -500, -250)
	makeGraphic("whbg", 250, 150, "656fff")
	scaleObject("whbg", 10, 10)
	setScrollFactor("whbg", 0, 0)
	addLuaSprite("whbg")
end