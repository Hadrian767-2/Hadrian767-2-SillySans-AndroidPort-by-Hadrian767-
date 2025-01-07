function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
	makeAnimatedLuaSprite('spacebar', 'spacebar_icon', 420, 200);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleLuaSprite('spacebar', 0.4, 0.4); 
    addLuaSprite('spacebar', true); 
   setProperty('spacebar.alpha', 0.000001)
   precacheSound('ALERT!!!')
   precacheSound('bonk')
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
	stopSound('ALERT!!!')
	playSound('ALERT!!!', 0.5, 'ALERT!!!')
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
   setProperty('spacebar.alpha', 1)
	
	end
end
dodge = {
	[0] = function()
		characterPlayAnim('boyfriend', 'dodgeUP', true)
	end,
	[1] = function()
		characterPlayAnim('boyfriend', 'dodgeLEFT', true)
	end,
	[2] = function()
		characterPlayAnim('boyfriend', 'dodgeRIGHT', true)
	end,
	[3] = function()
		characterPlayAnim('boyfriend', 'dodgeDOWN', true)
	end,
}
funnysound = {
	[0] = function()
	playSound('bonk', 1, 'bonk')
	end,
	[1] = function()
	playSound('pan', 0.5, 'pan')
	end,
	[2] = function()
	playSound('pipe', 1, 'pipe')
	end,
}
function onUpdate()
if botPlay then
   Dodged = true;
end
counter = math.random(0,3)
soundcounter = math.random(0,2)
health = getProperty('health')
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' then
	stopSound('ALERT!!!')
   setProperty('spacebar.alpha', 0)
		if Dodged == false then
   setProperty('health', health- 0.5);
   setProperty('boyfriend.specialAnim', true);
   characterPlayAnim('boyfriend', 'hurt', true)
	funnysound[soundcounter]()
		end
	if	Dodged == true then 
	Dodged = false
	dodge[counter]()
   setProperty('boyfriend.specialAnim', true);
		end
   
   
   end
end