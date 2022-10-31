function onEvent(name, value1, value2)
    if name == "Image Event" then
    makeLuaSprite('caiumpscare', value1, 0, 0);
    addLuaSprite('caiumpscare', true);
    doTweenColor('hello', 'caiumpscare', 'FFFFFFFF', 0.1, 'quartIn');
    setObjectCamera('caiumpscare', 'other');
    runTimer('wait', value2);
    end
    end
    
    function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'wait' then
    doTweenAlpha('byebye', 'caiumpscare', 0, 0.1, 'linear');
    end
    end
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
    removeLuaSprite('caiumpscare', true);
    end
    end