function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' then
		makeLuaSprite('whitebg', '', -2000, -2000)
		makeGraphic('whitebg',10000,10000,'ffffff')
		addLuaSprite('whitebg', false)
		setProperty('boyfriend.color', '000000')
		setProperty('dad.color', '000000')
		setProperty('gf.color', '000000')
		setProperty('Glare.alpha', 0)
		setProperty('woodFrames.alpha', 0)
		setProperty('Silly_clouds.alpha', 0)
		setProperty('Beforepill.alpha', 0)
		setProperty('floor.alpha', 0)
	end
	if name == 'badapplelol' and value1 == 'b' then
		removeLuaSprite('whitebg')
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
		setProperty('Glare.alpha', 1)
		setProperty('woodFrames.alpha', 1)
		setProperty('Silly_clouds.alpha', 1)
		setProperty('Beforepill.alpha', 1)
		setProperty('floor.alpha', 1)
	end
end