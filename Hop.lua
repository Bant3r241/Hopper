local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Function to server hop
local function serverHop()
    -- Game ID for the game you're in
    local gameId = 109983668079237  -- Your game place ID

    -- Attempt to get a list of available servers (you would typically use a service to get this list)
    -- Since we don't have direct access to a list of servers, we'll assume teleporting works as expected.

    -- You would normally get a list of servers through an API or pre-defined instances.
    -- For now, we'll just teleport to the same game instance.

    local success, errorMessage = pcall(function()
        -- Teleport to a different instance of the same game using TeleportToPlaceInstance
        -- Use the current game ID and job ID to join another server
        TeleportService:TeleportToPlaceInstance(gameId, game.JobId, Players.LocalPlayer)
    end)

    -- If there's an error, print the error message
    if not success then
        warn("Error teleporting: " .. errorMessage)
    end
end

-- Call the server hop function
serverHop()
