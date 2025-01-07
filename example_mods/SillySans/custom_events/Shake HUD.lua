shake = 0
shaking = false

function onEvent(n,v1,v2)
    if n == "Shake HUD" then
        shake = tonumber(v1)
        shaking = not shaking
        if not shaking then
            setProperty('camHUD.x', 0)
            setProperty('camHUD.y', 0)
        end
    end
end

function onUpdatePost()
    if shaking then
        setProperty('camHUD.x', 0 + getRandomFloat(-shake, shake))
        setProperty('camHUD.y', 0 + getRandomFloat(-shake, shake))
    end
end