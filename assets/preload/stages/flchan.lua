canCar = true

function onCreate()
	sn = string.lower(songName)
	makeLuaSprite("bfroom", "flchan/limoSunset", -120, -50)
	setScrollFactor("bfroom", 0.1, 0.1)
	addLuaSprite("bfroom")
	makeAnimatedLuaSprite("bgLimo", "flchan/bgLimo", -2600, -220)
	addAnimationByPrefix("bgLimo", "idle", "BG limo")
	setScrollFactor("bgLimo", 0.3, 0.3)
	addLuaSprite("bgLimo")
	makeLuaSprite("c", "flchan/limoOverlay", -500, -600)
	addLuaSprite("c")
	setProperty("c.alpha", 0.05)
	makeAnimatedLuaSprite("d", "flchan/limoDrive", -320, 640)
	addAnimationByPrefix("d", "idle", "Limo stage")
	makeLuaSprite("car", "flchan/fastCarLol", -11500, 560)
end

function onCreatePost()
	setScrollFactor("gf", 0.3, 0.3)
	setObjectOrder("d", 4) --why does getObjectOrder return -1?
	addLuaSprite("car", true)
	
	if sn == "eferu chan" or not isStoryMode then
		setProperty("camGame.zoom", 1.5)
		setProperty("camFollowPos.y", 1000)
	end
end

function onCountdownTick()
	onBeatHit("h")
end

function onBeatHit(a)
	if flashingLights then
		cameraShake("", 0.0015, crochet)
	end
	if a == "h" or not canCar then return end
	if math.random() <= 0.1 then
		canCar = false
		playSound("carPass"..(math.random() > 0.5 and 1 or 0), 0.7)
		doTweenX("fastCarDrive", "car", math.random(2800, 3100), 2)
	end
end

function onTweenCompleted(name)
	if name == "fastCarDrive" then
		canCar = true
		setProperty("car.x", -14000)
	end
end