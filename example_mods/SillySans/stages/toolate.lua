function onCreate()

	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')

	local streetX = -1600
	local streetY = -560

	makeLuaSprite('dark', 'dark', -3, -5)
	setObjectCamera('dark', 'hud')
	addLuaSprite('dark', false)

	makeLuaSprite('backtrees', 'TooLateBG/street/BackTrees', streetX, streetY)
	setScrollFactor('backtrees', 0.9, 0.9)
	scaleObject('backtrees', 2, 2)
	addLuaSprite('backtrees', false)

	makeLuaSprite('fronttrees', 'TooLateBG/street/Front Trees', streetX, streetY)
	setScrollFactor('fronttrees', 0.95, 0.95)
	scaleObject('fronttrees', 2, 2)
	addLuaSprite('fronttrees', false)

	makeLuaSprite('road', 'TooLateBG/street/Road', streetX, streetY)
	scaleObject('road', 2, 2)
	addLuaSprite('road', false)

	makeLuaSprite('car', 'TooLateBG/street/car', streetX, streetY)
	addLuaSprite('car', false)

	makeLuaSprite('foregroundtrees', 'TooLateBG/street/Foreground Trees', streetX, streetY)
	setScrollFactor('foregroundtrees', 1.1, 1.1)
	scaleObject('foregroundtrees', 2, 2)
	addLuaSprite('foregroundtrees', true)

	local meatX = -2600
	local meatY = -1300

	beef = {'sky', 'farbg', 'bg', 'medbg', 'ground', 'pupil', 'string', 'topteeth', 'bottomteeth', 'closefg', 'fog'}

	makeLuaSprite('sky', 'TooLateBG/meat/TL_Meat_Sky', meatX, meatY)
	scaleObject('sky', 8, 8)
	setProperty('sky.alpha', 0.001)
	addLuaSprite('sky', false)

	makeLuaSprite('farbg', 'TooLateBG/meat/TL_Meat_FarBG', meatX, meatY)
	setScrollFactor('farbg', 0.3, 0.3)
	scaleObject('farbg', 8, 8)
	setProperty('farbg.alpha', 0.001)
	addLuaSprite('farbg', false)

	makeLuaSprite('bg', 'TooLateBG/meat/TL_Meat_BG', meatX, meatY)
	setScrollFactor('bg', 0.5, 0.5)
	scaleObject('bg', 4, 4)
	setProperty('bg.alpha', 0.001)
	addLuaSprite('bg', false)

	makeLuaSprite('medbg', 'TooLateBG/meat/TL_Meat_MedBG', meatX, meatY)
	setScrollFactor('medbg', 0.7, 0.7)
	scaleObject('medbg', 4, 4)
	setProperty('medbg.alpha', 0.001)
	addLuaSprite('medbg', false)

	makeLuaSprite('ground', 'TooLateBG/meat/TL_Meat_Ground', meatX, meatY)
	scaleObject('ground', 4, 4)
	setProperty('ground.alpha', 0.001)
	addLuaSprite('ground', false)

	makeLuaSprite('pupil', 'TooLateBG/meat/TL_Meat_Pupil', meatX + 2800, meatY + 1250)
	scaleObject('pupil', 2, 2)
	setProperty('pupil.alpha', 0.001)
	addLuaSprite('pupil', false)

	makeLuaSprite('string', 'TooLateBG/meat/TL_Meat_FG_string', meatX + 3600, meatY + 500)
	scaleObject('string', 4, 4)
	setProperty('string.alpha', 0.001)
	addLuaSprite('string', true)

	makeLuaSprite('topteeth', 'TooLateBG/meat/TL_Meat_FG_topteeth', meatX + 900, meatY)
	scaleObject('topteeth', 2, 2)
	setProperty('topteeth.alpha', 0.001)
	addLuaSprite('topteeth', true)

	makeLuaSprite('bottomteeth', 'TooLateBG/meat/TL_Meat_FG_bottomteeth', meatX + 1300, meatY + 2000)
	scaleObject('bottomteeth', 4, 4)
	setProperty('bottomteeth.alpha', 0.001)
	addLuaSprite('bottomteeth', true)

	makeLuaSprite('topteeth2', 'TooLateBG/meat/TL_Meat_FG_topteeth2', meatX + 950, meatY - 1000)
	scaleObject('topteeth2', 2, 2)
	setProperty('topteeth2.alpha', 0.001)
	addLuaSprite('topteeth2', true)

	makeLuaSprite('closefg', 'TooLateBG/meat/TL_Meat_CloseFG', meatX + 100, meatY)
	setScrollFactor('closefg', 1.2, 1.2)
	scaleObject('closefg', 4, 4)
	setProperty('closefg.alpha', 0.001)
	addLuaSprite('closefg', true)

	makeLuaSprite('fog', 'TooLateBG/meat/TL_Meat_Fog', -10, -10)
	scaleObject('fog', 1.1, 1.1)
	setObjectCamera('fog', 'hud')
	setProperty('fog.alpha', 0.001)
	addLuaSprite('fog', false)

	local hallwayX = -1000
	local hallwayY = 700

	makeAnimatedLuaSprite('floor', 'TooLateBG/feet/Overdue_Final_BG_floorfixed', hallwayX, hallwayY)
	setProperty('floor.alpha', 0.001)
	addLuaSprite('floor', false)

	makeAnimatedLuaSprite('top', 'TooLateBG/feet/Overdue_Final_BG_topfixed', hallwayX, hallwayY - 1600)
	setProperty('top.alpha', 0.001)
	addLuaSprite('top', false)

	mrLoffset = 410
	mrLdur = 0.15
	anims = {'left', 'down', 'up', 'right'}

	createInstance('backmrL', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, -1050})
	loadGraphic('backmrL', 'Too_Late_Luigi_Hallway')
	runHaxeCode('getVar(\'backmrL\').frames = Paths.getSparrowAtlas(\'Too_Late_Luigi_Hallway\');')
    addAnimationByPrefix('backmrL', 'idle', 'tll idle', 24, false)
    playAnim('backmrL', 'idle', true)
	setProperty('backmrL.velocity.x', -2100)
	setProperty('backmrL.y', -700)
	setProperty('backmrL.color', getColorFromHex('828282'))
	scaleObject('backmrL', 0.6, 0.6)
	setProperty('backmrL.alpha', 0.001)
	addInstance('backmrL')

	createInstance('midmrL', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, -1100})
	loadGraphic('midmrL', 'Too_Late_Luigi_Hallway')
	runHaxeCode('getVar(\'midmrL\').frames = Paths.getSparrowAtlas(\'Too_Late_Luigi_Hallway\');')
    addAnimationByPrefix('midmrL', 'idle', 'tll idle', 24, false)
    playAnim('midmrL', 'idle', true)
	setProperty('midmrL.velocity.x', -2500)
	setProperty('midmrL.y', -900)
	setProperty('midmrL.color', getColorFromHex('828282'))
	scaleObject('midmrL', 0.8, 0.8)
	setProperty('midmrL.alpha', 0.001)
	addInstance('midmrL')

	createInstance('mrL', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, -1160})
	loadGraphic('mrL', 'Too_Late_Luigi_Hallway')
	runHaxeCode('getVar(\'mrL\').frames = Paths.getSparrowAtlas(\'Too_Late_Luigi_Hallway\');')
    addAnimationByPrefix('mrL', 'idle', 'tll idle', 24, false)
	addAnimationByPrefix('mrL', 'left', 'tll left', 24, false)
	addAnimationByPrefix('mrL', 'down', 'tll down', 24, false)
	addAnimationByPrefix('mrL', 'up', 'tll up', 24, false)
	addAnimationByPrefix('mrL', 'right', 'tll right', 24, false)
    playAnim('mrL', 'idle', true)
	setProperty('mrL.velocity.x', -2800)
	setProperty('mrL.y', -1150)
	setProperty('mrL.alpha', 0.001)
	addInstance('mrL')

	createInstance('frontmrL', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 1300})
	loadGraphic('frontmrL', 'TooLateBG/feet/FG_Too_Late_Luigi')
	setProperty('frontmrL.velocity.x', -3100)
	setProperty('frontmrL.y', -700)
	setProperty('frontmrL.alpha', 0.001)
	addInstance('frontmrL', true)
