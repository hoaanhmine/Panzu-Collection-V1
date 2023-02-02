isEnemyTurn = false

function onCreatePost()
	setProperty("cameraSpeed", 1.2)
end

function onUpdate()
	if not isEnemyTurn then return end
	local an = getProperty("dad.animation.curAnim.name")
	if an == "idle" then
		return cameraSetPos(180, -960)
	end
	if an == "singLEFT" then
		return cameraSetPos(80, -960)
	end
	if an == "singDOWN" then
		return cameraSetPos(280, -900)
	end
	if an == "singUP" then
		return cameraSetPos(180, -1000)
	end
	if an == "singRIGHT" then
		return cameraSetPos(280, -960)
	end
end

function cameraSetPos(x, y)
	setProperty("camFollow.x", x)
	setProperty("camFollow.y", y)
end