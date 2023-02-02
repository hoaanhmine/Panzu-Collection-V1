function onUpdate()
	setProperty("dad.y", -300 + math.sin(getSongPosition() / 80) * 20)
end