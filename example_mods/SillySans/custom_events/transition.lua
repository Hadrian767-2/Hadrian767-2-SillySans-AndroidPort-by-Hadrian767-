function onEvent(name, value1, value2)
	if name == "transition" then
		makeLuaSprite('image', value1, 1000, 300);
		addLuaSprite('image', false);
		setProperty('image.alpha',0)
		doTweenAlpha('flTw','image',10 ,17 ,'linear')
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.001, 'quartIn');
    		scaleObject('image', 1.5, 1.5);
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 0.001, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end