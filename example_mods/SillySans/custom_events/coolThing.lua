beatVignette = false
Vfactor = 4
targetAlpha = 1
secretBeatMode = false

function onCreate()
	makeLuaSprite('vignette', 'vignette', 0, 0)
	setBlendMode('vignette', 'subtract')
	setObjectCamera('vignette', 'Game')
	screenCenter('vignette')
	setProperty('vignette.alpha', 0)
	setScrollFactor('vignette',0,0)
	scaleObject('vignette', 1.7, 1.7);
	addLuaSprite('vignette', true)
	screenCenter('vignette')
end

function onBeatHit()
	if beatVignette then
		if secretBeatMode then
			setProperty('vignette.alpha', targetAlpha)
			doTweenAlpha('vignetteFade', 'vignette', 0, 0.3, 'sineOut')
			triggerEvent('Add Camera Zoom', '0.080', '0.1')
		
		else
			if curBeat % Vfactor == 0 then
				setProperty('vignette.alpha', targetAlpha)
				doTweenAlpha('vignetteFade', 'vignette', 0, 0.3, 'sineOut')
				triggerEvent('Add Camera Zoom', '0.080', '0.1')
			end
		end
	end
end

function onEvent(n,v1,v2)
	if n == 'coolThing' then
		if v1 == 'true' then
			beatVignette = true
		else
			beatVignette = false
		end
		
		if v2 == nil or v2 == '' then
			Vfactor = 4
		else
			if tonumber(v2) == 0 then
				secretBeatMode = true
			else
				Vfactor = tonumber(v2)
				secretBeatMode = false
			end
		end
	end
end