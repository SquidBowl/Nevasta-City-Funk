function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'tanyadeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'tanya_death'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bowomp'); --put in mods/music/
end