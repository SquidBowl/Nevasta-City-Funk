function onCreate()
	-- background shit
	makeLuaSprite('nevastastreets', 'nevastastreets', -1050, -1000);
	
	makeLuaSprite('nevastastreets', 'nevastastreets', -1850, -480);
	scaleObject('nevastastreets', 1.7, 1.5);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('crowd2', 'crowd2', -750, -100);
		setScrollFactor('crowd2', 0.9, 0.9);
		scaleObject('crowd2', 1.1, 1.1);
		
		makeLuaSprite('blank', 'blank', 1225, -100);
		setScrollFactor('blank', 0.9, 0.9);
		scaleObject('blank', 1.1, 1.1);
		setProperty('blank.flipX', true); --mirror sprite horizontally

		makeLuaSprite('blank', 'blank', -500, -300);
		setScrollFactor('blank', 1.3, 1.3);
		scaleObject('blank', 0.9, 0.9);
	end

	addLuaSprite('blank', false);
	addLuaSprite('nevastastreets', false);
	addLuaSprite('crowd2', false);
	addLuaSprite('blank', false);
	addLuaSprite('blank', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end