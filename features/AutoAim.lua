local AutoAim = {}

local State = getgenv().BF_Cheat
local GameAPI = _G.GameAPI or {}
local UserInputService = game:GetService("UserInputService")
local Camera = game.Workspace.CurrentCamera

function AutoAim.Init()
    -- Listen for the 'X' key press
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.X then
            if State.Settings.AutoAim then
                local targetPlayer = GameAPI.GetNearestPlayer(30)
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    -- "Aim" by pointing the camera at the target
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPlayer.Character.HumanoidRootPart.Position)
                end
            end
        end
    end)
end

function AutoAim.Start()
    -- Logic is event-driven via Init
end

function AutoAim.Stop()
    -- Logic is event-driven via Init
end

return AutoAim