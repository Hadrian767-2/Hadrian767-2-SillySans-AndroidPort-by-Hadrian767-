

PerdStage = {'sky', 'flowers','plants','trees','ground','flowersfg','plantsfg','treesfg'}

soulsStage = {'road sky','floor','left tree','right tree'}


function onEvent(n,v1)
	if n == 'Satanos2Souls' then
	
		if v1 == 'souls' then
			for _, stage in ipairs(PerdStage) do
				setProperty(stage..'.visible',false);
			end
			
			if not isRunning('stages/souls') then
				addLuaScript('stages/souls')
			else 
				for _, soulsAdder in ipairs(soulsStage) do
					setProperty(soulsAdder..'.visible',true);
				end
			end
			
		elseif v1 == 'perd' then
			for _, soulsRemove in ipairs(soulsStage) do
				setProperty(soulsRemove..'.visible',false);
			end
			
			for _, predAdd in ipairs(PerdStage) do
				setProperty(predAdd..'.visible',true);
			end
			addPerdOffsets()
		end
	end
end

function addPerdOffsets()
	setProperty('boyfriend.x',1450)
	setProperty('boyfriend.y',600)
	setProperty('dad.x',465)
	setProperty('dad.y',340)
	setProperty('gf.y',getProperty('gf.y') - 50)
	setProperty('gf.x',getProperty('gf.x') + 100)
end