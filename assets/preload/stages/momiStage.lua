function onCreate()
	sn = string.gsub(string.lower(songName), " ", "-")
	
	makeLuaSprite("wall", "momi/bg", -175.3, -225.95)
	addLuaSprite("wall")
	
	if sn == "neko" then
		makeAnimatedLuaSprite("car", "momi/carhit", -807.15, 27.9)
		addAnimationByPrefix("car", "idle", "hit", 12, false)
		function onSongStart()
			setProperty("songLength", 121310)
		end
		if isStoryMode then
			addLuaSprite("flashyshit", true)
			doTweenAlpha("poopy", "flashyshit", 0, 3)
		end
	else
		makeAnimatedLuaSprite("dust", "momi/dust", -238.3, 371.55)
		addAnimationByPrefix("dust", "idle", "dust", 24, false)
		function onBeatHit()
			playAnim("dust", "idle", true)
		end
	end
	
	if sn == "nazel" then
		addLuaSprite("dust", true)
		onCountdownTick = onBeatHit
	end
	
	if sn == "momi-roll" then
		makeAnimatedLuaSprite("nyoom", "momi/car", -1514.4, 199.8)
		addAnimationByPrefix("nyoom", "idle", "car", 24, false)
		setProperty(dust.alpha, 0)
	else
		makeLuaSprite("flashyshit", "", -99, -99)
		makeGraphic("flashyshit", 100, 100, "0xffffffff")
		setScrollFactor("flashyshit", 0, 0)
		scaleObject("flashyshit", 90, 90)
	end
end

function onEvent(name)
	if name == "Trigger BG Ghouls" then
		if sn == "momi-roll" then
			--nyoom
			addLuaSprite("dust", true)
			addLuaSprite("nyoom", true)
			playAnim("nyoom", "idle", true)
			doTweenAlpha("dustappears", "dust", 1, 0.5)
		elseif sn == "neko" then
			--momi fucking dies
			addLuaSprite("car", true)
			playAnim("car", "idle", true)
			setHealth(2)
		end
		return
	end
	if name == "Kill Henchmen" then
		--t
		addLuaSprite("flashyshit", true)
		setProperty("flashyshit.alpha", 0)
		doTweenAlpha("poopy", "flashyshit", 1, 0.1)
		return
	end
	if name == "BG Freaks Expression" then
		--Snoud
		playSound("carPass1")
		return
	end
end