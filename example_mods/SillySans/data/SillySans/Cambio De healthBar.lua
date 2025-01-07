function onCreatePost()
    loadGraphic('healthBar.bg', 'Sillybar')
    callMethod('healthBar.leftBar.makeGraphic', {getProperty('healthBar.bg.width'), getProperty('healthBar.bg.height'), -1})
    callMethod('healthBar.rightBar.makeGraphic', {getProperty('healthBar.bg.width'), getProperty('healthBar.bg.height'), -1})
    setProperty('healthBar.barHeight', getProperty('healthBar.bg.height') - 6)
    setProperty('healthBar.barWidth', getProperty('healthBar.bg.width') - 6)
    screenCenter('healthBar', 'x')

    local image = 'Silly_Healthbar'
    local scalex = 0.5
    local scaley = 0.5
    local x = 565
    local y = 305
    if songName == 'my-spot' then
	image = 'hud-my-spot'
	scalex = 0.960
	scaley = 0.960
	x = 185
	y = 95
    end	

    if downscroll then 
      y = -255
      x = 560
      setProperty('iconP1.y', 580)
      setProperty('iconP2.y', 580)
      setProperty('scoreTxt.y', 580)
    end
 
    makeLuaSprite('Health', image, getProperty('healthBar.x') - x, getProperty('healthBar.y') - y)
    setObjectCamera('Health', 'other')
    runHaxeCode("uiGroup.insert(uiGroup.members.indexOf(healthBar.bg), game.getLuaObject('Health'));")
    setObjectOrder('Health', getObjectOrder('healthBar.bg') + 14)
    setObjectOrder('iconP1', getObjectOrder('healthBar') + 18)
    setObjectOrder('iconP2', getObjectOrder('healthBar') + 19)
    setObjectOrder('scoreTxt', getObjectOrder('healthBar') + 20)
    setProperty('healthBar.visible', true)
    setProperty('healthBar.scale.x', 1.02)
    setProperty('healthBar.scale.x', 1.02)
    setProperty('healthBarBG.scale.x', 1.02)
    setProperty('healthBarBG.scale.y', 1.02)
    setProperty('Health.scale.x', scalex)
    setProperty('Health.scale.y', scaley)

    makeLuaSprite('oscuro', null, 0, 0)
    makeGraphic('oscuro', 1400, 1100, '000000')
    setObjectCamera('oscuro', 'camOther')
    setProperty('oscuro.alpha',0)
    addLuaSprite('oscuro', true)

    makeLuaSprite('UpBarr', null, 0, -500)
    makeGraphic('UpBarr', 1400, 300, '000000')
    setObjectCamera('UpBarr', 'camOther')
    addLuaSprite('UpBarr', true)

    makeLuaSprite('DownBarr', null, 0, 900)
    makeGraphic('DownBarr', 1400, 300, '000000')
    setObjectCamera('DownBarr', 'camOther')
    addLuaSprite('DownBarr', true)
   
    local color = 'FFFFFF'
    if songName == 'my-new-plaything' then
	color = '881A1A'
	bX = 'By :The leon'
    elseif songName == 'too-slow' then
	color = '881A1A'
	bX = 'By :Samfenix231_YT'
    elseif songName == 'our-new-plaything-old' then
	color = '881A1A'
	bX = 'By :CoffeeDrummer'
    elseif songName == 'my-spot' then
	color = 'FFFFFF'
	bX = 'By :The Laggin Man'
    elseif songName == 'wooden-hand' then
	color = '881A1A'
	bX = 'By :CoffeeDrummer'
    end

    makeLuaSprite('color', null, -500, 100)
    makeGraphic('color', 300, 100, color)
    setObjectCamera('color', 'camHud')
    addLuaSprite('color', true)

    makeLuaSprite('black', null, -500, 100)
    makeGraphic('black', 300, 100, '000000')
    setObjectCamera('black', 'camHud')
    addLuaSprite('black', true)

    -- se viene lo epico
    makeLuaText('SongName', songName, 0, -500, 110)
    setTextSize('SongName', 20)
    setTextBorder('SongName', 2, '000000')
    addLuaText('SongName')
    setObjectCamera('SongName', 'camHud')

    makeLuaText('SongbX', bX, 0, -500,150)
    setTextSize('SongbX', 20)
    setTextBorder('SongbX', 2, '000000')
    addLuaText('SongbX')
    setObjectCamera('SongbX', 'camHud')
end

function onSongStart()
    for _, i in ipairs({'color', 'black', 'SongName', 'SongbX'}) do
	local tiem = {0.7, 0.8, 1, 1}
	startTween('songthing'.._, i, {x = i ~= 'color' and 0 or 50}, tiem[_], {ease = 'circInOut'})
    end
    runTimer('ekisde',4)
end

function onStepHit()
    if songName == 'my-new-plaything' then
	if curStep == 1768 then
	    setProperty('Health.alpha', 0.001) 
	elseif curStep == 2105 then
	    setProperty('Health.alpha', 1)
	elseif curStep == 2487 then
	    setProperty('Health.alpha', 0.001)
	end
    end
end

function onTimerCompleted(tag)
    if tag =='ekisde' then
	for _, i in ipairs({'color', 'black', 'SongName', 'SongbX'}) do
	    local tiem = {0.7, 0.8, 1, 0.7}
	    startTween('hola'.._, i, {x = i ~= 'SongbX' and -500 or -900}, tiem[_], {ease = 'circInOut'})
	end
    end
end

function onTweenCompleted(tag)
    if tag == 'hola1' and tag == 'hola2' and tag == 'hola3' and tag == 'hola4' then
	removeLuaSprite('color') 
	removeLuaSprite('black') 
	removeLuaText('SongName')
	removeluaText('SongbX')
    end        
end