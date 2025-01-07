--I Used toggle trail from Psychic mod but fixed it.

-- variables
trailEnabledGF = false;
timerStartedGF = false;

trailLength = 8;
trailDelay = 0.05;
numberGF = 0.4
function onEvent(name, value1, value2)
	if name == "Toggle Trail" then
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'stopTrailGF' then
				createTrailFrameGF('GF');
				numberGF = 0
				trailEnabledGF = false
			end

			
			if tag == 'timerTrailGF' then
				createTrailFrameGF('GF');
			end
		end
		
		-- toggle gf trail
		if not (value1 == '0' or value1 == '') then
			numberGF = 0.4
			trailEnabledGF = true
			
			curTrailGF = 0;
			function createTrailFrameGF(tag)
				num = 0;
				color = -1;
				image = '';
				frame = 'GF Dancing Beat instancia 1';
				x = 0;
				y = 0;
				offsetX = 0;
				offsetY = 0;
			
				if tag == 'GF' then
					num = curTrailGF;
					curTrailGF = curTrailGF + 1;
					if trailEnabledGF then
						objectOrder = 4
						flip = getProperty('gf.flipX')
						color = getColorFromHex(''..gfColor);
						image = getProperty('gf.imageFile')
						frame = getProperty('gf.animation.frameName');
						x = getProperty('gf.x');
						y = getProperty('gf.y');
						offsetX = getProperty('gf.offset.x');
						offsetY = getProperty('gf.offset.y');
						scaleX = getProperty('gf.scale.x')
						scaleY = getProperty('gf.scale.y')
					end
				end
			
				if num - trailLength + 1 >= 0 then
					for i = (num - trailLength + 1), (num - 1) do
						setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.6 / (trailLength - 1)));
					end
				end
				removeLuaSprite('psychicTrail'..tag..(num - trailLength));
			
				if not (image == '') then
					trailTag = 'psychicTrail'..tag..num;
					makeAnimatedLuaSprite(trailTag, image, x, y);
					setProperty(trailTag..'.offset.x', offsetX);
					setProperty(trailTag..'.offset.y', offsetY);
					setProperty(trailTag..'.flipX', flip)
					setProperty(trailTag..'.scale.x', scaleX)
					setProperty(trailTag..'.scale.y', scaleY)
					--setObjectOrder(trailTag, objectOrder)
					setProperty(trailTag..'.alpha', numberGF);
					setProperty(trailTag..'.color', color);
					--setBlendMode(trailTag, 'add');
					addAnimationByPrefix(trailTag, 'stuff', frame, 0, false);
					addLuaSprite(trailTag, false);
				end
			end
			--number = 0.4
			if not timerStartedGF then
			runTimer('timerTrailGF', trailDelay, 0);
			timerStartedGF = true;
			trailEnabledGF = true
			GFColorPervious = (value1)
			GFColor = value1
		end
	else
		runTimer('stopTrailGF', 0.08)
		--number = 0
	end

	
--pervious color mechanic
if not (value1 == '1' or value1 == '0' or value1 == '') then
	gfColorPervious = (value1)
end

if not (value1 == '1' or value1 == '0' or value1 == '') then
	gfColor = value1
end
end

if value1 == '1' then
	gfColor = gfColorPervious
end

end


