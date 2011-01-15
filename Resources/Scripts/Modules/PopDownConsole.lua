import('Console')
import('Camera')

function PopDownConsole()
    if not keyboard[4][10].active and key == ConsoleKey then
        key = normal_key
        keyup = normal_keyup
        ConsoleAdd("$Leaving console...")
    end
    if keyboard[4][10].active and key == normal_key then
        isPopDown = true
        ConsoleAdd("$Loading console...")
        SetNewPrint()
        CONSOLE_MAX = 13
        keyup = ConsoleKeyup
        key = ConsoleKey
        ConsoleAdd("$Console loaded.")
        ConsoleAdd(">")
    end
    if keyboard[4][10].active then
        local cam = CameraToWindow()
        graphics.set_camera(cam[1], cam[2], cam[3], cam[4])
        graphics.draw_box(cam[4], cam[1], cam[4] - (CONSOLE_MAX - 1) * FONT_SIZE, cam[3], 2, ClutColour(1, 17))
        ConsoleDraw(CONSOLE_MAX)
        while line > CONSOLE_MAX do
            table.remove(consoleHistory, 1)
            line = line - 1
            lineFocus = line
        end
    end
end