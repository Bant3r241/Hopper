local PlaceID = 109983668079237  -- Game ID
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)

-- If file not found, create it
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

-- Function to handle server hopping
function TPReturner()
    local Site
    if foundAnything == "" then
        -- Fetch server list from Roblox API
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        -- Fetch next set of servers with pagination
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end

    -- Update cursor for pagination
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end

    -- Iterate through servers and check if they meet conditions
    for _, v in pairs(Site.data) do
        local ID = tostring(v.id)
        local Possible = true

        -- Only consider servers that have space (maxPlayers > playing)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            -- Ensure this server hasn't been visited yet
            for _, Existing in pairs(AllIDs) do
                if ID == tostring(Existing) then
                    Possible = false
                    break
                end
            end

            -- If valid server, add to list and teleport
            if Possible then
                table.insert(AllIDs, ID)
                pcall(function()
                    -- Update the file with the new server ID
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait(1)

                    -- Teleport to the server
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)  -- Give some time before attempting another teleport
                break  -- Exit loop after teleporting to one valid server
            end
        end
    end
end

-- Main teleport loop
function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- Start the teleport loop
Teleport()
