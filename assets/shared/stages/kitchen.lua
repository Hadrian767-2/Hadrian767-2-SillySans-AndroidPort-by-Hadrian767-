function onCustomSubstateCreate(name)
    if name == 'GameOver' then
startVideo('game_over_apple')
runTimer('xd',73)
    end
end
function onTimerCompleted(t)
if t == 'xd' then
    restartSong()
end
end
function onGameOver()
    openCustomSubstate('GameOver', true)
    return Function_Stop
  end
  
  function showGameOver()
    openCustomSubstate('GameOver', true)
  end
function onCreate()
    makeLuaSprite('uli','backgroundd/bg',-3080 ,-1440)
    addLuaSprite('uli')
    scaleObject('uli',4,4)

    makeLuaSprite('healthBarOrange','healthBarOrange',300 ,575)
    scaleObject('healthBarOrange',1,1)
    setObjectCamera('healthBarOrange','hud')

    makeLuaSprite('jumpscare','jumpscare',0 ,0)
    scaleObject('jumpscare',2,2)
    setObjectCamera('jumpscare','hud')
    addLuaSprite('jumpscare',true)
setProperty('jumpscare.alpha',0)

makeLuaSprite('White', '', -55, -600)
    luaSpriteMakeGraphic('White', 1600, 3000, '000000')
    addLuaSprite('White', false)
    setObjectCamera('White', 'other')

    makeLuaText('botplay', 'The Annoying Orange', 500, 1900,200)
    setProperty('botplay.x', 400)
    setTextSize('botplay', 50)
    addLuaText('botplay')
    setObjectCamera('botplay', 'other')
    setTextFont('botplay','Cooper Black Regular.ttf')
    setTextColor('botplay','F5B041')

    makeLuaText('botplay2', 'Amazing Grace: Rotten Smoothie', 1500, 1900,325)
    setProperty('botplay2.x', -100)
    setTextSize('botplay2', 50)
    addLuaText('botplay2')
    setObjectCamera('botplay2', 'other')
    setTextFont('botplay2','Cooper Black Regular.ttf')
    setTextColor('botplay2','FF0000')

    makeLuaText('botplay3', 'Composed by Fruiteater677', 1500, 1900,425)
    setProperty('botplay3.x', -100)
    setTextSize('botplay3', 50)
    addLuaText('botplay3')
    setObjectCamera('botplay3', 'other')
    setTextFont('botplay3','Cooper Black Regular.ttf')
    setTextColor('botplay3','ffffff')

makeLuaText('botplay4', 'Mod Ported By', 1500, 1900, 550)
setProperty('botplay4.x', -225)
setTextSize('botplay4', 50)
addLuaText('botplay4')
setObjectCamera('botplay4', 'other')
setTextFont('botplay4', 'Cooper Black Regular.ttf')
setTextColor('botplay4', 'ffffff')

makeLuaText('botplay4Name', 'Ulisegas', 1500, 2100, 550) 
setProperty('botplay4Name.x', 75)
setTextSize('botplay4Name', 50)
addLuaText('botplay4Name')
setObjectCamera('botplay4Name', 'other')
setTextFont('botplay4Name', 'Cooper Black Regular.ttf')
setTextColor('botplay4Name', '7FFFD4') 

    end
    function onCreatePost()
precacheImage('backgroundd/bg2')
precacheImage('backgroundd/bg3')

