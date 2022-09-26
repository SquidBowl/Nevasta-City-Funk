function onCreate()
	-- background shit
	makeLuaSprite('bg1sky', 'bg1/bg1sky', -500, -300);
	setLuaSpriteScrollFactor('bg1sky', 0.4, 0.4);
	
	makeLuaSprite('bg1city', 'bg1/bg1city', -500, -300);
	setLuaSpriteScrollFactor('bg1city', 0.7, 0.7);

	makeLuaSprite('bg1terraces', 'bg1/bg1terraces', -500, -300);
	setLuaSpriteScrollFactor('bg1city', 0.5, 0.5);

	makeLuaSprite('bg1floor', 'bg1/bg1floor', -500, -300);
	setLuaSpriteScrollFactor('bg1floor', 1, 1);

	addLuaSprite('bg1sky', false);
	addLuaSprite('bg1city', false);
	addLuaSprite('bg1terraces', false);
	addLuaSprite('bg1floor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end