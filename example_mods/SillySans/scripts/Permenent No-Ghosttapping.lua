local curGhostTapping = getPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping')
setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', false)
function onDestroy()
  setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', curGhostTapping)
end