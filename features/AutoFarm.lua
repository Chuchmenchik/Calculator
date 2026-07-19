local AutoFarm = {}

-- Access global state and API
local State = getgenv().BF_Cheat
local GameAPI = _G.GameAPI or {}

-- We need to make sure GameAPI is loaded
-- But based on the specification, the loader will handle this
-- Let's assume GameAPI is available in getgenv or similar
-- Since the system is modular, we might need a a way to get the GameAPI
-- Let's use a global for now as we might need to actually inject it into the game
-- Let's assume GameAPI is GameAPI in the environment

function AutoFarm.Init()
    -- Initialize any necessary variables
    -- print("AutoFarm initialized")
end

function AutoFarm.Start()
    task.spawn(function()
        while State.Settings.AutoFarm do
            local target = GameAPI.GetNearestNPC(1000)
            if target then
                -- Teleport above the NPC (safe distance)
                local targetPos = target.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
                GameAPI.SetPosition(targetPos)
                
                -- Attack the NPC
                GameAPI.Attack()
            end
            task.wait(0.1)
        end
    end)
end

function AutoFarm.Stop()
    -- The loop is handled by the Settings.AutoFarm flag
end

return AutoFarm