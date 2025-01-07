function onEvent(name,value1)
	if name == 'swap' then
		if value1 == 'aspasia' then
			
			setProperty('bigbg.alpha',0)
			setProperty('bigbg2.alpha',1)
			doTweenX('bgmovex','wooosh',-900,0.4,'linear')
			doTweenY('bgmovey','wooosh',-900,0.4,'linear')
		end
		
		if value1 == 'souls' then
			doTweenX('bgmovexback','wooosh',-980,0.4,'linear')
			doTweenY('bgmoveyback','wooosh',-1100,0.4,'linear')
			setProperty('bigbg.alpha',1)
			setProperty('bigbg2.alpha',0)
		end
		
	end
end