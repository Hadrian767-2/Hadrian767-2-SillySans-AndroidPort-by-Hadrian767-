function onCreate()
        makeLuaText('lyrics', ' ', 600, 390, 450)
        setTextFont('lyrics', 'vcr.ttf')
        setTextSize('lyrics', 50);
        addLuaText('lyrics')
	setObjectCamera('lyrics', 'camOther');
        setTextAlignment('lyrics', 'center')
end
function onEvent(name, value1, value2)
	if name == 'lyrics' then
		doTweenAlpha('ApearLyrics', 'lyrics', 1, 0.0001, 'QuadIn')
		setTextString('lyrics', value1)
		if value2 ~= '' then
			setTextColor('lyrics', value2)
		else
			setTextColor('lyrics', 'FFFFFF')
		end
		runTimer('Goneeeeeeeeeeeeeeeeeeeeee', 1, 1)
	end
end
function onTimerCompleted(tag)
	if tag == 'Goneeeeeeeeeeeeeeeeeeeeee' then
		doTweenAlpha('goneeeTxt', 'lyrics', 0, 0.2, 'QuadIn')
	end
end










