require("prototypes.config")

color_recipes = {}

if ENABLE_TRAINS then
    -- recipes for colored trains
    for color,rgb in pairs(COLOR_TABLE) do
        train = {}
        train.type = "recipe"
        train.name = "diesel-locomotive-"..color
        train.enabled = false
        train.energy_required = CRAFTING_TIME_TRAINS
        train.ingredients = {{"diesel-locomotive", 1}}
        train.result = "diesel-locomotive-"..color
        table.insert(color_recipes,train)
    end
end

data:extend({
  -- cargo locomotive
  {
    type = "recipe",
    name = "cargo-locomotive",
    energy_required = 5,
    ingredients = {
      {"engine-unit", 12},
      {"iron-gear-wheel", 16},
      {"iron-plate", 20},
      {"steel-plate", 4}
    },
    result = "cargo-locomotive"
  }
})
