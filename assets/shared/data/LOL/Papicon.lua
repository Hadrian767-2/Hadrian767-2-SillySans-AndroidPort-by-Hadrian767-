function onCreatePost()
      setProperty('iconP2.y', getProperty('iconP2.y') + 10)
      getpath = 'icons/icon-'..getProperty('gf.healthIcon')
      makeLuaSprite('iconP3')
      setProperty('iconP3' .. '.alpha', 0)
      loadGraphic("iconP3", getpath,150,150)
      addAnimation("iconP3", getpath, {0,1},0,false)
      setObjectCamera('iconP3','hud')
      setObjectOrder('iconP3',getObjectOrder('uiGroup') + 1)
end

function onEvent(n)
    if n == 'Change Character' then
          onCreatePost()
    end
end
iconName = 'iconP3'
baseIconName = 'iconP2'
function onUpdatePost()
    
		scaleObject(iconName, getProperty(baseIconName .. '.scale.x') * 0.8, getProperty(baseIconName .. '.scale.y') * 0.8, false)
		setProperty(iconName .. '.x', getProperty(baseIconName .. '.x') - 80)
		setProperty(iconName .. '.y', getProperty(baseIconName .. '.y') - 50)
                setProperty(iconName .. '.angle', getProperty(baseIconName .. '.angle'))
                setProperty(iconName .. '.visible', getProperty(baseIconName .. '.visible'))
      setProperty(iconName..'.animation.curAnim.curFrame',getHealth() > 1.6 and (baseIconName == 'iconP1' and 0 or 1) or getHealth() < 0.4 and (baseIconName == 'iconP2' and 0 or 1))
end