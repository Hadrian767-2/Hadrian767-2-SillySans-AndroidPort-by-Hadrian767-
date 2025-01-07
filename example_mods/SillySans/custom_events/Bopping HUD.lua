function onEvent(name, value1, value2)
	if name == 'Bopping HUD' then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		cameraFlash('camHUD', 'FFFFFF', 1, true)

		v1 = value1
		v2 = value2
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		setProperty('camHUD.angle', v1*3)
		doTweenAngle('hudTween', 'camHUD', 0, 1, 'backOut')
                setProperty('camGame.angle', v1*3)
		doTweenAngle('gameTween', 'camGame', 0, 1, 'backOut')
	else
		setProperty('camHUD.angle', v1*-3)
		doTweenAngle('hudTween', 'camHUD', 0, 1, 'backOut')
                setProperty('camGame.angle', v1*-3)
		doTweenAngle('gameTween', 'camGame', 0, 1, 'backOut')
	end
end