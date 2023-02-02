thingThing = false
ended = 0
function onStartCountdown()
	if isStoryMode and thingThing == false and not seenCutscene then
		thingThing = true
		startVideo("cutscene")
		return Function_Stop
	end
	return Function_Continue
end

function onEndSong()
	if not isStoryMode then return Function_Continue end
	makeLuaSprite("endStuff", "doxxie/end", 0, 0)
	setProperty("endStuff.scale.x", screenWidth / getProperty("endStuff.width"))
	setProperty("endStuff.scale.y", screenHeight / getProperty("endStuff.height"))
	setProperty("endStuff.alpha", 0)
	setObjectCamera("endStuff", "hud")
	setObjectOrder("endStuff", getProperty("members.length"))
	addLuaSprite("endStuff", true)
	screenCenter("endStuff")
	
	ended = 1
	doTweenAlpha("fun", "endStuff", 1, 1)
	playMusic("assetsDOXXIE_shared_music_music_guys_intro", 0.8, true)
	function onEndSong() end
	return Function_Stop
end

function onUpdate()
	if ended == 1 then
		if ((keyJustPressed("back") or keyJustPressed("left") or keyJustPressed("up"))) then
			endSong()
		end
	end
end