setProperty('healthBar.bg.visible',false)
scaleObject('healthBar',0.69,2.3)
setProperty('healthBar.x',134)
setProperty('healthBar.y',600)
addLuaSprite('healthBarOrange',true)
setTextSize('scoreTxt',getTextSize('scoreTxt')+1)
setObjectOrder('iconP1',getObjectOrder('healthBarOrange')+1)
setObjectOrder('iconP2',getObjectOrder('healthBarOrange')+1)
    end
    function onUpdatePost()
        setHealthBarColors('FF0000', '00FF00')
        local songScore = getProperty('songScore')
        setTextString('scoreTxt', 'score: ' .. songScore)    
        setProperty('iconP1.x',900)
        setProperty('iconP2.x',240)
        setTextFont('scoreTxt','CREABBB_.ttf')
        setObjectOrder('scoreTxt',getObjectOrder('healthBarOrange')+1)
        setTextColor('scoreTxt','F5B041')
        if downscroll then
            setProperty('healthBar.y',50)
            setProperty('healthBarOrange.y',25)
        end
    end

    
    f = 1
    
    function Particle()
        songPos = getSongPosition()
        currentBeat = (songPos/500)
        f = f + 1
        local sus = 'tweenY' .. f
        local susAlpha = 'tweenAlpha' .. f
    
        makeLuaSprite('part' .. f, 'backgroundd/fireparticle', math.random(-1000, 3000), 2000)
        doTweenY(sus, 'part' .. f, 20*math.tan((currentBeat+2*0.1)*math.pi), 5)
        doTweenAlpha(susAlpha, 'part' .. f, 0, math.random(4, 8))
        scaleObject('part' .. f, 3, 3)
        setProperty('part' .. f .. '.alpha', 0.75)
        addLuaSprite('part' .. f, false)
        if f >50 then
            f=1
        end
    end
    
    function onStepHit()
        if curStep == 2368 then
            setProperty('camHUD.alpha',0.1)
            setProperty('camGame.alpha',0)
            triggerEvent('Lyrics','','')
            removeLuaSprite('overlay', true)
        end
        if curStep == 2240 then
            makeLuaSprite('fruit1','backgroundd/fruit3',350 ,-500)
            scaleObject('fruit1',1,1)
            setObjectCamera('fruit1','other')
            addLuaSprite('fruit1',false)
            doTweenY('asd','fruit1',700,6,'linear')
            doTweenX('asd2','fruit1',-100,6,'linear')
            doTweenAngle('asd3','fruit1',270,12,'linear')
        end
        if curStep == 2288 then
            makeLuaSprite('fruit2','backgroundd/fruit4',1150 ,600)
            scaleObject('fruit2',1,1)
            setObjectCamera('fruit2','other')
            addLuaSprite('fruit2',false)
            doTweenY('asd2','fruit2',-700,6,'linear')
            doTweenX('asd22','fruit2',100,6,'linear')
            doTweenAngle('asd3','fruit2',180,10,'linear')
        end
        if curStep == 2208 then
            makeLuaSprite('55', '', -55, -600)
            luaSpriteMakeGraphic('55', 1600, 3000, '000000')
            addLuaSprite('55', true)
            setObjectCamera('55', 'other')
    
            makeLuaText('displayText', 'how', 1500, 1500, 325)
            setProperty('displayText.x', -600)  
            setTextSize('displayText', 50)
            addLuaText('displayText',true)
            setObjectCamera('displayText', 'other')
            setTextFont('displayText', 'Domine-Regular.ttf')
            setTextColor('displayText', 'FFFFFF')
        end
    
        if curStep == 2208+4 then
    
            makeLuaText('displayText2', 'sweet', 1500, 1500, 325)
            setProperty('displayText2.x', -450)  
            setTextSize('displayText2', 50)
            addLuaText('displayText2',true)
            setObjectCamera('displayText2', 'other')
            setTextFont('displayText2', 'Domine-Regular.ttf')
            setTextColor('displayText2', 'FFFFFF')
        end

        if curStep == 2208+8 then
    
            makeLuaText('displayText3', 'the', 1500, 1500, 325)
            setProperty('displayText3.x', -320)  
            setTextSize('displayText3', 50)
            addLuaText('displayText3',true)
            setObjectCamera('displayText3', 'other')
            setTextFont('displayText3', 'Domine-Regular.ttf')
            setTextColor('displayText3', 'FFFFFF')
        end

        if curStep == 2208+12 then
    
            makeLuaText('displayText4', 'sound.', 1500, 1500, 325)
            setProperty('displayText4.x', -180)  
            setTextSize('displayText4', 50)
            addLuaText('displayText4',true)
            setObjectCamera('displayText4', 'other')
            setTextFont('displayText4', 'Domine-Regular.ttf')
            setTextColor('displayText4', 'FFFFFF')
        end
        if curStep >2224 then
            removeLuaText('displayText')
            removeLuaText('displayText2')
            removeLuaText('displayText3')
            removeLuaText('displayText4')
           removeLuaSprite('55', false)
        end
    if curStep == 2080 then
        makeLuaSprite('White4', '', -55, -600)
        luaSpriteMakeGraphic('White4', 1600, 3000, '000000')
        addLuaSprite('White4', true)
        setObjectCamera('White4', 'other')

        makeLuaText('skibidi', 'amazing grace', 1500, 1900,325)
        setProperty('skibidi.x', -100)
        setTextSize('skibidi', 50)
        addLuaText('skibidi',true)
        setObjectCamera('skibidi', 'other')
        setTextFont('skibidi','Domine-Regular.ttf')
        setTextColor('skibidi','FFFFFF')
    elseif curStep>2084 then
        removeLuaText('skibidi')
        removeLuaSprite('White4', false)
    end
    if curStep == 2160 then
        makeLuaSprite('fruit1','backgroundd/fruit2',-550 ,-100)
        scaleObject('fruit1',1,1)
        setObjectCamera('fruit1','other')
        addLuaSprite('fruit1',false)
        doTweenY('asd','fruit1',700,4,'linear')
        doTweenX('asd2','fruit1',1200,4,'linear')
        doTweenAngle('asd3','fruit1',180,8,'linear')
    end
    if curStep>1821 then
    Particle()
    end
    if curStep==1968 then
        makeLuaSprite('fruit1','backgroundd/fruit1',-150 ,500)
        scaleObject('fruit1',1,1)
        setObjectCamera('fruit1','other')
        addLuaSprite('fruit1',false)
        doTweenY('asd','fruit1',-700,5,'linear')
        doTweenX('asd2','fruit1',1200,4,'linear')
        doTweenAngle('asd3','fruit1',180,6,'linear')
    end
    if curStep == 768 then
