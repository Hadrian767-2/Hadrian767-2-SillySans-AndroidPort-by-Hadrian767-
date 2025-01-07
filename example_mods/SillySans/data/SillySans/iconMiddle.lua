function onUpdatePost(elapsed)
setProperty('iconP1.x', 377)
setProperty('iconP2.x', 239)
setProperty('healthBar.visible', true);
setProperty('healthBarBG.visible', true);
setProperty('healthBar.x', -105)
setProperty('healthBar.scale.x', 0.70)
setProperty('healthBar.scale.y', 0.75)
setProperty('healthBarBG.x', 729)
setProperty('healthBar.y', 617)
setProperty('healthBarBG.y', 200)
setProperty('scoreTxt.x', -239)
setTextColor('scoreTxt','73FBFD')

end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.012);
    end
end
function goodNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health+ 0.01);
    end
end
