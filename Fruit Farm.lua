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
    while wait(6) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.StartUp:InvokeServer()
        end)
        wait(2)
        for i, v in pairs(game.Workspace.Map.Trees:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Leaf") and v:FindFirstChild("MeshPart1") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Leaf.CFrame
                wait(.5)
                fireproximityprompt(v.Leaf.ProximityPromptDF)
                wait(0.1)
            end
        end
        wait(2)
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Leaf") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Leaf.CFrame
                wait(.5)
                fireproximityprompt(v.Leaf.ProximityPromptDF)
                wait(0.1)
            end
        end
        syn.queue_on_teleport([[
            getgenv().ServerHop = true 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Open-Source/main/Fruit%20Farm.lua"))()
        ]])
        repeat wait()
            teleport()
        until not ServerHop
    end
end
