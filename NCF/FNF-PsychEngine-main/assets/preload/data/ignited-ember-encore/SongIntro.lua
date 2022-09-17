IntroTextSize = 25	
IntroSubTextSize = 30 
IntroTagColor = '8300c3'	
IntroTagWidth = 15	

--actual script
function onCreate()

	makeLuaSprite('songBar', 'songBar', -305-IntroTagWidth, 15)
	setObjectCamera('songBar', 'other')
	addLuaSprite('songBar', true)

	makeLuaText('JukeBoxText', '  You are Playing:', 300, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	makeLuaText('JukeBoxSubText', '  IE Encore', 300, -305-IntroTagWidth, 60)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
end

function onSongStart()
	-- Inst y Vocales comienzan a sonar, songPosition = 0
	doTweenX('MoveInTwo', 'songBar', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutTwo', 'songBar', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
	end
end