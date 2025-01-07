demHUD = {'timeBar', 'timeBarBG', 'timeTxt', 'botplayTxt', 'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'luigi'}
alpha = 0

function onEvent(n,v1,v2)
    if n == "Hide HUD" then
        for i = 1, #demHUD do
            doTweenAlpha(demHUD[i], demHUD[i], alpha, tonumber(v1))
        end
        if alpha == 0 then
            alpha = 1
        else
            alpha = 0
        end
    end
end