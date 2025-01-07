function onCreate()
    addCharacterToList('luigi-toolate', 'dadGroup')
    addCharacterToList('pico', 'boyfriendGroup')
    addCharacterToList('pico_run', 'boyfriendGroup')
    setProperty('gf.alpha', 0.001)

    hudText = {'scoreTxt', 'timeTxt', 'botplayTxt'}
    for i = 1, #hudText do
        setTextFont(hudText[i], 'mario2.ttf')
        setTextColor(hudText[i], 'f02828')
        setTextBorder(hudText[i], 2, '000000')
    end
    setTextSize('scoreTxt', 15)
    setTextSize('timeTxt', 22)
    setProperty('timeTxt.y', getProperty('timeTxt.y') + 3)
    setTextSize('botplayTxt', 22)
    setProperty('scoreTxt.y', getProperty('scoreTxt.y') + 5)
    setTimeBarColors('f02828')
    setObjectCamera('comboGroup', 'camGame')
    setObjectOrder('comboGroup', getObjectOrder('boyfriend') + 130)

    addLuaScript('custom_events/Window Name')
    triggerEvent('Window Name', "Friday Night Funkin': Mario's Madness | ??????? | ?????????? ??? ?????", 'marioIcon')

    addLuaScript('custom_events/Change Pause Desc')
    triggerEvent('Change Pause Desc', 'desc1')

    setProperty('healthBar.leftBar.scale.x', 0.853)
    setProperty('healthBar.leftBar.scale.y', 0.8)
    setProperty('healthBar.rightBar.scale.x', 0.853)
    setProperty('healthBar.rightBar.scale.y', 0.8)
    local iconP1y = getProperty('iconP1.y')
    local iconP2y = getProperty('iconP2.y')
    setProperty('iconP1.y', iconP1y + 10)
    setProperty('iconP2.y', iconP2y + 10)
    
    makeLuaSprite('luigi', 'luigi', 0, iconP1y + 10)
    setObjectCamera('luigi', 'hud')
    scaleObject('luigi', 0.2, 0.2)
    setProperty('luigi.visible', false)
    addLuaSprite('luigi', true)

    makeAnimatedLuaSprite('marioIcon', nil, 0, iconP1y - 20)
    loadGraphic('marioIcon', 'icons/icon-latemario', 150, 150)
    addAnimation('marioIcon', 'neutral', {0}, 0, true)
    addAnimation('marioIcon', 'danger', {1}, 0, true)
    setObjectCamera('marioIcon', 'hud')
    scaleObject('marioIcon', 0.8, 0.8)
    setProperty('marioIcon.flipX', true)
    setProperty('marioIcon.alpha', 0.001)
    addLuaSprite('marioIcon', true)

    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
    end
end

local luigiTime = false
local luigiIconPos = 55
local luigiIconOffset = 80
hallwaySection = false
changedToHallway = false
fadeAway = false

function onUpdatePost()
    if getProperty('cpuControlled') then
        if getProperty('iconP1.x') ~= getProperty('iconP1.x') + luigiIconOffset + (luigiIconPos*(getHealth()-1)) then
            setProperty('luigi.x', getProperty('iconP1.x') + luigiIconOffset + (luigiIconPos*(getHealth()-1)))
        end
        setTextString('scoreTxt', "Luigi's on the line")
        if not luigiTime then
            luigiTime = true
            loadGraphic('healthBar.bg', 'healthBarLuigi')
            for i = 1, #hudText do
                setTextColor(hudText[i], '20d14c')
            end
            setTimeBarColors('20d14c') 
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'texture', 'Luigi_NOTE_assets')
            end
                --[[
                    this lags the game so i didn't put it in

                    for i = 0, getProperty('unspawnNotes.length')-1 do
                        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
                            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Luigi_NOTE_assets')
                        end
                    end
                ]]
            setProperty('luigi.visible', true)
        end
    elseif not getProperty('cpuControlled') then
        if luigiTime then
            luigiTime = false
            loadGraphic('healthBar.bg', 'healthBar')
            for i = 1, #hudText do
                setTextColor(hudText[i], 'f02828')
            end
            setTimeBarColors('f02828') 
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'texture', 'Mario_NOTE_assets')
            end
                --[[
                    this lags the game so i didn't put it in

                    for i = 0, getProperty('unspawnNotes.length')-1 do
                        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
                            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Mario_NOTE_assets')
                        end
                    end
                ]]
            setProperty('luigi.visible', false)
        end
        setTextString('scoreTxt', 'Score: '..score..'      Misses: '..misses..'      Rating: '..rank..' ('..demRating..'%)')
        --setTextString('scoreTxt', 'Kornelbut')
    end

    if not hallwaySection then
        if getHealth() > 0 and getHealth() < 2 then
            setProperty('iconP1.x', 614 + (getProperty('iconP1.scale.x')-1) * 100 - (290*(getHealth()-1)))
            setProperty('iconP2.x', 513 - (getProperty('iconP2.scale.x')-1) * 100 - (290*(getHealth()-1)))
        elseif getHealth() >= 2 then
            setProperty('iconP1.x', 329 + (getProperty('iconP1.scale.x')-1) * 100)
            setProperty('iconP2.x', 228 - (getProperty('iconP2.scale.x')-1) * 100)  
        else
            setProperty('iconP1.x', 914)
            setProperty('iconP2.x', 813)
        end
    else
        if not changedToHallway then
            changedToHallway = true
            setProperty('iconP1.flipX', true)
            setProperty('healthBar.leftToRight', true)
            setHealthBarColors('b7d855', '42776a')
            luigiIconPos = -55
            luigiIconOffset = 40
        end
        setProperty('iconP1.x', 563 + (getProperty('iconP1.scale.x')-1) * 100 + (290*(getHealth()-1)))
        setProperty('iconP2.x', 228)
        setProperty('iconP2.angle', getRandomFloat(-3, 3))
    end

    if getProperty('marioIcon.x') ~= getProperty('iconP1.x') + 50 then
        setProperty('marioIcon.x', getProperty('iconP1.x') + 50)
        setProperty('marioIcon.scale.x', getProperty('iconP1.scale.x') - 0.2)
        setProperty('marioIcon.scale.y', getProperty('iconP1.scale.y') - 0.2)
    end

    if getProperty('healthBar.percent') < 20 or fadeAway then
        playAnim('marioIcon', 'danger')
    else
        playAnim('marioIcon', 'neutral')
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('iconP1.scale.x', getProperty('iconP1.scale.x') - 0.4)
        setProperty('iconP1.scale.y', getProperty('iconP1.scale.y') - 0.4)
    else
        setProperty('iconP2.scale.x', getProperty('iconP2.scale.x') - 0.4)
        setProperty('iconP2.scale.y', getProperty('iconP2.scale.y') - 0.4)
    end
