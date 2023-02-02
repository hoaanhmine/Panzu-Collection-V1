thingThing = false
ended = 0
function onStartCountdown()
	setProperty('skipCountdown',isStoryMode)
	if isStoryMode and thingThing == false and not seenCutscene then
		thingThing = true
		startVideo("cutscenehx")
		return Function_Stop
	end
	return Function_Continue
end

function onEndSong()
	if not isStoryMode then return Function_Continue end
	sname = "endStuff"..ended
	makeLuaSprite(sname, "doxxie/ending000"..ended+1, 0, 0)
	setProperty(sname..".scale.x", screenWidth / getProperty(sname..".width"))
	setProperty(sname..".scale.y", screenHeight / getProperty(sname..".height"))
	setProperty(sname..".alpha", ended == 0 and 1 or 0)
	setObjectCamera(sname, "other")
	setObjectOrder(sname, getProperty("members.length"))
	addLuaSprite(sname, true)
	screenCenter(sname)
	
	ended = ended + 1
	if ended == 1 then --Play music on the first frame
		playMusic("assetsDOXXIE_shared_music_music_guys_intro", 0.8, true)
	else
		doTweenAlpha("fun", sname, 1, 0.5)
		if ended == 2 then --Stop on the last frame
			function onEndSong() end
		end
	end
	return Function_Stop
end

function onUpdate()
	if ended > 0 then
		if ((keyJustPressed("back") or keyJustPressed("pause") or keyJustPressed("accept"))) then
			endSong()
		end
	end
end

function onEvent(n,v1,v2)
	if n == "BG Freaks Expression" and v1 == "arch" then
		runTimer("arch_switch", 4.8, 1)
	end
end

function onTimerCompleted(n)
	if n == "arch_switch" then
		triggerEvent("Change Character", "dad", "doxxiearch2")
	end
end