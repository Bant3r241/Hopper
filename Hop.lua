local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Function to execute the loadstring and server hop
local function executeAndHop()
    -- Execute the loadstring (this loads and runs the script from the given URL)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bant3r241/whatever/refs/heads/main/main.lua"))()

    -- Wait a little bit to ensure the loadstring has fully executed
    wait(2)

    -- Game ID for the game you're in
    local gameId = 109983668079237

    -- Teleport to another random server in the same game
    local success, errorMessage = pcall(function()
        -- Teleport to a random server in the same game using the TeleportService
        TeleportService:Teleport(gameId, Players.LocalPlayer)
    end)

    -- If there's an error, print the error message
    if not success then
        warn("Error teleporting: " .. errorMessage)
    end
end

-- Execute the function
executeAndHop()
