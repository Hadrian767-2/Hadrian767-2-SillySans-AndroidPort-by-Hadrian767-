function onCreatePost()
    for i = 0,getProperty('unspawnNotes.length') - 1 do
       if getPropertyFromGroup('unspawnNotes', i, 'gfNote') then
            setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0)
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
        end
    end
end

function onUpdatePost()
    for i = getProperty('notes.length') - 1, 0, -1 do
        if getProperty('notes.members['..i..'].gfNote') and getSongPosition() >= getProperty('notes.members['..i..'].strumTime') then
            if not getPropertyFromGroup('notes', i, 'isSustainNote') then
                playAnim('gf', getProperty('singAnimations')[getPropertyFromGroup('notes', i, 'noteData') + 1], true)
            end
            setProperty('gf.holdTimer', 0)
            removeFromGroup('notes', i)
            if getHealth() > 0.05 then
                addHealth(-0.0075)
               end
        end
    end
end