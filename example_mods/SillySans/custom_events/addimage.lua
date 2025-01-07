function onEvent(name, value1, value2)
    if name == 'addimage' then
        makeLuaSprite( value1, value1, 0, 0);
        setObjectCamera( value1, 'hud')
        scaleObject( value1, 1, 1);
        addLuaSprite( value1, false);
        setProperty("camZoomingMult", 0)     
     end
 end