-- Event notes hooks
function onEvent(name, value1, value2)
    if name == 'GF Fade' then
        duration = tonumber(value1)
        targetAlpha = tonumber(value2)
	local prevX = getProperty('gf.x')
	setProperty('gf.x', -1249)
	doTweenX('slideIn', 'gf', prevX, 2, 'quadOut')
        if duration <= 0 then
            setProperty('gf.alpha', targetAlpha)
            setProperty('iconP3.alpha', targetAlpha)
        else
            doTweenAlpha('gfsGone:(', 'gf', targetAlpha, duration)
            doTweenAlpha('iconFade', 'iconP3', targetAlpha, 2)
        end
    end
end
