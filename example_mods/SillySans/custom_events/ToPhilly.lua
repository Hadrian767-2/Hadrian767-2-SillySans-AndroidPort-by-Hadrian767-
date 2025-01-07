-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'ToPhilly' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('StarvedBackground.alpha', targetAlpha);
        setProperty('StarvedFloor.alpha', targetAlpha);
        setProperty('light.alpha', targetAlpha);
		end
		-- ñ
	end
end