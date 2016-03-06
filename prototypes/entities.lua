require("prototypes.config")

new_trains = {}

-- Cargo Locomotive
cargo_loc = util.table.deepcopy(data.raw["locomotive"]["diesel-locomotive"])
cargo_loc.name = "cargo-locomotive"
cargo_loc.minable["result"] = cargo_loc.name
cargo_loc.icon                  = MOD_NAME.."/graphics/locomotive/orange/icon.png"
cargo_loc.pictures.filenames[1] = MOD_NAME.."/graphics/locomotive/orange/01.png"
cargo_loc.pictures.filenames[2] = MOD_NAME.."/graphics/locomotive/orange/02.png"
cargo_loc.pictures.filenames[3] = MOD_NAME.."/graphics/locomotive/orange/03.png"
cargo_loc.pictures.filenames[4] = MOD_NAME.."/graphics/locomotive/orange/04.png"
cargo_loc.pictures.filenames[5] = MOD_NAME.."/graphics/locomotive/orange/05.png"
cargo_loc.pictures.filenames[6] = MOD_NAME.."/graphics/locomotive/orange/06.png"
cargo_loc.pictures.filenames[7] = MOD_NAME.."/graphics/locomotive/orange/07.png"
cargo_loc.pictures.filenames[8] = MOD_NAME.."/graphics/locomotive/orange/08.png"

cargo_loc.max_speed = 0.3
cargo_loc.max_power = "400kW"
cargo_loc.braking_force = 20
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
data:extend(new_trains)

farl =  {
    {
      type = "locomotive",
      name = "farl",
      icon = "__FARL__/graphics/icons/farl.png",
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
      minable = {mining_time = 1, result = "farl"},
      max_health = 1000,
      corpse = "medium-remnants",
      dying_explosion = "huge-explosion",
      collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
      selection_box = {{-0.85, -2.6}, {0.9, 2.5}},
      drawing_box = {{-1, -4}, {1, 3}},
      weight = 2000,
      max_speed = 0.8,
      max_power = "600kW",
      braking_force = 10,
      friction_force = 0.0015,
      -- this is a percentage of current speed that will be subtracted
      air_resistance = 0.002,
      connection_distance = 3.3,
      joint_distance = 4.6,
      energy_per_hit_point = 5,
      resistances =
      {
        {
          type = "fire",
          decrease = 15,
          percent = 50
        },
        {
          type = "physical",
          decrease = 15,
          percent = 30
        },
        {
          type = "impact",
          decrease = 50,
          percent = 60
        },
        {
          type = "explosion",
          decrease = 15,
          percent = 30
        },
        {
          type = "acid",
          decrease = 10,
          percent = 20
        }
      },
      energy_source =
      {
        type = "burner",
        effectivity = 1,
        fuel_inventory_size = 3,
        smoke =
        {
          {
            name = "smoke",
            deviation = {0.1, 0.1},
            frequency = 210,
            position = {0, 0},
            slow_down_factor = 3,
            starting_frame = 1,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5,
            height = 2,
            height_deviation = 0.2,
            starting_vertical_speed = 0.2,
            starting_vertical_speed_deviation = 0.06,
          }
        }
      },
      front_light =
      {
        {
          type = "oriented",
          minimum_darkness = 0.3,
          picture =
          {
            filename = "__core__/graphics/light-cone.png",
            priority = "medium",
            scale = 2,
            width = 200,
            height = 200
          },
          shift = {-0.6, -16},
          size = 2,
          intensity = 0.6
        },
        {
          type = "oriented",
          minimum_darkness = 0.3,
          picture =
          {
            filename = "__core__/graphics/light-cone.png",
            priority = "medium",
            scale = 2,
            width = 200,
            height = 200
          },
          shift = {0.6, -16},
          size = 2,
          intensity = 0.6
        }
      },
      back_light = farlBacklight,
      stand_by_light = rolling_stock_stand_by_light(),
      pictures =
      {
        priority = "very-low",
        width = 346,
        height = 248,
        axially_symmetrical = false,
        direction_count = 256,
        filenames =
        {
          "__FARL__/graphics/entity/farl/farl-01.png",
          "__FARL__/graphics/entity/farl/farl-02.png",
          "__FARL__/graphics/entity/farl/farl-03.png",
          "__FARL__/graphics/entity/farl/farl-04.png",
          "__FARL__/graphics/entity/farl/farl-05.png",
          "__FARL__/graphics/entity/farl/farl-06.png",
          "__FARL__/graphics/entity/farl/farl-07.png",
          "__FARL__/graphics/entity/farl/farl-08.png"
        },
        line_length = 4,
        lines_per_file = 8,
        shift = {0.9, -0.45}
      },
      rail_category = "regular",

      stop_trigger =
      {
        -- left side
        {
          type = "create-smoke",
          repeat_count = 125,
          entity_name = "smoke-train-stop",
          initial_height = 0,
          -- smoke goes to the left
          speed = {-0.03, 0},
          speed_multiplier = 0.75,
          speed_multiplier_deviation = 1.1,
          offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
        },
        -- right side
        {
          type = "create-smoke",
          repeat_count = 125,
          entity_name = "smoke-train-stop",
          initial_height = 0,
          -- smoke goes to the right
          speed = {0.03, 0},
          speed_multiplier = 0.75,
          speed_multiplier_deviation = 1.1,
          offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
        },
        {
          type = "play-sound",
          sound =
          {
            {
              filename = "__base__/sound/train-breaks.ogg",
              volume = 0.6
            },
          }
        },
      },
      drive_over_tie_trigger = drive_over_tie(),
      tie_distance = 50,
      crash_trigger = crash_trigger(),
      working_sound =
      {
        sound =
        {
          filename = "__base__/sound/train-engine.ogg",
          volume = 0.4
        },
        match_speed_to_activity = true,
      },
      open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
      close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
      sound_minimum_speed = 0.5
    },
--    {
--      type = "rail",
--      name = "straight-rail2",
--      icon = "__FARL__/graphics/icons/straight-rail.png",
--      flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
--      minable = {mining_time = 1, result = "straight-rail2"},
--      max_health = 100,
--      corpse = "straight-rail-remnants",
--      bending_type = "straight",
--      rail_category = "regular",
--      pictures = railpictures()
--    },
--    {
--      type = "rail",
--      name = "curved-rail2",
--      icon = "__base__/graphics/icons/curved-rail.png",
--      flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
--      minable = {mining_time = 1, result = "curved-rail2"},
--      max_health = 200,
--      corpse = "curved-rail-remnants",
--      secondary_collision_box = {{0,0}, {0, 0}},
--      selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
--      bending_type = "turn",
--      rail_category = "regular",
--      pictures = railpictures()
--    },
--    {type = "item",
--      name = "straight-rail2",
--      icon = "__base__/graphics/icons/straight-rail.png",
--      flags = {"goes-to-quickbar"},
--      subgroup = "transport",
--      order = "a[train-system]-a[straight-rail]",
--      place_result = "straight-rail2",
--      stack_size = 50
--    },
--    {
--      type = "item",
--      name = "curved-rail2",
--      icon = "__base__/graphics/icons/curved-rail.png",
--      flags = {"goes-to-quickbar"},
--      subgroup = "transport",
--      order = "a[train-system]-b[curved-rail]",
--      place_result = "curved-rail2",
--      stack_size = 50
--    },
  }