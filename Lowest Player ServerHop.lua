getgenv().AutoTeleport = true
getgenv().DontTeleportTheSameNumber = true --If you set this true it won't teleport to the server if it has the same number of players as your current server
getgenv().CopytoClipboard = false

if not game:IsLoaded() then
    print("Game is loading waiting... | Amnesia Empty Server Finder")
    repeat
        wait()
    until game:IsLoaded()
    end

local maxplayers = math.huge
local serversmaxplayer;
local goodserver;
local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"

function serversearch()
    for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
        if type(v) == "table" and maxplayers > v.playing then
            serversmaxplayer = v.maxPlayers
            maxplayers = v.playing
            goodserver = v.id
        end
    end
    print("Currently checking the servers with max this number of players : " .. maxplayers .. " | Amnesia Empty Server Finder")
end

function getservers()
    serversearch()
    for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
        if i == "nextPageCursor" then
            if gamelink:find("&cursor=") then
                local a = gamelink:find("&cursor=")
                local b = gamelink:sub(a)
                gamelink = gamelink:gsub(b, "")
            end
            gamelink = gamelink .. "&cursor=" ..v
            getservers()
        end
    end
end

getservers()

    print("All of the servers are searched") 
	print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer .. " | Amnesia Empty Server Finder")
    if CopytoClipboard then
    setclipboard(goodserver)
    end
    if AutoTeleport then
        if DontTeleportTheSameNumber then 
            if #game:GetService("Players"):GetPlayers() - 1 == maxplayers then
                return warn("It has same number of players (except you)")
            elseif goodserver == game.JobId then
                return warn("Your current server is the most empty server atm") 
            end
        end
        print("AutoTeleport is enabled. Teleporting to : " .. goodserver)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
    end
