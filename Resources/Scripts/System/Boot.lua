-- Preload all sounds
import("data")
import('PrintRecursive')
for idx, name in pairs(data.sounds) do
    print(name)
    sound.preload(name)
end

for idx, name in pairs(data.sprites) do
    if string.find(name, "/") == nil then
        graphics.preload_sprite_sheet(name)
    end
end

for idx, name in pairs(data.images) do
    if string.find(name, "/") == nil then
        graphics.preload_image(name)
    end
end

-- graphics.preload_font("prototype")
-- graphics.preload_font("sneakout")
