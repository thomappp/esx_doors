Config = {

    Language = "fr",

    Control = {
        controlId = 38,
        controlName = "~INPUT_PICKUP~"
    },

    Doors = {
        {
            hash = "police_captain_door",
            model = "v_ilev_ph_gendoor002",
            coords = vector3(446.57, -980.01, 30.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_armory_door",
            model = "v_ilev_arm_secdoor",
            coords = vector3(453.07, -983.18, 30.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_locker_door",
            model = "v_ilev_ph_gendoor004",
            coords = vector3(450.1, -985.73, 30.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_helicopter_door",
            model = "v_ilev_gtdoor02",
            coords = vector3(464.36, -984.67, 43.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_ext01_door",
            model = "v_ilev_rc_door2",
            coords = vector3(467.37, -1014.45, 26.53),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_ext02_door",
            model = "v_ilev_rc_door2",
            coords = vector3(469.96, -1014.45, 26.53),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_int01_door",
            model = "v_ilev_ph_gendoor005",
            coords = vector3(446.007, -989.445, 30.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_int02_door",
            model = "v_ilev_ph_gendoor005",
            coords = vector3(443.407, -989.445, 30.83),
            locked = true,
            distance = 1.5,
            groups = { "police" }
        },

        {
            hash = "police_garage_door",
            model = "hei_prop_station_gate",
            coords = vector3(488.89, -1017.67, 27.14),
            locked = true,
            distance = 5.0,
            groups = { "police" }
        },

        {
            hash = "cardealer_ext01_door",
            model = "v_ilev_csr_door_l",
            coords = vector3(-39.13, -1108.21, 26.71),
            locked = true,
            distance = 1.5,
            groups = { "cardealer", "police" }
        },

        {
            hash = "cardealer_ext02_door",
            model = "v_ilev_csr_door_r",
            coords = vector3(-37.33, -1108.87, 26.71),
            locked = true,
            distance = 1.5,
            groups = { "cardealer", "police" }
        },

        {
            hash = "cardealer_ext03_door",
            model = "v_ilev_csr_door_l",
            coords = vector3(-59.89, -1092.95, 26.88),
            locked = true,
            distance = 1.5,
            groups = { "cardealer" }
        },

        {
            hash = "cardealer_ext04_door",
            model = "v_ilev_csr_door_r",
            coords = vector3(-60.54, -1094.74, 26.88),
            locked = true,
            distance = 1.5,
            groups = { "cardealer" }
        },

        {
            hash = "cardealer_int01_door",
            model = "v_ilev_fib_door1",
            coords = vector3(-33.809, -1107.57, 26.57),
            locked = true,
            distance = 1.5,
            groups = { "cardealer" }
        },

        {
            hash = "cardealer_int02_door",
            model = "v_ilev_fib_door1",
            coords = vector3(-31.72, -1101.84, 26.57),
            locked = true,
            distance = 1.5,
            groups = { "cardealer" }
        }
    },

    Locales = {
        ["fr"] = {
            ["press_to_unlock"] = "Appuyez sur %s pour déverrouiller.",
            ["press_to_lock"] = "Appuyez sur %s pour verrouiller."
        },

        ["en"] = {
            ["press_to_unlock"] = "Press %s to unlock the door.",
            ["press_to_lock"] = "Press %s to lock the door."
        },

        ["es"] = {
            ["press_to_unlock"] = "Pulse %s para desbloquear la puerta.",
            ["press_to_lock"] = "Pulse %s para bloquear la puerta."
        }
    },

    Translate = function(string)
        if string then
            local text = Config.Locales[Config.Language][string]
            return text or ("Unable to translate '%s'"):format(string)   
        else
            return "Unable to translate a nil string"
        end
    end
}