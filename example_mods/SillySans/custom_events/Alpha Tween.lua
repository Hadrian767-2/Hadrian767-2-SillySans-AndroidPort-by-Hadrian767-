function onEvent(name, v1, v2)
	if name == 'Alpha Tween' then
        local objects = mysplit(v1, ", ")
        local values = mysplit(v2, ", ")

		doTweenAlpha(objects[1], objects[2], tostring(values[1]), tostring(values[2]), values[3])
    end
end

function mysplit(inputstr, sep)
    local t = {}

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end

    return t
end