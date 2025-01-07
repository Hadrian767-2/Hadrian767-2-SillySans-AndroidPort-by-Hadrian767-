function onEvent(name, value1, value2)
	if name == 'hide hud with event' then
		setProperty('camHUD.alpha', value1)
		if songName == 'Gravity' then
		setProperty('static.alpha', value1)
		setProperty('red.alpha', value1)
		end
    end
end
