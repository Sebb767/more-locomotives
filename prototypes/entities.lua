require("prototypes.config")

new_trains = {}

-- Cargo Locomotive
cargo_loc = util.table.deepcopy(data.raw["locomotive"]["diesel-locomotive"])
cargo_loc.name = "cargo-locomotive"
cargo_loc.minable["result"] = cargo_loc.name
base_path = "/graphics/locomotive/orange"
cargo_loc.icon                  = MOD_NAME..base_path.."/icon.png"
cargo_loc.pictures.filenames[1] = MOD_NAME..base_path.."/01.png"
cargo_loc.pictures.filenames[2] = MOD_NAME..base_path.."/02.png"
cargo_loc.pictures.filenames[3] = MOD_NAME..base_path.."/03.png"
cargo_loc.pictures.filenames[4] = MOD_NAME..base_path.."/04.png"
cargo_loc.pictures.filenames[5] = MOD_NAME..base_path.."/05.png"
cargo_loc.pictures.filenames[6] = MOD_NAME..base_path.."/06.png"
cargo_loc.pictures.filenames[7] = MOD_NAME..base_path.."/07.png"
cargo_loc.pictures.filenames[8] = MOD_NAME..base_path.."/08.png"
cargo_loc.air_resistance = 0.0005
cargo_loc.max_health = 2500

cargo_loc.max_speed = 0.4
cargo_loc.max_power = "400kW"
if CARGOLOC_SLOW_ACCELERATION then
  cargo_loc.max_powers = "250kW"
end
cargo_loc.braking_force = 24
front_light_file = {
            filename = "__core__/graphics/light-cone.png",
            priority = "medium",
            scale = 3,
            width = 250,
            height = 250
          }
cargo_loc.front_light =
      {
        {
          type = "oriented",
          minimum_darkness = 0.2,
          picture = front_light_file,
          shift = {0.6, -20},
          size = 2,
          intensity = 0.6
        },
        {
          type = "oriented",
          minimum_darkness = 0.2,
          picture = front_light_file,
          shift = {-0.6, -20},
          size = 2,
          intensity = 0.6
        }
      }
cargo_loc.energy_source =
    {
      type = "burner",
      effectivity = 1.6,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 80,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1,
        }
      }
    }

table.insert(new_trains, cargo_loc)

-- high-speed locomotive
hs_loc = util.table.deepcopy(data.raw["locomotive"]["diesel-locomotive"])
hs_loc.name = "hs-locomotive"
hs_loc.minable["result"] = hs_loc.name
base_path = "/graphics/locomotive/red"
hs_loc.icon                  = MOD_NAME..base_path.."/icon.png"
hs_loc.pictures.filenames[1] = MOD_NAME..base_path.."/01.png"
hs_loc.pictures.filenames[2] = MOD_NAME..base_path.."/02.png"
hs_loc.pictures.filenames[3] = MOD_NAME..base_path.."/03.png"
hs_loc.pictures.filenames[4] = MOD_NAME..base_path.."/04.png"
hs_loc.pictures.filenames[5] = MOD_NAME..base_path.."/05.png"
hs_loc.pictures.filenames[6] = MOD_NAME..base_path.."/06.png"
hs_loc.pictures.filenames[7] = MOD_NAME..base_path.."/07.png"
hs_loc.pictures.filenames[8] = MOD_NAME..base_path.."/08.png"
hs_loc.braking_force = 15

hs_loc.max_speed = 1.8
hs_loc.max_power = "400kW"
hs_loc.energy_source =
    {
      type = "burner",
      effectivity = 0.4,
      fuel_inventory_size = 5,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 320,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1,
        }
      }
    }



table.insert(new_trains, hs_loc)

-- electro locomotive
eloc = util.table.deepcopy(data.raw["locomotive"]["diesel-locomotive"])
eloc.name = "electro-locomotive"
eloc.minable["result"] = hs_loc.name
base_path = "/graphics/locomotive/blue"
eloc.icon                  = MOD_NAME..base_path.."/icon.png"
eloc.pictures.filenames[1] = MOD_NAME..base_path.."/01.png"
eloc.pictures.filenames[2] = MOD_NAME..base_path.."/02.png"
eloc.pictures.filenames[3] = MOD_NAME..base_path.."/03.png"
eloc.pictures.filenames[4] = MOD_NAME..base_path.."/04.png"
eloc.pictures.filenames[5] = MOD_NAME..base_path.."/05.png"
eloc.pictures.filenames[6] = MOD_NAME..base_path.."/06.png"
eloc.pictures.filenames[7] = MOD_NAME..base_path.."/07.png"
eloc.pictures.filenames[8] = MOD_NAME..base_path.."/08.png"
eloc.braking_force = 25

eloc.max_speed = 2.0
eloc.max_power = "600kW"
cargo_loc.air_resistance = 0.05
eloc.energy_source =
    {
      type = "burner",
      effectivity = 0.001,
      fuel_inventory_size = 0,
      smoke = {}
    }



table.insert(new_trains, hs_loc)

data:extend(new_trains)
