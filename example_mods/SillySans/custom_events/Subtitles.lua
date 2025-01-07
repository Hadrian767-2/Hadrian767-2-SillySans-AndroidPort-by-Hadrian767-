function onEvent(n,v1,v2)
    if n == "Subtitles" then
        makeLuaText('subtitles', v1, 800, 0, 550)
        screenCenter('subtitles', 'x')
        setTextSize('subtitles', 30)
        addLuaText('subtitles', true)
        runTimer('subtitles', tonumber(v2))
    end
end

function onTimerCompleted(tag)
    if tag == 'subtitles' then
        removeLuaText('subtitles')
    end
end