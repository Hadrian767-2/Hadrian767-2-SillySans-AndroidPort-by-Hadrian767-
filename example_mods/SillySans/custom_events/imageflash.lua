function onEvent(name, value1, value2)
	if name == 'imageflash' then
   
	setProperty('backflashidk.alpha', 0.5)
		doTweenAlpha('byebye', 'backflashidk', 0, 1, 'linear');
    end
end
