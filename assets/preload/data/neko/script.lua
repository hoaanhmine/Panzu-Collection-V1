local allowCountdown = false
local allowEndSong = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- Neko Dialogue is disabled due to Psych Engine not letting the dialogue finish before ending the song. Sorry!!

-- function onEndSong()
-- 	if not allowEndSong and isStoryMode then
-- 		startDialogue('dialogue_end');
-- 		setProperty('inCutscene', true);
-- 		allowEndSong = true
-- 		return Function_Stop;
-- 	end
-- 	return Function_Continue;
-- end