end

function opponentNoteHit(i, dir, noteType, sus)
	if hallwaySection then
		playAnim('mrL', anims[dir+1], true)
	end
end

local gameOverX = 700
local gameOverY = 300

hallwaySection = false

function onEvent(n,v1,v2)
    if n == "Progress Overdue" then
        if v1 == 'meat' then
			ogPos = getProperty('bottomteeth.y')

			setProperty('bottomteeth.alpha', 1)
			setProperty('topteeth2.alpha', 1)
	
			doTweenY('bottomteeth', 'bottomteeth', getProperty('bottomteeth.y') - 600, 0.2, 'linear')
			doTweenY('topteeth2', 'topteeth2', getProperty('topteeth2.y') + 800, 0.2, 'linear')
			runTimer('wait', 0.4)
		elseif v1 == 'fade' then
			for i = 1, #beef do
				doTweenAlpha(beef[i], beef[i], 0, (crochet/1000)*20)
			end
			doTweenAlpha('floor', 'floor', 1, (crochet/1000)*20)
			doTweenAlpha('fade', 'fade', 1, (crochet/1000)*20)
			doTweenAlpha('top', 'top', 1, (crochet/1000)*20)
		elseif v1 == 'hallway' then
			pupilMoving = false
			hallwaySection = true
			gameOverX = 1300
			gameOverY = 300
			addAnimationByPrefix('floor', 'floor', 'Floor', 16, true)
			addAnimationByPrefix('top', 'top', 'Top', 16, true)
			setProperty('opponentCameraOffset[0]', 880)
			setProperty('opponentCameraOffset[1]', -100)
			setProperty('boyfriendCameraOffset[1]', -100)
			doTweenX('byeLuigi', 'dad', getProperty('dad.x') - 3000, 1)
	
			doTweenAlpha('frontmrLAppear', 'frontmrL', 1, 0.2)
			doTweenAlpha('midmrLAppear', 'midmrL', 1, 0.2)
			doTweenAlpha('backmrLAppear', 'backmrL', 1, 0.2)
			doTweenAlpha('mrLAppear', 'mrL', 1, 0.2)
        end
    end
