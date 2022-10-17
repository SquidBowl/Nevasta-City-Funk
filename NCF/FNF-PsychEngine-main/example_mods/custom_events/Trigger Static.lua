function onCreate()
    makeAnimatedLuaSprite('FlashingShitFatality','exep3/Phase3Static', 0, 0)
    addAnimationByPrefix('FlashingShitFatality','glitch','Phase3Static instance',24,true)
    setProperty('FlashingShitFatality.alpha',0.9)
    scaleObject('FlashingShitFatality',4,4)
    setObjectCamera('FlashingShitFatality','hud')

    debugPrint(getProperty('dad.x'))
end

function onEvent(name,value1)
    if name == 'Trigger Static' then
        addLuaSprite('FlashingShitFatality',true)
        if value1 ~= '' and value1 ~= nil then
            runTimer('destroyFlashShitfatality',value1/5)
        else
            runTimer('destroyFlashShitfatality',1.6)
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'destroyFlashShitfatality' then
        removeLuaSprite('FlashingShitFatality',false)
    end
end