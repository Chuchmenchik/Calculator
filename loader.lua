"-- Blox Fruits Remote Loader
local ManifestUrl = \"https://raw.githubusercontent.com/YourUsername/YourRepo/main/manifest.lua\"

local function LoadModule(moduleData)
    local url = \"https://raw.githubusercontent.com/YourUsername/YourRepo/main/\" .. moduleData.path
    local success, result = pcall(function()
        local code = game:HttpGet(url)
        local module = loadstring(code)()
        return module
    end)

    if success and result then
        if result.Init then
            result.Init()
        end
        return result
    else
        warn(\"Failed to load module: \" .. moduleData.name .. \" | Error: \" .. tostring(result))
        return nil
    end
end

local function Main()
    -- Load Manifest
    local manifestSuccess, manifestCode = pcall(function()
        return game:HttpGet(ManifestUrl)
    end)

    if not manifestSuccess then
        warn(\"Could not load manifest.lua\")
        return
    end

    local manifest = loadstring(manifestCode)()
    _G.Modules = {}

    -- Sort modules by priority
    table.sort(manifest.Modules, function(a, b)
        return a.priority < b.priority
    end)

    for _, modData in ipairs(manifest.Modules) do
        if modData.enabled then
            local mod = LoadModule(modData)
            if mod then
                _G.Modules[modData.name] = mod
                -- If it's GameAPI, we put it in _G for other modules to use
                if modData.name == \"GameAPI\" then
                    _G.GameAPI = mod
                end
            end
        end
    end
end

Main()"