-- import('GlobalVars')
import('Console')
import('BoxDrawing')

levelNum = 1

background = { { xCoord = -280, yCoord = 140,  length = 560, text = " ",         boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "Select Level", underbox = -145 },
                { xCoord = -260, yCoord = -205, length = 150, text = "Cancel",   boxColour = ClutColour(3, 6),  textColour = ClutColour(13, 9), execute = nil, letter = "ESC" },
                { xCoord = 110,  yCoord = -205, length = 150, text = "Begin",    boxColour = ClutColour(12, 6), textColour = ClutColour(13, 9), execute = nil, letter = "RTRN" },
                { xCoord = -260, yCoord = -105, length = 150, text = "Previous", boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "LEFT" },
                { xCoord = 110,  yCoord = -105, length = 150, text = "Next",     boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "RGHT" } }

function init()
    sound.stop_music()
    graphics.set_camera(-480, -360, 480, 360)
    checkDisabledBox()
end

function update()
    for _, val in ipairs(background) do
        if val.special == "click" then
            val.special = nil
        end
    end
end

function render()
    graphics.begin_frame()
    
    -- Background
    graphics.draw_image("Panels/PanelTop", { x = 0, y = 210 }, { x = 572, y = 28 })
    graphics.draw_image("Panels/PanelBottom", { x = 0, y = -242 }, { x = 572, y = 20 })
    graphics.draw_image("Panels/PanelLeft", { x = -302, y = -14 }, { x = 33, y = 476 })
    graphics.draw_image("Panels/PanelRight", { x = 303, y = -14 }, { x = 35, y = 476 })
    
    for _, val in ipairs(background) do
        SwitchBox(val)
    end
    
    local title, subtitle = string.match(data.scenarios[levelNum].name, "(.+)\r(.+)")
    local desc = ""
    
    for _, val in pairs(data.scenarios[levelNum].scoreString) do
        desc = desc .. val .. "\n"
    end
    if not data.scenarios[levelNum].scoreString or #data.scenarios[levelNum].scoreString == 0 then
        desc = nil
    end
    
    SwitchBox( { top = 120, left = -260, bottom = -55, right = 260, boxColour = ClutColour(10, 8), title = title, subtitle = subtitle, desc = desc } )
    
    -- Error Printing
    if errNotice ~= nil then
        graphics.draw_text(errNotice.text, MAIN_FONT, "center", { x = 0, y = -270 }, 28)
        if errNotice.start + errNotice.duration < mode_manager.time() then
            errNotice = nil
        end
    end
    graphics.end_frame()
end

function keyup(k)
    if k == "escape" then
        mode_manager.switch("Ares/Splash")
    elseif k == "return" then
        if #data.scenarios[demoLevel].briefing == 0 then
            -- [TODO] figure out some way to transmit levelNum
            mode_manager.switch("Demo4")
        end
        -- [TODO] figure out some way to transmit levelNum
        mode_manager.switch("Ares/Briefing")
    end
end

function key(k)
    if k == "escape" then
        ChangeSpecial("ESC", "click", background)
    elseif k == "return" then
        ChangeSpecial("RTRN", "click", background)
    elseif k == "right" then
        if levelNum + 1 < #data.scenarios then
            levelNum = levelNum + 1
            checkDisabledBox()
        end
    elseif k == "left" then
        if levelNum ~= 1 then
            levelNum = levelNum - 1
            checkDisabledBox()
        end
    end
end

-- [TODO] [ADAM] this function is in two separate files, consolidate!
function checkDisabledBox()
    if levelNum == 1 then
        ChangeSpecial("LEFT", "disabled", background)
    else
        ChangeSpecial("LEFT", nil, background)
    end
    
    if levelNum + 1 < #data.scenarios then -- [TODO] make sure that the user has unlocked the level for play
        ChangeSpecial("RGHT", nil, background)
    else
        ChangeSpecial("RGHT", "disabled", background)
    end
end