end

function onUpdateScore()
    demRating = math.floor(getProperty('ratingPercent')*100)
    if demRating == 100 then
        rank = 'SS+'
    elseif demRating >= 90 and demRating < 100 then
        rank = 'S+'
    elseif demRating >= 80 and demRating < 90 then
        rank = 'S'
    elseif demRating >= 70 and demRating < 80 then
        rank = 'A+'
    elseif demRating == 69 then
        rank = 'A'
    elseif demRating >= 60 and demRating < 69 then
        rank = 'B'
    elseif demRating >= 50 and demRating < 60 then
        rank = 'C'
    elseif demRating >= 40 and demRating < 50 then
        rank = 'D'
    elseif demRating >= 20 and demRating < 40 then
        rank = 'E'
    elseif demRating > 0 and demRating < 20 then
        rank = 'F'
    elseif demRating == 0 then
        rank = '?'
    end
end

local mrlDrain = 0

function onStepHit()
    if curStep == 304 then
        mrlDrain = 0.005
    elseif curStep == 1728 then
        doTweenX('ghostLeft', 'gf', getProperty('gf.x') - 40, 4, 'sineInOut')
        doTweenY('ghostDown', 'gf', getProperty('gf.y') + 50, 2, 'sineInOut')
    elseif curStep == 2160 then
        fadeAway = true
    elseif curStep == 2176 then
        hallwaySection = true
        mrlDrain = 0.0175
        cancelTween('ghostLeft')
        cancelTween('ghostDown')
        cancelTween('ghostUp')
        cancelTween('ghostRight')
    end
end

function opponentNoteHit(i, dir, noteType, sus)
	if not mustHitSection then
		moveCamera(dir, 'dad')
	end

    if getHealth() - mrlDrain > 0.2 then
        setHealth(getHealth() - mrlDrain)
    end
end

function goodNoteHit(i, dir, noteType, sus)
	if mustHitSection then
		moveCamera(dir, 'boyfriend')
	end
end

cam_X = 0
cam_Y = 0

function moveCamera(dir, who)

	if dir == 0 then
		cam_X = 0 - 20
		cam_Y = 0
	elseif dir == 1 then
		cam_X = 0
		cam_Y = 0 + 20
	elseif dir == 2 then
		cam_X = 0
		cam_Y = 0 - 20
	elseif dir == 3 then
		cam_X = 0 + 20
		cam_Y = 0
	end

    doTweenX('cameraX', 'camGame.targetOffset', cam_X, 0.1, 'quintOut')
	doTweenY('cameraY', 'camGame.targetOffset', cam_Y, 0.1, 'quintOut')
	runTimer('fixCamera', getProperty(who..'.singDuration') - 3)
end

function onTweenCompleted(tag)
	if tag == 'fixCamera' then
        cam_X = 0
        cam_Y = 0
	end

    if tag == 'ghostDown' then
        doTweenY('ghostUp', 'gf', getProperty('gf.y') - 50, 2, 'sineInOut')
    elseif tag == 'ghostUp' then
        doTweenY('ghostDown', 'gf', getProperty('gf.y') + 50, 2, 'sineInOut')
    end
    if tag == 'ghostLeft' then
        doTweenX('ghostRight', 'gf', getProperty('gf.x') + 40, 4, 'sineInOut')
    elseif tag == 'ghostRight' then
        doTweenX('ghostLeft', 'gf', getProperty('gf.x') - 40, 4, 'sineInOut')
    end
end

function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
end