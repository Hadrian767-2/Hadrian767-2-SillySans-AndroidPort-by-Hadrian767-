runHaxeCode('game.updateIconsScale = ()->{};')

local normScale = {0.8, 1}
function onBeatHit()
    for i = 1, 2 do
        scaleObject('iconP'.. i, normScale[i] + 0.15, normScale[i] + 0.15)
        startTween('twnBackP' .. i, 'iconP'.. i ..'.scale', {x = normScale[i], y = normScale[i]}, crochet/1000 - getPropertyFromClass('flixel.FlxG', 'elapsed'), {ease = 'expoOut'})
    end
end