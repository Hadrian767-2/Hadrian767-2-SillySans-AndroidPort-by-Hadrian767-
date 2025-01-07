--lazy af recreation by kornelbut. credit would be neat

--HOW TO ADD CREDITS AND DESCRIPTION TUTORIAL 101.png

local paused = false
local canPause = true
local option = 1
local maxOption = 4

pauseItems = {'Resume', 'Restart', 'Botplay', 'Exit', 'blackBG', 'redBG', 'fade', 'line'}
songs = {'Creative Exercise', 'Monkey Song', 'Mysterious'}

function onUpdatePost()
    if keyJustPressed('pause') and canPause then
        playSound('pause')
        pauseMusic = getModSetting('pauseMusic')
        if getModSetting('pauseMusic') == 'Random' then
            pauseMusic = songs[getRandomInt(1,#songs)]
        end
        openCustomSubstate('pauseMenu', true)
    end
end

function onCustomSubstateCreatePost(tag)
	if tag == 'pauseMenu' then
        makeLuaSprite('dim', '', 0, 0)
        makeGraphic('dim', 1280, 720, '000000')
        setObjectCamera('dim', 'other')
        setProperty('dim.alpha', 0.7)
        addLuaSprite('dim', true)

        makeLuaSprite('blackBG', '', -250, 0)
        makeGraphic('blackBG', 550, 720, '000000')
        setObjectCamera('blackBG', 'other')
        addLuaSprite('blackBG', true)

        makeLuaSprite('redBG', '', -250, 0)
        makeGraphic('redBG', 530, 720, 'FF0000')
        setObjectCamera('redBG', 'other')
        addLuaSprite('redBG', true)

        makeLuaSprite('fade', 'pauseMenu/fadeCuzIdkShaders', -250, 0)
        setObjectCamera('fade', 'other')
        addLuaSprite('fade', true)

        makeLuaSprite('line', '', 260, 0)
        makeGraphic('line', 5, 720, '000000')
        setObjectCamera('line', 'other')
        addLuaSprite('line', true)

        for i = 1, 4 do
            makeAnimatedLuaSprite(pauseItems[i], 'pauseMenu/Mario_pause_'..pauseItems[i], -180, 90+(i-1)*150)
            addAnimationByPrefix(pauseItems[i], 'off', pauseItems[i]..' white', 24, true)
            addAnimationByPrefix(pauseItems[i], 'on', pauseItems[i]..' basic', 24, true)
            setObjectCamera(pauseItems[i], 'other')
            scaleObject(pauseItems[i], 0.5, 0.5)
            addLuaSprite(pauseItems[i], true)
            playAnim(pauseItems[i], 'off')
        end

        for i = 1, #pauseItems do
            doTweenX(pauseItems[i], pauseItems[i], getProperty(pauseItems[i]..'.x') + 200, 0.3, 'backOut')
        end

        playingIn = 'freeplay'
        if isStoryMode then
            playingIn = 'story mode'
        end

        makeLuaText('credits', playingIn..'\n\n\n'..getTextFromFile('data/'..songPath..'/cred.txt'), 650, 560, 30)
        setObjectCamera('credits', 'other')
        setTextSize('credits', 20)
        setTextFont('credits', 'Pixel Emulator.otf')
        setTextBorder('credits', 0)
        setTextAlignment('credits', 'left')
        setProperty('credits.alpha', 0)
        addLuaText('credits')

        makeLuaSprite('under1', '', getProperty('credits.x'), getProperty('credits.y') + 28)
        makeGraphic('under1', 650, 3, 'FFFFFF')
        setObjectCamera('under1', 'other')
        setProperty('under1.alpha', 0)
        addLuaSprite('under1', true)

        makeLuaText('name', songName, 650, 560, 60)
        setObjectCamera('name', 'other')
        setTextSize('name', 26)
        setTextFont('name', 'Pixel Emulator.otf')
        setTextBorder('name', 0)
        setTextAlignment('name', 'left')
        setProperty('name.alpha', 0)
        addLuaText('name')

        makeLuaText('desc', 'description\n\n'..getTextFromFile('data/'..songPath..'/desc.txt'), 650, 560, 340)
        setObjectCamera('desc', 'other')
        setTextSize('desc', 20)
        setTextFont('desc', 'Pixel Emulator.otf')
        setTextBorder('desc', 0)
        setTextAlignment('desc', 'left')
        setProperty('desc.alpha', 0)
        addLuaText('desc')

        makeLuaSprite('under2', '', getProperty('desc.x'), getProperty('desc.y') + 34)
        makeGraphic('under2', 650, 3, 'FFFFFF')
        setObjectCamera('under2', 'other')
        setProperty('under2.alpha', 0)
        addLuaSprite('under2', true)

        makeLuaText('bot', 'BOTPLAY', 1200, 1120, 670)
        setObjectCamera('bot', 'other')
        setTextSize('bot', 30)
        setTextBorder('botplayText', 0)
        setTextAlignment('bot', 'left')
        setProperty('bot.visible', getProperty('cpuControlled'))
        addLuaText('bot')

        playAnim('Resume', 'on')
	end
end

function onCustomSubstateUpdate(tag)
	if tag == 'pauseMenu' then
        if keyJustPressed('accept') then
            optionPicked()
        end
        optionSelection()
	end
end

function optionSelection()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') and option ~= maxOption then
        option = option + 1
        playSound('menu', 1)
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') and option == maxOption then
        option = 1
        playSound('menu', 1)
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') and option ~= 1 then
        option = option - 1
        playSound('menu', 1)
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') and option == 1 then
        option = maxOption
        playSound('menu', 1)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
        if option == 1 then
            playAnim('Resume', 'on')
            playAnim('Restart', 'off')
            playAnim('Exit', 'off')
        elseif option == 2 then
            playAnim('Restart', 'on')
            playAnim('Botplay', 'off')
            playAnim('Resume', 'off')
        elseif option == 3 then
            playAnim('Botplay', 'on')
            playAnim('Exit', 'off')
            playAnim('Restart', 'off')
        elseif option == 4 then
            playAnim('Exit', 'on')
            playAnim('Resume', 'off')
            playAnim('Botplay', 'off')
        end
    end
end

function optionPicked()
    if option == 1 then
        stopSound(pauseMusic)
        removeButtons()
    elseif option == 2 then
        playSound('restart')
        stopSound(pauseMusic)
        restartSong()
    elseif option == 3 then
        setProperty('cpuControlled', not getProperty('cpuControlled'))
        setProperty('bot.visible', getProperty('cpuControlled'))
    elseif option == 4 then
        stopSound(pauseMusic)
        exitSong()
    end
end

function removeButtons()
    for i = 1, #pauseItems do
        removeLuaSprite(pauseItems[i], true)
    end
    removeLuaSprite('dim', true)
    removeLuaText('credits', true)
    removeLuaText('name', true)
    removeLuaText('desc', true)
    removeLuaSprite('under1', true)
    removeLuaSprite('under2', true)
    removeLuaText('bot', true)
    closeCustomSubstate('pauseMenu')
end

function onTweenCompleted(tag)
    if tag == 'Resume' then
        doTweenAlpha('credits', 'credits', 1, 0.2, 'linear')
        doTweenAlpha('under1', 'under1', 1, 0.2, 'linear')
        doTweenAlpha('name', 'name', 1, 0.2, 'linear')
    elseif tag == 'credits' then
        doTweenAlpha('desc', 'desc', 1, 0.2, 'linear')
        doTweenAlpha('under2', 'under2', 1, 0.2, 'linear')
        playSound(pauseMusic, 0, pauseMusic)
        soundFadeIn(pauseMusic, 20, 0, 1)
    end
end

function onSoundFinished(tag)
    if tag == pauseMusic then
        playSound(pauseMusic, 1, pauseMusic)
    end
end

function onPause()
    return Function_Stop
end

function onGameOver()
    closeCustomSubstate('pauseMenu')
end

function onGameOverStart()
    canPause = false
	closeCustomSubstate('pauseMenu')
end