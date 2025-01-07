function onCreate()
    local IconPath='Sans'--Path of the image
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    runHaxeCode([[
        var Icon:Image=Image.fromFile(Paths.modFolders('images/]]..IconPath..[[.png'));
        Application.current.window.setIcon(Icon);
    ]])
end