local State = {
    Settings = {
        AutoFarm = false,
        AutoAim = false,
    },
    Status = {
        CurrentTarget = nil,
        IsRunning = false,
    }
}

-- Use getgenv to ensure state is accessible across modules
getgenv().BF_Cheat = State

return State