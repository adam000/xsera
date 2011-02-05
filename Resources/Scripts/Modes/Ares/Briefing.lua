import('GlobalVars')
import('Console')
import('BoxDrawing')

freezeMenuNum = 0
doLevelSwitch = true
background1 = { { xCoord = -280, yCoord = 140,  length = 560, text = " ",        boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "Select Level", underbox = -145 },
                { xCoord = -260, yCoord = -205, length = 150, text = "Cancel",   boxColour = ClutColour(3, 6),  textColour = ClutColour(13, 9), execute = nil, letter = "ESC" },
                { xCoord = 110,  yCoord = -205, length = 150, text = "Begin",    boxColour = ClutColour(12, 6), textColour = ClutColour(13, 9), execute = nil, letter = "RTRN" },
                { xCoord = -260, yCoord = -105, length = 150, text = "Previous", boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "LEFT" },
                { xCoord = 110,  yCoord = -105, length = 150, text = "Next",     boxColour = ClutColour(10, 8), textColour = ClutColour(13, 9), execute = nil, letter = "RGHT", special = "disabled" } }

background2 = { { xCoord = -280, yCoord = 175,  length = 560, text = " ",        boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "Mission Analysis", underbox = -200 },
                { xCoord = -280, yCoord = -225, length = 170, text = "Previous", boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "LEFT" },
                { xCoord = -100, yCoord = -225, length = 170, text = "Next",     boxColour = ClutColour(1, 8),  textColour = ClutColour(1, 8),  execute = nil, letter = "RGHT" },
                { xCoord = 110,  yCoord = -225, length = 170, text = "Done",     boxColour = ClutColour(12, 6), textColour = ClutColour(12, 6), execute = nil, letter = "RTRN" } }

-- scenBriefing is hardcoded to work only with Demo3, in the future it will load whatever scenario data that I need
scenBriefing = { planet = vec(0, 0),
    screen = { { { sprite = "Ships/Ishiman/HeavyCruiser", x = 0, y = 0, size = 0.2 },
                { sprite = "Planets/Saturny", x = 2500, y = 2500, size = 0.3 },
                { sprite = "Planets/AnotherEarth", x = 100, y = 100, size = 0.3 },
                { sprite = "Ships/Gaitori/Carrier", x = 2200, y = 2700, size = 0.2 } },
                { xCoord = -220, yCoord = 100, length = 220, text = " ", boxColour = ClutColour(3, 7), textColour = ClutColour(3, 7), execute = nil, letter = "Xsera System", underbox = -100, uboxText = "Land a transport here.", sidecar = { x = 60, y = 130, size = { x = 23, y = 23 } }, special = "sidecar" }
                } }
-- the above is [TEMPORARY] - scenLevels will be replaced by scen.levels and scenBriefing will be replaced by scen.briefing
levelNum = 1
screenNum = 1

function init()
    sound.stop_music()
    graphics.set_camera(-480, -360, 480, 360)
end

function update()
    if levelNum == 1 then
        ChangeSpecial("LEFT", "disabled", background1)
        ChangeSpecial("LEFT", "disabled", background2)
    else
        ChangeSpecial("LEFT", nil, background1)
        ChangeSpecial("LEFT", nil, background2)
    end
    if doLevelSwitch then
        if levelNum + 1 < #data.scenarios then -- [TODO] make sure that the user has unlocked the level for play
            ChangeSpecial("RGHT", nil, background1)
        else
            ChangeSpecial("RGHT", "disabled", background1)
        end
    else
        if scenBriefing.screen[levelNum] ~= nil then
            print("FOO")
            ChangeSpecial("RGHT", nil, background2)
        else
            ChangeSpecial("RGHT", "disabled", background2)
        end
    end
    while background1[num] ~= nil do
        if background1[num].special == "click" then
            background1[num].special = nil
        end
        num = num + 1
    end
    while background2[num] ~= nil do
        if background2[num].special == "click" then
            background2[num].special = nil
        end
        num = num + 1
    end
end

