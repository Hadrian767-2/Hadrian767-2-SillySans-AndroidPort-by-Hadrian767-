local shaderName = "pixel"
local thingy = 0.1
local pixelTime = false

function onCreate()
    shaderCoordFix()

    makeLuaSprite("pixel")
    makeGraphic("shaderImage", screenWidth, screenHeight)

   setSpriteShader("shaderImage", "pixel")

    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("pixel").shader = shader0;
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("pixel").shader)]);
        return;
    ]])
end

function onUpdate(elapsed)
    setShaderFloat("pixel", "iTime", os.clock())
    setShaderFloat("pixel", "scale", thingy)
	
	if pixelTime then
		if intoPixel then
			if thingy < 15 then
				thingy = thingy + 0.1
			end
		else
			if thingy > 0.1 then
				thingy = thingy - 0.09
			end
		end
	end
 end
 
 function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end
 

function onEvent(n,v1)
	if n == "Pixel-Transition" then
		pixelTime = true
		if v1 == "in" then
			intoPixel = true
		else
			intoPixel = false
		end
	end
end