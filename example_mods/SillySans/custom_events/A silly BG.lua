function onEvent(n,v1,v2)
    if n == 'A silly BG' then
          makeVideoSprite('videoStart',v1,0,0,'cam'..v2,false)
    setObjectOrder('videoStart_video',11)
    setProperty('videoStart_video.alpha', 1)
    end
end