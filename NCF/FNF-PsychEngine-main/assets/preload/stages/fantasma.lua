function onCreate()
	-- background shit
	makeLuaSprite('normal', 'normal', -1050, -1000);
	
	makeLuaSprite('normal', 'normal', -550, -270);
	scaleObject('normal', 1.7, 1.5);

	addLuaSprite('normal', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end