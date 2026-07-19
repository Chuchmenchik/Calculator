return {
    Modules = {
        { name = "State", path = "core/State.lua", priority = 1, enabled = true },
        { name = "EventBus", path = "core/EventBus.lua", priority = 2, enabled = true },
        { name = "GameAPI", path = "api/GameAPI.lua", priority = 3, enabled = true },
        { name = "Interface", path = "ui/Interface.lua", priority = 4, enabled = true },
        { name = "AutoFarm", path = "features/AutoFarm.lua", priority = 5, enabled = true },
        { name = "AutoAim", path = "features/AutoAim.lua", priority = 6, enabled = true },
    }
}
