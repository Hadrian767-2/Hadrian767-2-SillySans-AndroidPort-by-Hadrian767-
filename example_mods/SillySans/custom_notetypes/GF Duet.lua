function goodNoteHit(id, dir, noteType, sus)
	if noteType == 'GF Duet' then
		playAnim('gf', getProperty('singAnimations')[dir+1], true)
		setProperty('gf.holdTimer', 0)
	end
end