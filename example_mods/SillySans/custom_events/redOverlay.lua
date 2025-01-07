function onEvent(n, v1, v2)
    if n == 'redOverlay' then
        makeLuaSprite('redOverlay', '', 0, 0)
        makeGraphic('redOverlay', screenWidth, screenHeight, '0000ff')
        setProperty('redOverlay.alpha', v1)
        setObjectCamera('redOverlay', 'other')
        setObjectOrder('redOverlay', getObjectOrder('borders') - 1)
        setBlendMode('redOverlay', 'multiply')
        addLuaSprite('redOverlay')
    end
end