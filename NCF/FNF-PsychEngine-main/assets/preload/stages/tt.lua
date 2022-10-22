function onCreate()
	-- background shit
	makeLuaSprite('ttbg-normalbg', 'tt/ttbg-normalbg', -500, -535);
	setLuaSpriteScrollFactor('ttbg-normalbg', 0.6, 0.6);
	
	makeLuaSprite('ttbg-abg', 'tt/ttbg-abg', -470, -500);
	setLuaSpriteScrollFactor('ttbg-abg', 1, 1);

	makeLuaSprite('ttbg-front', 'tt/ttbg-front', -500, -500);
	setLuaSpriteScrollFactor('ttbg-front', 1, 1);

	makeLuaSprite('ttbg-pixelpart', 'tt/ttbg-pixelpart', -500, -500);
	setLuaSpriteScrollFactor('ttbg-pixelpart', 1, 1);

	makeLuaSprite('ttunder', 'tt/ttunder', -500, -300);
	setLuaSpriteScrollFactor('ttunder', 1, 1);

	addLuaSprite('ttbg-normalbg', false);
	addLuaSprite('ttbg-abg', false);
	addLuaSprite('ttbg-front', false);
	addLuaSprite('ttbg-pixelpart', false);
	addLuaSprite('ttunder', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end