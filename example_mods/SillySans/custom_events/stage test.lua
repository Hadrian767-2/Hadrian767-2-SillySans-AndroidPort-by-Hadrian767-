function onEvent(name, value1, value2)
	if name == 'stage test' then
addLuaScript('stages/'..value1)
loadScript(value1, true)
removeLuaScript('stages/'..value2)
removeLuaSprite('stages/'..value2);
	end
	end

local imageList = directoryFileList('mods/images/stage')

for _, image in pairs(imageList) do
    precacheImage('stage/'..image)
end