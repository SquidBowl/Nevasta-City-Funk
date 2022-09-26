function onCreate()
	-- background shit
	makeLuaSprite('bg1sky', 'bg1/bg1sky', -500, -300);
	makeLuaSprite('bg1city', 'bg1/bg1city' -500, -300);
	makeLuaSprite('bg1terraces', 'bg1/bg1terraces' -500, -300);
	makeLuaSprite('bg1floor', 'bg1/bg1floor' -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);

	addLuaSprite('bg1sky', false);
	addLuaSprite('bg1city', false);
	addLuaSprite('bg1terraces', false);
	addLuaSprite('bg1floor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end