function onCreatePost()
	makeLuaSprite('DIFFERENTBARNAME', 'empty', 0, 0)
	makeGraphic('DIFFERENTBARNAME', 1280, 720, '000000')
	setObjectCamera('DIFFERENTBARNAME', 'other')
	addLuaSprite('DIFFERENTBARNAME', false)
	screenCenter('DIFFERENTBARNAME')
	setProperty('DIFFERENTBARNAME.alpha',0)
end

function onEvent(n,v1,v2)
	songPos = getSongPosition()
	
	if n == 'fadeBlackout' then
		if v1 == 'black' then
			doTweenAlpha('DIFFERENTBARNAME'..songPos,'DIFFERENTBARNAME',1,v2,'sineinout')
		end
		
		if v1 == 'normal' then
			doTweenAlpha('DIFFERENTBARNAME'..songPos,'DIFFERENTBARNAME',0,v2,'sineinout')
		end
		
	end
end