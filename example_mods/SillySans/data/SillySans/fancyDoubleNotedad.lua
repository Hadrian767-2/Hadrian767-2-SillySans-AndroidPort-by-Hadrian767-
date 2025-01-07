-- Script by Unbekannt, credit would be hella sick

-- - - - - - - - - - - - - - - - - - - - Edit these and adjust them for your song! - - - - - - - - - - - - - - - - - - - - - - - - 
-- ________ Animation Names: __________________________ 
-- Put in the names of the animations in the characters xml file
XML_l = 'racistleft0' 		-- Left Sing
XML_d = 'racistdown0' 		-- Down Sing
XML_u = 'racistup0' 			-- Up Sing
XML_r = 'racistright0' 		-- Right Sing

-- ________ Animation Offsets: ________________________ 
-- Put in the offset of all the animations here. First number is X, second is Y 
-- You can find the animation offset in the character editor
lOs = {'53', '22'}		-- Left Sing
dOs = {'0', '1'}	-- Down Sing
uOs = {'-6', '65'}		-- Up Sing
rOs = {'39', '43'}		-- Right Sing	


		-- Template version
-- lOs = {'0', '0'}		-- Left Sing
-- dOs = {'0', '0'}		-- Down Sing
-- uOs = {'0', '0'}		-- Up Sing
-- rOs = {'0', '0'}		-- Right Sing	

-- ________ Base Offsets: ________________________ 
-- Position offset of the ghost 
offX = 0		-- X Positon Offset
offY = 15		-- Y Position Offset

-- ________ Name of the Ghost note: ___________________ 
-- The note type that uses the ghost, 'No Animation' is recommended (Since it doesn't make Bf sing)
doubleNoteName = 'No Animation'		

-- ________ Distance of the ghost: ____________________ 
-- distance of the ghost 
ghostMove = 400 -- ~300 is recommended

-- ________ Opacity of the ghost: _____________________
ghostAlpha = 0.7 -- 0.7 is recommended

-- ________ Time the ghost stays: _____________________
ghostDelay = 0.3 -- 0.3 is recommended

function onCreatePost()
	ghostEngine()
end

function onEvent(n)
  if n == 'Change Character' then
    ghostEngine()
    scaleObject('ghostdad',getProperty('dad.scale.x'),getProperty('dad.scale.y'))
    setProperty('ghostdad.y',getProperty('dad.y') + 100)
  end
end

-- - - - - - - - - - - - - - - - - - - - The actuall code - - - - - - - - - - - - - - - - - - - - - - - - 
function ghostEngine()
	makeAnimatedLuaSprite('ghostdad', getProperty('dad.imageFile'), getProperty('dad.x') + offX, getProperty('dad.y')- offY)
	addAnimationByPrefix('ghostdad', '0', XML_l, 24, false)
	addAnimationByPrefix('ghostdad', '1', XML_d, 24, false)
	addAnimationByPrefix('ghostdad', '2', XML_u, 24, false)
	addAnimationByPrefix('ghostdad', '3', XML_r, 24, false)
	setObjectOrder('ghostdad', getObjectOrder('dadGroup') - 1);
	setProperty('ghostdad.alpha', 0)
	addLuaSprite('ghostdad', true)
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if (noteType == doubleNoteName) then
        setProperty('ghostdad.alpha', ghostAlpha)
		cancelTween('doubleNoteTweenBack1')
		cancelTween('doubleNoteTweenBackAlpha1')
		runTimer('ghostSingsdad', ghostDelay)

		doTweenX('doubleNoteTween1', 'ghostdad', getProperty('dad.x') + offX + ghostMove, 0.25, 'sineOut' )
		
		objectPlayAnimation('ghostdad', noteData, true)
		if noteData == 0 then
			setProperty('ghostdad.offset.x', lOs[1])
			setProperty('ghostdad.offset.y', lOs[2])
		elseif noteData == 1 then
			setProperty('ghostdad.offset.x', dOs[1])
			setProperty('ghostdad.offset.y', dOs[2])
		elseif noteData == 2 then
			setProperty('ghostdad.offset.x', uOs[1])
			setProperty('ghostdad.offset.y', uOs[2])
		elseif noteData == 3 then
			setProperty('ghostdad.offset.x', rOs[1])
			setProperty('ghostdad.offset.y', rOs[2])
		end

	end
end

function onTimerCompleted(tag)
	if tag == 'ghostSingsdad' then
		doTweenX('doubleNoteTweenBack1', 'ghostdad', getProperty('dad.x') + offX, 0.5, 'quartIn')
		doTweenAlpha('doubleNoteTweenBackAlpha1', 'ghostdad', 0, 0.5, 'quartIn')
	end
end
