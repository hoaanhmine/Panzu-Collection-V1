function onCreate()
	local robo = string.lower(songName) == "tordbot"
	makeAnimatedLuaSprite("h", "tord/sky", -162.1, -386.1)
	addAnimationByPrefix("h", "idle", robo and "bg_sky2" or "bg_sky1")
	addLuaSprite("h", false)
	makeAnimatedLuaSprite("a", "tord/bgFront", -162.1, -386.1)
	addAnimationByPrefix("a", "idle", robo and "bg_destroy" or "bg_normal")
	addLuaSprite("a", false)
	setScrollFactor("h", robo and 0.2 or 0.5, 0.22)
	setScrollFactor("a", 0.9, 0.9)
end