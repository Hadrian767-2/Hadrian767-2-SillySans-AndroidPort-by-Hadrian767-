curIcon = 1
customHud = {'customBarP1', 'customBarP2', 'customHealthFrame', 'customIconP1', 'customIconP2', 'scoreTxt'}
-- are they global vars? if not, just remove them ig

function onCreate()
 makeLuaSprite('bg', 'bg/silly_mirror', -500, -200)
 makeLuaSprite('bgAlt', 'bg/broken_mirror', -500, -200)
 setProperty('bgAlt.alpha', 0) 
 makeLuaSprite('floor', 'bg/floor', 200, 1300)
 makeLuaSprite('woodFrames', 'bg/woodFrames', 375, 100) 
 makeLuaSprite('Silly_clouds', 'bg/Silly_clouds', 0, 0) 
 makeLuaSprite('Beforepill', 'bg/Beforepill', -300, 0) 
 makeLuaSprite('Glare', 'bg/Glare', 0, 0) 

 addLuaSprite('bg')
 addLuaSprite('bgAlt')
 addLuaSprite('floor')
 addLuaSprite('woodFrames')
 addLuaSprite('Silly_clouds') 
 addLuaSprite('Glare', true)
 addLuaSprite('Beforepill', true)

 setObjectOrder('bg', 1)
 setObjectOrder('bgAlt', 1)
 setObjectOrder('floor', 4)
 setObjectOrder('woodFrames', 5)
 setObjectOrder('Silly_clouds', 6)
 setObjectOrder('dadGroup', 8)
 setObjectOrder('boyfriendGroup', 9)
 setObjectOrder('Glare', 10)
 setObjectOrder('Beforepill', 11)
 scaleObject('bg', 1.5, 1.5);
 scaleObject('bgAlt', 1.5, 1.5);
 scaleObject('woodFrames', 1.5, 1.5);
 scaleObject('floor', 1.3, 1.3);
 scaleObject('Beforepill', 1.3, 1.3);
end

setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)

function onDestroy()
    setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', middlescroll)
end

function onEndSong()
    callMethodFromClass('backend.Highscore', 'saveScore', {songName, score, difficulty, rating})
    playMusic('freakyMenu', 1, true)
    runHaxeCode('import backend.MusicBeatState; MusicBeatState.switchState(new states.CreditsState());')
    return Function_Stop
end

function onCreatePost()
    for i = 0,3 do
        setObjectCamera('opponentStrums.members['..i..']','camGame')
        scaleObject('opponentStrums.members['..i..']',0.87,0.87,true)
        setProperty('opponentStrums.members['..i..'].scrollFactor.x',1)
        setProperty('opponentStrums.members['..i..'].scrollFactor.y',1)
        setObjectOrder('opponentStrums.members['..i..']', 2)
        setPropertyFromGroup('strumLineNotes',i,'x',getPropertyFromGroup('strumLineNotes',i,'x')+ getProperty("dadGroup.x") - 875)
        setPropertyFromGroup('strumLineNotes',i,'x',getPropertyFromGroup('strumLineNotes',i,'x')+ 45 *  i )
        setPropertyFromGroup('strumLineNotes',i,'y',getPropertyFromGroup('strumLineNotes',i,'y') + getProperty("dadGroup.y")-700 + (downscroll and 650 or 450))
      end
    setObjectOrder('noteGroup', 3)
    for i = 0, getProperty('unspawnNotes.length')-1 do
    setPropertyFromGroup('unspawnNotes', i, 'copyAlpha', false)
    setPropertyFromGroup('unspawnNotes', i, 'alpha', 0.5)
  end
end
function onSpawnNote(i,_,_,s)
    if not getPropertyFromGroup('notes', i, 'mustPress') then
        setObjectCamera('notes.members['..i..']','camGame')
        if not s then
            setProperty('notes.members['..i..'].scale.y',0.92)
        end
        setProperty('notes.members['..i..'].scale.x',0.92)
        updateHitboxFromGroup("notes", i)
        setProperty('notes.members['..i..'].scrollFactor.x',1)
        setProperty('notes.members['..i..'].scrollFactor.y',1)
        local duration = getPropertyFromGroup("notes", i,'strumTime') - getSongPosition() - 300
        if getProperty("songSpeed") < 1 then
            duration = duration * getProperty("songSpeed")
        end
        setPropertyFromGroup('notes', i, 'multSpeed', 2)
        runHaxeCode([[
            game.notes.members[]]..i..[[].extraData['MultSpeedTween'] = FlxTween.tween(game.notes.members[]]..i..[[],{multSpeed: 1},]]..tonumber(duration)..[[ * .001 / game.playbackRate,{ease: FlxEase.easeToUse});
        ]])
    end
end

function goodNoteHit()
    for i = 0, getProperty('grpNoteSplashes.length')-1 do
        callMethod('grpNoteSplashes.members['..i..'].offset.set', {-25, -25})
    end
