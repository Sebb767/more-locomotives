require("prototypes.config")

t_technologies = {}


train = util.table.deepcopy(data.raw["technology"]["railway"])
train.name = "cargo-locomotive"
train.icon = MOD_NAME.."/graphics/locomotive/orange/icon.png"
train.prerequisites = {"railway"}
train.unit = {count=25, ingredients={{"science-pack-1",1},{"science-pack-2",1}}, time=20}
train.order = "c-g-ac"
train.effects = {
  { type="unlock-recipe", recipe="cargo-locomotive" }
}
table.insert(t_technologies, train)

train = util.table.deepcopy(data.raw["technology"]["railway"])
train.name = "hs-locomotive"
train.icon = MOD_NAME.."/graphics/locomotive/red/icon.png"
train.prerequisites = {"railway"}
train.unit = { count=75, ingredients={{"science-pack-1",2},{"science-pack-2",2},{"science-pack-3",1}}, time=30}
train.order = "c-g-ac"
train.effects = {
  { type="unlock-recipe", recipe="hs-locomotive" }
}
table.insert(color_technologies, train)

data:extend(t_technologies)
