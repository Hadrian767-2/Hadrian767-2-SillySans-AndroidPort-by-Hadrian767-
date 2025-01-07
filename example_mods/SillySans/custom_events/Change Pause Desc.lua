function onEvent(n,v1,v2)
    if n == "Change Pause Desc" then
        saveFile(currentModDirectory..'/data/overdue/desc.txt', getTextFromFile(currentModDirectory..'/data/overdue/'..v1..'.txt'))
    end
end