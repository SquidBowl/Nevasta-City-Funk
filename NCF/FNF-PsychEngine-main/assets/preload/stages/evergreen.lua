function onCreate()
	makeLuaSprite('stagesky', 'evergreen/EGsky', -1400, -1200);
	setScrollFactor('stagesky', 0.65, 0.65);
	addLuaSprite('stagesky', false);

	makeLuaSprite('stagetree1', 'evergreen/EGtreebackground', -300, -430);
	setScrollFactor('stagetree1', 0.7, 0.7);
	addLuaSprite('stagetree1', false);

	makeLuaSprite('stagetree2', 'evergreen/EGtrees_middle', -450, -600);
	setScrollFactor('stagetree2', 0.8, 0.8);
	addLuaSprite('stagetree2', false);

	makeLuaSprite('stagetree3', 'evergreen/EGtreesfront', -200, -350);
	setScrollFactor('stagetree3', 0.9, 0.9);
	addLuaSprite('stagetree3', false);

	makeLuaSprite('stageground', 'evergreen/EGground', -400, 600);
	addLuaSprite('stageground', false);
end