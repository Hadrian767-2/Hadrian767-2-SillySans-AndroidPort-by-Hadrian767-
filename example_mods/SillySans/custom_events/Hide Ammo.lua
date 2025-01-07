function onEvent(n,v1,v2)
    if n == "Hide Ammo" and getModSetting('bulletMechanic') then
        doTweenY('ammoy', 'ammo', 900, 2, 'quadOut')
        doTweenAlpha('ammoa', 'ammo', 0, 2, 'quadOut')
    end
end