function onCreatePost()
    makeLuaSprite('BlackOut')
    makeGraphic('BlackOut', 1, 1, '000000')
    setProperty('BlackOut.alpha', 0)
    addLuaSprite('BlackOut', true)
    setObjectCamera('BlackOut', 'camHUD')
    scaleObject('BlackOut', 100000, 100000, false)
    setObjectOrder('BlackOut', 1)
end
function onEvent(name,value1,value2)
    if name == 'Blackscreen(better)' then
       doTweenAlpha('FadeIn', 'BlackOut', value1, value2)
    end
end