function render()
    graphics.begin_frame()
    
    -- Background
    graphics.draw_image("Panels/PanelTop", { x = 0, y = 210 }, { x = 572, y = 28 })
    graphics.draw_image("Panels/PanelBottom", { x = 0, y = -242 }, { x = 572, y = 20 })
    graphics.draw_image("Panels/PanelLeft", { x = -302, y = -14 }, { x = 33, y = 476 })
    graphics.draw_image("Panels/PanelRight", { x = 303, y = -14 }, { x = 35, y = 476 })
    
    -- Screen Info
    if doLevelSwitch then
        for _, val in ipairs(background1) do
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
    else
    -- When we load the scenario data, change all instances of "scenBriefing" to "scen.briefing"
        while background2[num] ~= nil do
            SwitchBox(background2[num])
            num = num + 1
        end
        if levelNum == 1 then
            graphics.draw_image("Scenario/Misc/Starmap", { x = 0, y = -10 }, { x = 533, y = 364 })
            -- add pointer to planet here when implemented
        else
            -- [TODO] [ADAM] this really should be in a function >_>
            local i = 0
            while i * GRID_DIST_BLUE < 4200 do
                if (i * GRID_DIST_BLUE) % GRID_DIST_LIGHT_BLUE ~= 0 then
                    if i * GRID_DIST_BLUE < 3000 then
                        graphics.draw_line({ x = -270, y = -170 + i * GRID_DIST_BLUE * 374 / 3000 }, { x = 270, y = -170 + i * GRID_DIST_BLUE * 374 / 3000 }, 1, ClutColour(4, 11))
                    end
                    graphics.draw_line({ x = -240 + i * GRID_DIST_BLUE * 540 / 4332, y = -196 }, { x = -240 + i * GRID_DIST_BLUE * 540 / 4332, y = 174 }, 1, ClutColour(4, 11))
                else
                    if i * GRID_DIST_BLUE < 3000 then
                        graphics.draw_line({ x = -270, y = -170 + i * GRID_DIST_BLUE * 374 / 3000 }, { x = 270, y = -170 + i * GRID_DIST_BLUE * 374 / 3000 }, 1, ClutColour(5, 1))
                    end
                    graphics.draw_line({ x = -240 + i * GRID_DIST_BLUE * 540 / 4332, y = -196 }, { x = -240 + i * GRID_DIST_BLUE * 540 / 4332, y = 174 }, 1, ClutColour(5, 1))
                end
                i = i + 1
            end
            for _, obj in ipairs(scenBriefing.screen[1]) do
                local temp = graphics.sprite_dimensions(obj.sprite)
                graphics.draw_sprite(obj.sprite, { x = -240 + obj.x * 540 / 4332, y = -170 + obj.y * 374 / 3000 }, { x = temp.x * obj.size, y = temp.y * obj.size }, math.pi / 2)
            end
           -- if levelNum ~= 2 then
                if scenBriefing.screen[levelNum - 1] ~= nil then
                    SwitchBox(scenBriefing.screen[levelNum - 1])
                end
         --   end
        end
    end
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
        mode_manager.switch('Ares/Splash')
    elseif k == "return" then
        if doLevelSwitch then
            sound.play_music("FRED")
            doLevelSwitch = false
            freezeMenuNum = levelNum
            levelNum = 1
        else
            mode_manager.switch("Demo4")
        end
    end
end

function key(k)
    if k == "escape" then
        if doLevelSwitch then
            ChangeSpecial("ESC", "click", background1)
        else
            ChangeSpecial("ESC", "click", background2)
        end
    elseif k == "return" then
        if doLevelSwitch then
            ChangeSpecial("RTRN", "click", background1)
        else
            ChangeSpecial("RTRN", "click", background2)
        end
    elseif k == "right" then
        if doLevelSwitch then
            if levelNum + 1 < #data.scenarios then
                levelNum = levelNum + 1
            end
        else
            if scenBriefing.screen[levelNum] ~= nil then
                levelNum = levelNum + 1
            end
        end
    elseif k == "left" then
        if levelNum ~= 1 then
            levelNum = levelNum - 1
        end
    end
end