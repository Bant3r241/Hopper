-- Local Script (for client-side use, like a button press or key press)
local TeleportService = game:GetService("TeleportService")
local Player = game.Players.LocalPlayer

local placeId = 109983668079237  -- Your game's PlaceId (same game)

-- Function to teleport to a different server in the same game
local function teleportToAnotherServer()
    TeleportService:Teleport(placeId, Player)
end

-- Example: teleport when the player presses "T" (you can change the key or trigger this differently)
Player.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.T then
        teleportToAnotherServer()
    end
end)
