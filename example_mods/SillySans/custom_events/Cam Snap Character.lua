local dadcamx
local dadcamy
local bfcamx
local bfcamy
local gfcamx
local gfcamy
local ogZoom

function onCreatePost()
	dadcamx = getMidpointX('dad') + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
	dadcamy = getMidpointY('dad') + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
	bfcamx = getMidpointX('boyfriend') + getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
	bfcamy = getMidpointY('boyfriend') + getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
	gfcamx = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('gfCameraOffset[0]')
	gfcamy = getMidpointY('gf') + getProperty('gf.cameraPosition[0]') + getProperty('gfCameraOffset[0]')
    ogZoom = getProperty('camGame.zoom')
end

function onEvent(n, v1, v2)
    if n == "Cam Snap Character" then     
		if v1 == 'dad' then
			setProperty('camFollowPos.x', dadcamx)
			setProperty('camFollowPos.y', dadcamy)
            triggerEvent('Camera Follow Pos', dadcamx, dadcamy)
        end
        if v1 == 'bf' then
            setProperty('camFollowPos.x', bfcamx)
            setProperty('camFollowPos.y', bfcamy)
            triggerEvent('Camera Follow Pos', bfcamx, bfcamy)
        end
        if v1 == 'gf' then
            setProperty('camFollowPos.x', gfcamx)
            setProperty('camFollowPos.y', gfcamy)
            triggerEvent('Camera Follow Pos', gfcamx, gfcamy)
        end
        if v1 == 'duet' then
            triggerEvent('Camera Follow Pos', gfcamx, gfcamy)
            doTweenZoom('duetzoom', 'camGame', tonumber(ogZoom - 0.5), 1.5, 'sineInOut')
        end
        if v1 == 'duet end' then
            triggerEvent('Camera Follow Position', "", "")
            setProperty("defaultCamZoom", ogZoom) 
        end
        if v1 == 'end' then
            triggerEvent('Camera Follow Position', "", "")
        end
    end
end

function onTweenCompleted(name)
	if name == 'duetzoom' then
		setProperty("defaultCamZoom", getProperty('camGame.zoom')) 
	end
end