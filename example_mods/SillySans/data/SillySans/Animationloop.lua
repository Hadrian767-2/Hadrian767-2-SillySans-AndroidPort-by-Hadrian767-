function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
        end
    end
end

function goodNoteHit(_, _, _, s)
    if s then
        setProperty('boyfriend.holdTimer', 0)
    end
end

function opponentNoteHit(_, _, _, s)
    if s then
        setProperty('dad.holdTimer', 0)
    end
end