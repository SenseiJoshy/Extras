--[[
    You Can Put This In Your Auto-Execute Floder,Iit's What It Was Intended For.
    Dragon Ball Online Generations Dragon Ball W/ Server Hop
    Discord: https://discord.gg/phantomhub
    Made By: Sensei Joshy#1060
]]--
if game.PlaceId == 4638110048 or 4195906474 or 4195907096 then
    if (not game:IsLoaded()) then
        game.Loaded:Wait();
    end;
    function teleport()
        local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for i,v in pairs(Servers.data) do
            if v.playing ~= v.maxPlayers then
                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
            end
        end
    end
    if ServerHop then
        while wait(30) do
            local descendants = Workspace.Map:GetDescendants()
            for index, descendant in pairs(descendants) do
                if descendant.Name == "Collision" then
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(descendant.Position)
                    wait(2)
                    game:GetService("ReplicatedStorage").Events.Update:FireServer()
                end
            end
            syn.queue_on_teleport([[
                getgenv().ServerHop = true 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/DBOG%20Farm%20ServerHop.lua"))()
            ]])
            repeat wait()
                teleport()
            until not ServerHop
        end
    end
end
