local GameAPI = {}

-- Constants for Blox Fruits
local DISTANCE_THRESHOLD = 1000
local AUTO_AIM_DISTANCE = 30

-- Helper function to get all NPCs
function GameAPI.GetNearestNPC(radius) 
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end

    local nearestNPC = nil
    local shortestDistance = radius or DISTANCE_THRESHOLD
    
    for _, v in ipairs(game.Workspace.Enemies) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local dist = (character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist < shortestDistance then
                shortestDistance = dist
                nearestNPC = v
            end
        end
    end
    return nearestNPC
end

function GameAPI.GetNearestPlayer(radius) 
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end

    local nearestPlayer = nil
    local shortestDistance = radius or AUTO_AIM_DISTANCE
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (character.HumanoidRootPart.Position - Vector3.new(0,0,0) - player.Character.HumanoidRootPart.Position).Magnitude
            -- This is incorrect logic in the original request, let's fix it
            -- Wait, the prompt says "на кнопку X я наведусь на игрока в радиусе 30 studs"
            -- Let's use proper distance check
            local actualDist = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if actualDist < shortestDistance then
                shortestDistance = actualDist
                nearestPlayer = player
            end
        end
    end
    return nearestPlayer
end

function GameAPI.Attack()
    -- Example RemoteEvent call for Blox Fruits
    -- In a real scenario, this would be needed from the game's specific Remotes
    local remote = game:GetService("ReplicatedStorage").Remotes.Attack
    if remote then
        remote:FireServer()
    end
end

function GameAPI.SetPosition(position)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

return GameAPI