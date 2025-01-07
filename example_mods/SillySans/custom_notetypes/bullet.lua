function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet' then
			if getModSetting('bulletMechanic') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'BulletMario_NOTE_assets')
				setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			else
				removeFromGroup('unspawnNotes', i, true)
			end
		end
	end
	if getModSetting('bulletMechanic') then
		if getModSetting('bulletMisses') ~= 'Off' then
			ammoCount = tonumber(getModSetting('bulletMisses'))
			makeAnimatedLuaSprite('ammo', 'Bullet Ammo', 100, 900)
			addAnimationByPrefix('ammo', 'ammo', 'Bullet Ammo', 0, false)
			setObjectCamera('ammo', 'hud')
			setProperty('ammo.alpha', 0)
			scaleObject('ammo', 0.5, 0.5)
			setObjectOrder('ammo', getObjectOrder('iconP2') + 1)
			addLuaSprite('ammo', true)
			setProperty('ammo.animation.curAnim.curFrame', ammoCount)
		else
			noLimit = true
		end
	end
end

local bulletHit = false
local bulletDrain = 0
local ammoCount = 3
local noLimit = false
local volume = 1
local tilt = 4

function goodNoteHit(id, dir, noteType, sus)
	if noteType == 'bullet' and getModSetting('bulletMechanic') then
		if not noLimit then
			if not bulletHit then
				bulletHit = true
				doTweenY('ammoy', 'ammo', 510, 2, 'quadOut')
				doTweenAlpha('ammoa', 'ammo', 0.7, 2, 'quadOut')
			end
		end
		playSound('gunshot', volume)
		volume = 0
		runTimer('volumeCD', 0.1)
		playAnim('boyfriend', 'singUP-alt', true)
		setProperty('boyfriend.holdTimer', 0)
		setProperty('dad.alpha', 0.2)
		doTweenAlpha('dad', 'dad', 1, 0.5, 'sineOut')
		triggerEvent('Add Camera Zoom', '0.04', '0.02')
		setProperty('camGame.angle', tilt)
		doTweenAngle('camGame', 'camGame', 0, 0.1, 'smoothStepOut')
		tilt = -tilt
	end
end

function onUpdatePost()
	if bulletDrain > 0 and noLimit and getModSetting('bulletMechanic') then
		bulletDrain = bulletDrain - 0.1
		setHealth(getHealth() - (bulletDrain*0.002))
	end
end

function noteMiss(id, dir, noteType, sus)
	if noteType == 'bullet' and getModSetting('bulletMechanic') then
		if not noLimit then
			if not bulletHit then
				bulletHit = true
				doTweenY('ammoy', 'ammo', 510, 2, 'quadOut')
				doTweenAlpha('ammoa', 'ammo', 0.7, 2, 'quadOut')
			end
			if ammoCount > 0 then
				ammoCount = ammoCount - 1
				setProperty('ammo.animation.curAnim.curFrame', ammoCount)
			else
				setHealth(-1)
			end
		else
			bulletDrain = 5
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'volumeCD' then
		volume = 1
	end
end