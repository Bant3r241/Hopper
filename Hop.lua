local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Function to server hop
local function serverHop()
    -- Game ID for the game you're in
    local gameId = 109983668079237  -- Replace this with your actual game ID if different

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

-- Call the server hop function
serverHop()