triggerEvent('Default Cam Zoom',0.65,1)
    end
    if curStep == 784 then
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]])
        makeLuaSprite('uli','backgroundd/bg2',-3080 ,-1440)
        addLuaSprite('uli')
        scaleObject('uli',4,4)
        triggerEvent('Default Cam Zoom',0.35,1)
cameraFlash('game','000000',8)
    end
    if curStep == 12 then
        doTweenAlpha('asd2','botplay',0,0.25,'linear')
        doTweenAlpha('asd232','botplay2',0,0.25,'linear')
        doTweenAlpha('as23323d','botplay3',0,0.25,'linear')
        doTweenAlpha('as23d','botplay4',0,0.25,'linear')
        doTweenAlpha('as23232d','botplay4Name',0,0.25,'linear')
    end
    if curStep > 16 then
        removeLuaText('botplay')
        removeLuaText('botplay2')
        removeLuaText('botplay3')
        removeLuaText('botplay4')
        removeLuaText('botplay4Name')
        removeLuaSprite('White')
    end
    if curStep == 514 then
        setProperty('jumpscare.alpha',1)
		for i = 0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5) 
		end
        setProperty('healthBar.alpha',0.5)
        setProperty('healthBarOrange.alpha',0.5)
        setProperty('scoreTxt.alpha',0.5)
        setProperty('iconP1.alpha',0.5)
        setProperty('iconP2.alpha',0.5)
        setProperty('timeBar.bg.alpha',0.5)
        setProperty('timeTxt.alpha',0.5)
        setProperty('timeBar.alpha',0.5)
    end
    if curStep == 528 then
        removeLuaSprite('jumpscare',true)
        for i = 0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha',1) 
		end
        setProperty('healthBar.alpha',1)
        setProperty('healthBarOrange.alpha',1)
        setProperty('scoreTxt.alpha',1)
        setProperty('iconP1.alpha',1)
        setProperty('iconP2.alpha',1)
        setProperty('timeBar.bg.alpha',1)
        setProperty('timeTxt.alpha',1)
        setProperty('timeBar.alpha',1)
    end
    if curStep == 1312 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0) 
		end

        noteTweenX('Movement X 0', 4, defaultOpponentStrumX2, 0.00000000001)
    	noteTweenX('Movement X 1', 5, defaultOpponentStrumX3, 0.00000000001)
    	noteTweenX('Movement X 2', 6, defaultPlayerStrumX0, 0.00000000001)
    	noteTweenX('Movement X 3', 7, defaultPlayerStrumX1, 0.00000000001)
	end
    if curStep==1920 then
        makeAnimatedLuaSprite('uli322','backgroundd/hand3',850 ,-440+2000)
        addAnimationByPrefix('uli322','id','hand3 idle',6,true)
        addLuaSprite('uli322')
        scaleObject('uli322',4,4)
        setProperty('uli322.flipX',true)
       
        makeAnimatedLuaSprite('uli3','backgroundd/hand1',0 ,-300+2000)
        addAnimationByPrefix('uli3','id','hand1 idle',6,true)
        addLuaSprite('uli3')
        scaleObject('uli3',4,4)
       setProperty('uli3.flipX',true)
       
        makeAnimatedLuaSprite('uli32','backgroundd/hand2',1000 ,140+2000)
        addAnimationByPrefix('uli32','id','hand2 idle',6,true)
        addLuaSprite('uli32',true)
        scaleObject('uli32',4,4)

        doTweenY('sad2','uli3',-300,1.25,'easeInOutBack')
   
    end
    if curStep==1930 then
        doTweenY('sad','uli322',-440,1.15,'easeInOutBack')
        doTweenY('sad22','uli32',140,1.05,'easeInOutBack')
    end
    if curStep == 1824 then
        stopVideoSprite('myCutscene3')
        setProperty('myCutscene3.alpha', 0)
        makeLuaSprite('uli','backgroundd/bg3',-3080 ,-1440)
        addLuaSprite('uli')
        scaleObject('uli',4,4)

        makeLuaSprite('overlay', 'backgroundd/overlay')
        addLuaSprite('overlay', true)
        setObjectCamera('overlay', 'other')
        scaleObject('overlay',2,2)

        setProperty('camHUD.alpha',1)
        setProperty('camGame.alpha',1)
 --


 --
        setProperty('healthBar.alpha',1)
        setProperty('healthBarOrange.alpha',1)
        setProperty('scoreTxt.alpha',1)
        setProperty('iconP1.alpha',1)
        setProperty('iconP2.alpha',1)
        setProperty('timeBar.bg.alpha',1)
        setProperty('timeTxt.alpha',1)
        setProperty('timeBar.alpha',1)
    end
    if curStep >1751 and curStep <2350 then
