function onEvent(n, v1, v2)
	if n == 'flash' then
		if v1 ~= '' then
			cameraFlash('other', v2, v1, true)
		else
			cameraFlash('other', white, 0.8, true)
		end
	end
end
