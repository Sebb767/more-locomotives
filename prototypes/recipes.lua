require("prototypes.config")

color_recipes = {}

data:extend({
  -- cargo locomotive
  {
    type = "recipe",
    name = "cargo-locomotive",
    energy_required = 5,
    enabled = false,
    ingredients = {
      {"engine-unit", 12},
      {"iron-gear-wheel", 16},
      {"iron-plate", 20},
      {"steel-plate", 4}
    },
    result = "cargo-locomotive"
  },
  -- high speed locomotive
  {
    type = "recipe",
    name = "hs-locomotive",
    energy_required = 5,
    enabled = false,
    ingredients = {
      {"engine-unit", 40},
      {"iron-gear-wheel", 32},
      {"iron-plate", 40 },
      {"steel-plate", 75 }
    },
    result = "hs-locomotive"
  }
})