triggerEvent('Lyrics','','')
    end
    if curStep == 1816 then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) 
		end
        
        setProperty('camHUD.alpha',0.5)
        setProperty('camGame.alpha',0)
        noteTweenX('Movement X 0', 4, defaultPlayerStrumX0, 0.00000000001)
        noteTweenX('Movement X 1', 5, defaultPlayerStrumX1, 0.00000000001)
        noteTweenX('Movement X 2', 6, defaultPlayerStrumX2, 0.00000000001)
        noteTweenX('Movement X 3', 7, defaultPlayerStrumX3, 0.00000000001)
	end
    if curStep == 1304 then
        makeLuaSprite('White2', '', -55, -600)
        luaSpriteMakeGraphic('White2', 1600, 3000, '000000')
        addLuaSprite('White2', false)
        setObjectCamera('White2', 'other')
    end
    if curStep == 1313 then
        removeLuaSprite('White2', false)
    end
    if curStep == 1312 then
        for i = 0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0) 
		end
        setProperty('healthBar.alpha',0)
        setProperty('healthBarOrange.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
        setProperty('timeBar.bg.alpha',0)
        setProperty('timeTxt.alpha',0)
        setProperty('timeBar.alpha',0)
        if buildTarget == 'android' then
            local videoPath = callMethodFromClass('backend.Paths', 'video', {'rottenSmoothie_cutscene_noaudio'})
            createInstance('myCutscene3', 'backend.VideoSpriteManager', {0, 0, 1, 1}) 
            addInstance('myCutscene3', true)
            callMethod('myCutscene3.startVideo', {videoPath, false, 0})
            setProperty('myCutscene3.alpha', 1)
            setObjectCamera('myCutscene3', 'hud')
            setObjectOrder('myCutscene3', getObjectOrder('dadGroup'))
            setProperty('myCutscene3.antialiasing', true)
        else
            makeVideoSprite('myCutscene3', 'rottenSmoothie_cutscene_noaudio', 0,0, 'hud', false)
            setProperty('myCutscene3.alpha', 1)
            setObjectOrder('myCutscene3', getObjectOrder('dadGroup'))
            setProperty('myCutscene3.antialiasing', true)
        end
        
    end
    if curStep == 1560 then
        for i = 4, 7 do
            noteTweenAlpha('noteUp'..i, i, getPropertyFromGroup('strumLineNotes', i, 'alpha') +1, 1.5, 'linear')
        end
            
    end
end
function onUpdate()
    setProperty('gf.alpha',0)
end
function onEvent(name,value1,value2)
        if name == 'Lyrics' then
            local text, color = string.match(value1, "^(.-)%s*%-%-%s*(%w+)$")
    
            if not text then
                text = value1
                color = nil
            end
            
            makeLuaText('subsxd', text, 1200, 50, 500)
            
            if value2 == '0' then
                setProperty('subsxd.y',350)
                setTextSize('subsxd', 100)
            else
                setProperty('subsxd.y',500)
                setTextSize('subsxd', 25)
  
            end
            
            setTextAlignment('subsxd', 'center')
            setObjectCamera('subsxd', 'other')
            setProperty('subsxd.alpha', 1)
            setTextFont('subsxd', 'CREABBB_.ttf')
setTextBorder('subsxd',1,'000000')
            if color then
                if color == 'ORANGE' then
                    setTextColor('subsxd', 'FFA500') 
                elseif color == 'RED' then
                    setTextColor('subsxd', 'FF0000') 
                else
                    setTextColor('subsxd', 'FFFFFF') 
                end
            else
                setTextColor('subsxd', 'FFFFFF') 
            end
            
            addLuaText('subsxd', true)
        end
        
	if name == "White Screen Flash" then
cameraFlash('game','ffffff',value1)
	end
    if name == "Default Cam Zoom" then     
        if value2 == '' then
      	  setProperty("defaultCamZoom",value1)
	debugPrint(value2 )
	else
            doTweenZoom('camz','camGame',tonumber(value1),tonumber(value2),'sineInOut')
	end        
    end
end
function onTweenCompleted(name)
if name == 'camz' then
      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
end
end