end

function onStepHit()
	if curStep == 1392 then
		setProperty('boyfriendCameraOffset[1]', -300)
	elseif curStep == 1648 then
		setProperty('boyfriendCameraOffset[1]', -200)
    elseif curStep == 2688 then --end hallway
		doTweenAlpha('frontmrLAppear', 'frontmrL', 0, 1.2)
		doTweenAlpha('midmrLAppear', 'midmrL', 0, 1.2)
		doTweenAlpha('backmrLAppear', 'backmrL', 0, 1.2)
		doTweenAlpha('mrLAppear', 'mrL', 0, 1.2)
		doTweenAlpha('iconP2', 'iconP2', 0, 1.2)
    end

	if getProperty('mrL.animation.curAnim.finished') then
		playAnim('mrL', 'idle', true)
	end
end

local focus = false

function onSectionHit()
	if pupilMoving then
		if mustHitSection and focus then
			focus = false
			doTweenX('pupilMove', 'pupil', 280, 1.7, 'quadInOut')
		elseif not mustHitSection and not focus then
			focus = true
			doTweenX('pupilMove', 'pupil', 160, 1.7, 'quadInOut')
		end
	end
end

function onGameOver()
	setProperty('boyfriend.x', gameOverX)
	setProperty('boyfriend.y', gameOverY)
end

function onTimerCompleted(tag)
    if tag == 'wait' then
        doTweenY('bottomteeth', 'bottomteeth', ogPos, 0.4, 'sineIn')
        doTweenY('topteethBye', 'topteeth2', getProperty('topteeth2.y') - 800, 0.4, 'sineIn')
    end
end

function onTweenCompleted(tag)
	if tag == 'topteeth2' then
        playSound('teethslam')
		gameOverX = 1000
		gameOverY = 260
		removeLuaSprite('backtrees')
		removeLuaSprite('fronttrees')
		removeLuaSprite('road')
		removeLuaSprite('car')
		removeLuaSprite('foregroundtrees')
		setProperty('bg.alpha', 1)
		setProperty('closefg.alpha', 1)
		setProperty('farbg.alpha', 1)
		setProperty('bottomteeth.alpha', 1)
		setProperty('string.alpha', 1)
		setProperty('topteeth.alpha', 1)
		setProperty('topteeth2.alpha', 1)
		setProperty('ground.alpha', 1)
		setProperty('medbg.alpha', 1)
		setProperty('sky.alpha', 1)

		doTweenAlpha('fog', 'fog', 1, 1)
		setProperty('pupil.alpha', 1)
		pupilMoving = true

		setProperty('boyfriendGroup.y', 250) --this doesn't reset when the character switches
		setProperty('boyfriendCameraOffset[1]', -200)
    elseif tag == 'topteethBye' then
        removeLuaSprite('topteeth2')
	elseif tag == 'byeLuigi' then
		setProperty('dad.visible', false)
		setProperty('dad.x', -670)
	end

end