end

local Step = 3887
function onStepHit()
    if curStep == Step then
        ChangeNotes()
    end

 if curStep == 3335 then
 for _, i in pairs({'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'Health', 'healthBarBG'}) do
  setProperty(i..'.alpha', 0.001) end
end
if curStep == 3359 then
    makeVideoSprite('videoStart2','sillybg',0,0,'camHUD',false)
    setObjectOrder('videoStart2_video',getObjectOrder("dadGroup")-1)
    setObjectOrder('videoStart2', 2)
    setGraphicSize('videoStart2_video', screenWidth, screenHeight)
    updateHitbox('videoStart2_video') 
    screenCenter('videoStart2_video')
    setScrollFactor('videoStart2_video', 0, 0)
end
 if curStep == 3439 then
  setProperty('bg.alpha', 0.001)
  setProperty('bgAlt.alpha', 1)
end
 if curStep == 3627 then
 setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
end
 if curStep == 3887 then
 for _, i in pairs({'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'Health', 'healthBarBG'}) do
  setProperty(i..'.alpha', 1) end
 setPropertyFromClass('backend.ClientPrefs', 'data.upScroll', true)
 setObjectCamera('dad', 'camGame')
end
 if curStep == 4176 then
  setProperty('camGame.alpha', 0.001)
  for i=4, 7 do
   noteTweenAlpha(i, i, 0, (stepCrochet / 1000) * 64)
  end
  end
end

function onSectionHit()
    if mustHitSection then
        setProperty('defaultCamZoom', 0.5)
    else
        setProperty('defaultCamZoom', 0.625)
    end
 
scaleObject('customBarP1', (getProperty('health') * 50) * 0.002625, 0.25)
 
 setProperty('customBarP2.x', (2.8 * (getProperty('health') * 50)) + 80)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
 local noteState = getPropertyFromGroup('notes', id, 'animation.name')
 local sTime = getPropertyFromGroup('notes', id, 'strumTime')
 local healthGain = getPropertyFromGroup('notes', id, 'hitHealth')
 
 playAnim('note' .. direction, 'hit', true)
 removeLuaSprite(tostring(noteState .. math.floor(sTime)), true)
 
 runHaxeCode('game.notes.members['..id..'].extraData["MultSpeedTween"].cancel();')

 if getProperty('health') >= 0.1 then
  setProperty('health', getProperty('health') - (healthGain * 0.085))
 end
end

function onEvent(name, v1, v2)
 if name == 'icon switch' then
  curIcon = v1
 end
end

sTime = {0, 0, 0, 0}
RGBTable = {
    [0] = {'492EC2','FFFFFF','141956'},
    [1] = {'3B3F5C','FFFFFF','141956'},
    [2] = {'6A5ACD','FFFFFF','141956'},
    [3] = {'0703ff','FFFFFF','141956'},
}

function ChangeNotes()
    for _,v in ipairs ({'notes','unspawnNotes'}) do
        for i = 0,getProperty(v..".length") - 1 do
            local dir = getPropertyFromGroup(v, i, 'noteData')
            setPropertyFromGroup(v, i, 'rgbShader.r', getColorFromHex(RGBTable[dir][1]))
            setPropertyFromGroup(v, i, 'rgbShader.g', getColorFromHex(RGBTable[dir][2]))
            setPropertyFromGroup(v, i, 'rgbShader.b', getColorFromHex(RGBTable[dir][3]))
        end
    end
end

function onUpdatePost()
    for i = 0, 7 do
        if getPropertyFromGroup("strumLineNotes",i,'rgbShader.enabled') and curStep >= 3887 then
            setPropertyFromGroup('strumLineNotes', i, 'rgbShader.r', getColorFromHex(RGBTable[i%4][1]))
            setPropertyFromGroup('strumLineNotes', i, 'rgbShader.g', getColorFromHex(RGBTable[i%4][2]))
            setPropertyFromGroup('strumLineNotes', i, 'rgbShader.b', getColorFromHex(RGBTable[i%4][3]))           
        end
    end
end

function onTweenCompleted(tag)
 if string.sub(tag, 1, 5) == 'move1' then
  doTweenY('move2' .. string.sub(tag, 6), string.sub(tag, 6), (string.find(tag, 'nS') == true) and 462 or 482, (stepCrochet / 1000) * 10, 'circIn')
 end
 
  if string.find(tag, 'iS') then
   doTweenY('scaleY' .. string.sub(tag, 6), string.sub(tag, 6) .. '.scale', 4, (stepCrochet / 1000) * 10, 'circIn')
  end
 if string.sub(tag, 1, 5) == 'move2' then
  removeLuaSprite(string.sub(tag, 6), true)
 end
end

function onUpdate() 
 for i = 0,3 do
 setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.3)
 end
end