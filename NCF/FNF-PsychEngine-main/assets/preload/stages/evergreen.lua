function onCreate()
	-- background shit
	makeLuaSprite('EGsky', 'evergreen/EGsky', -500, -1100);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('EGtreebackground', 'evergreen/EGtreebackground', -260, -400);
	setLuaSpriteScrollFactor('EGtreebackground', 0.9, 0.9);

	makeLuaSprite('EGtrees_middle', 'evergreen/EGtrees_middle', -450, -750);
	setLuaSpriteScrollFactor('EGtrees_middle', 0.9, 0.9);

	makeLuaSprite('EGtreesfront', 'evergreen/EGtreesfront', -250, -370);
	setLuaSpriteScrollFactor('EGtreesfront', 0.9, 0.9);

	makeLuaSprite('EGground', 'evergreen/EGground', -500, 530);
	setLuaSpriteScrollFactor('EGground', 0.9, 0.9);

    makeLuaSprite('EGfronttree1', 'evergreen/EGfronttree1', 690, -120);
	setLuaSpriteScrollFactor('EGfronttree1', 0.9, 0.9);

    makeLuaSprite('EGfronttree2', 'evergreen/EGfronttree2', -710, -100);
	setLuaSpriteScrollFactor('EGfronttree2', 0.9, 0.9);


	addLuaSprite('EGsky', false);
	addLuaSprite('EGtreebackground', false);
	addLuaSprite('EGtrees_middle', false);
	addLuaSprite('EGtreesfront', false);
	addLuaSprite('EGground', false);
    addLuaSprite('EGfronttree1', false);
    addLuaSprite('EGfronttree2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage