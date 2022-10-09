notehitlol = 0
font = "vcr.ttf" -- the font that the text will use.
cmoffset = -4
cmy = 20
tnhx = -10
function onCreate()
    makeLuaText("tnh", '', 250, tnhx, 259);
    setTextFont('tnh', font)
    makeLuaText("cm", 'Combo: 0', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
    makeLuaText("sick", 'Fire!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
    makeLuaText("good", 'Decent: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
    makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
    makeLuaText("shit", 'Ass: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
    makeLuaText("miss", 'Misses: 0', 200, getProperty('cm.x'), getProperty('shit.y') + 30);
    setObjectCamera("tnh", 'other');
    setTextSize('tnh', 20);
    addLuaText("tnh");

    setObjectCamera("cm", 'other');
    setTextSize('cm', 20);
    addLuaText("cm");
    setTextFont('cm', font)
    setTextAlignment('cm', 'left')
    setObjectCamera("sick", 'other');
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextFont('sick', font)
    setTextAlignment('sick', 'left')
    setObjectCamera("good", 'other');
    setTextSize('good', 20);
    addLuaText("good");
    setTextFont('good', font)
    setTextAlignment('good', 'left')
    setObjectCamera("bad", 'other');
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextFont('bad', font)
    setTextAlignment('bad', 'left')
    setObjectCamera("shit", 'other');
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextFont('shit', font)
    setTextAlignment('shit', 'left')
    setObjectCamera("miss", 'other');
    setTextSize('miss', 20);
    setTextColor('miss', 'ff0000');
    addLuaText("miss");
    setTextFont('miss', font)
    setTextAlignment('miss', 'left')
end

function onUpdate(elapsed)
    notehitloltosting = tostring(notehitlol)
    setTextString('cm', 'Combo: ' .. getProperty('combo'))
    setTextString('sick', 'Fire!: ' .. getProperty('sicks'))
    setTextString('good', 'Decent: ' .. getProperty('goods'))
    setTextString('bad', 'Bads: ' .. getProperty('bads'))
    setTextString('shit', 'Ass: ' .. getProperty('shits'))
    setTextString('miss', 'Misses: ' .. getProperty('songMisses'))
	-- start of "update", some variables weren't updated yet
    -- setTextString('tnh', 'Total Notes Hit: ' + 1)
end