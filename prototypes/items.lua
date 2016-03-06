require("prototypes.config")

color_items = {}

if ENABLE_LAMPS then
    -- replace stock lamp icon with "brighter" one to make sure it's consistent with, but distinct from, the white indicator lamps
    data.raw["item"]["small-lamp"].icon = MOD_NAME.."/graphics/lamp/stock/icon.png"

    -- colored indicator lamp inventory items
    i = 0
    for color,rgb in pairs(COLOR_TABLE) do
        --ugly numbering/zero padding hack to get the crafting screen to sort chromatically rather than alphabetically
        i = i + 1
        if i < 10 then pad = "0" else pad = "" end
        lamp = util.table.deepcopy(data.raw["item"]["small-lamp"])
        lamp.name = "small-lamp-"..color
        lamp.icon = MOD_NAME.."/graphics/lamp/"..color.."/icon.png"
        lamp.place_result = "small-lamp-"..color
        lamp.order = "l-a"..pad..i.."-"..color.."]"
        lamp.subgroup = "color-lamps"
        table.insert(color_items,lamp)
    end
end

if ENABLE_TRAINS then
    -- replace stock locomotive icon to match new 'unmarked' appearance
    data.raw["item"]["diesel-locomotive"].icon = MOD_NAME.."/graphics/locomotive/stock/icon.png"

    -- colored train inventory items
    i = 0
    for color,rgb in pairs(COLOR_TABLE) do
        --ugly numbering/zero padding hack to get the crafting screen to sort chromatically rather than alphabetically
        i = i + 1
        if i < 10 then pad = "0" else pad = "" end
        locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
        locomotive.name = "diesel-locomotive-"..color
        locomotive.icon = MOD_NAME.."/graphics/locomotive/"..color.."/icon.png"
        locomotive.place_result = "diesel-locomotive-"..color
        locomotive.order = "t-a"..pad..i.."-"..color.."]"
        locomotive.subgroup = "color-trains"
        table.insert(color_items,locomotive)
    end
end


locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
locomotive.name = "cargo-locomotive"
locomotive.icon = MOD_NAME.."/graphics/locomotive/orange/icon.png"
locomotive.place_result = "cargo-locomotive"
table.insert(color_items,locomotive)

locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
locomotive.name = "hs-locomotive"
locomotive.icon = MOD_NAME.."/graphics/locomotive/red/icon.png"
locomotive.place_result = "hs-locomotive"
table.insert(color_items,locomotive)

data:extend(color_items)
