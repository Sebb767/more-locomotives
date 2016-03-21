require("prototypes.config")

t_items = {}


locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
locomotive.name = "cargo-locomotive"
locomotive.icon = MOD_NAME.."/graphics/locomotive/orange/icon.png"
locomotive.place_result = "cargo-locomotive"
table.insert(t_items,locomotive)

locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
locomotive.name = "hs-locomotive"
locomotive.icon = MOD_NAME.."/graphics/locomotive/red/icon.png"
locomotive.place_result = "hs-locomotive"
table.insert(t_items,locomotive)

locomotive = util.table.deepcopy(data.raw["item"]["diesel-locomotive"])
locomotive.name = "electro-locomotive"
locomotive.icon = MOD_NAME.."/graphics/locomotive/blue/icon.png"
locomotive.place_result = "electro-locomotive"
table.insert(t_items,locomotive)

data:extend(t_items)
