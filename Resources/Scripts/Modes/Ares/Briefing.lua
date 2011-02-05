import('GlobalVars') -- needed for temporary perma-variable with the selected level
import('Console')
import('BoxDrawing')

background = {  { xCoord = -280, yCoord = 190,  length = 560, text = " ",        boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "Mission Analysis", underbox = -185 },
                { xCoord = -280, yCoord = -210, length = 170, text = "Previous", boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "LEFT" },
                { xCoord = -100, yCoord = -210, length = 170, text = "Next",     boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "RGHT" },
                { xCoord = 110,  yCoord = -210, length = 170, text = "Done",     boxColour = ClutColour(12, 6), textColour = ClutColour(12, 6), execute = nil, letter = "RTRN" } }

screenNum = 1

function init()
    graphics.set_camera(-240 * aspectRatio, -240, 240 * aspectRatio, 240)
    sound.play_music("FRED")
end

function update()
    checkDisabledBox(screenNum, 1, 2)
    
    -- [TODO] [ADAM] I see this code in a lot of places... make it a function!
    for _, val in ipairs(background) do
        if val.special == "click" then
            val.special = nil
        end
    end
end

function render()
    graphics.begin_frame()
    
    -- Background
    graphics.draw_image("Panels/PanelTop",    { x = 0, y = 225 },  { x = 572, y = 28 })
    graphics.draw_image("Panels/PanelBottom", { x = 0, y = -227 }, { x = 572, y = 20 })
    graphics.draw_image("Panels/PanelLeft",   { x = -302, y = 1 }, { x = 33, y = 476 })
    graphics.draw_image("Panels/PanelRight",  { x = 303, y = 1 },  { x = 35, y = 476 })
    
    for _, val in ipairs (background) do
        SwitchBox(val)
    end
    
    -- [TODO] [ADAM] this really should be in a function >_>
    for i = 0, 4200, GRID_DIST_BLUE do
        if i % GRID_DIST_LIGHT_BLUE ~= 0 then
            if i < 3000 then
                graphics.draw_line({ x = -270, y = -155 + i * 374 / 3000 }, { x = 270, y = -155 + i * 374 / 3000 }, 1, ClutColour(4, 11))
            end
            graphics.draw_line({ x = -240 + i * 540 / 4332, y = -181 }, { x = -240 + i * 540 / 4332, y = 189 }, 1, ClutColour(4, 11))
        else
            if i < 3000 then
                graphics.draw_line({ x = -270, y = -155 + i * 374 / 3000 }, { x = 270, y = -155 + i * 374 / 3000 }, 1, ClutColour(5, 1))
            end
            graphics.draw_line({ x = -240 + i * 540 / 4332, y = -181 }, { x = -240 + i * 540 / 4332, y = 189 }, 1, ClutColour(5, 1))
        end
    end
    
    -- [TODO] put code for drawing briefing screens here
    
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
        -- [TODO] figure out some way to transmit screenNum
        mode_manager.switch("Demo4")
    end
end

function key(k)
    if k == "escape" then
        ChangeSpecial("ESC", "click", background)
    elseif k == "return" then
        ChangeSpecial("RTRN", "click", background)
    --[[ [TODO] get this part working properly by figuring out all briefing screens
    elseif k == "right" then
        if screenNum + 1 < #data.scenarios then
            screenNum = screenNum + 1
            checkDisabledBox()
        end
    elseif k == "left" then
        if screenNum ~= 1 then
            screenNum = screenNum - 1
            checkDisabledBox()
        end
    --]]
    end
end

function checkDisabledBox(numToCheck, lowerBound, upperBound)
    if numToCheck == lowerBound then
        ChangeSpecial("LEFT", "disabled", background)
    else
        ChangeSpecial("LEFT", nil, background)
    end
    
    if numToCheck == upperBound then -- [TODO] make sure that the user has unlocked the level for play
        ChangeSpecial("RGHT", nil, background)
    else
        ChangeSpecial("RGHT", "disabled", background)
    end
end