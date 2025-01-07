function onEvent(n,v1,v2)
    if n == "Section Zoom" then
        if v1 ~= '' then
            opZoom = tonumber(v1)
        end
        if v2 ~= '' then
            plZoom = tonumber(v2)
        end
    end
end

plZoom = 0
opZoom = 0

function onSectionHit()
    if mustHitSection and getProperty('defaultCamZoom') ~= plZoom then
        setProperty('defaultCamZoom', plZoom)
    elseif not mustHitSection and getProperty('defaultCamZoom') ~= opZoom then
        setProperty('defaultCamZoom', opZoom)
    end
end