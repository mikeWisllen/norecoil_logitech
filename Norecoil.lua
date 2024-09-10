--[[
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~

--~~mikeWisllen no Recoil Tool~~ ->	https://github.com/mikeWisllen
--]]


--	<===============~~Recoil Presets~~===============>

local recoilPresets = {
    {strength = 4, horizontalStrength = 0, description = "low"},
    {strength = 6, horizontalStrength = 1, description = "medium"},
    {strength = 8, horizontalStrength = 2, description = "high"}
}

local selectedPresetIndex = 1 -- Escolha o preset desejado (1 para baixo, 2 para médio, 3 para alto)


--	<===============~~Functions~~===============>
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg)
    
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
        local recoil = recoilPresets[selectedPresetIndex]
        repeat
            MoveMouseRelative(recoil.horizontalStrength, recoil.strength)
            Sleep(14)
        until not IsMouseButtonPressed(1)
    end
end
