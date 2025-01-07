function onEvent(n,v1,v2)
   if n == 'Move Shit' then
        cords = stringSplit(v2,',')
        v1 = v1 == 'bf' and 'boyfriend' or v1
        cords[1] = cords[1] == '' and getProperty(v1..'.x') or cords[1]
        cords[2] = cords[2] == '' and getProperty(v1..'.y') or cords[2]
        setProperty(v1..'.x',cords[1])
        setProperty(v1..'.y',cords[2])
   end
end