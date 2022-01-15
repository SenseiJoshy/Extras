local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "Critical Legends | SenseiJoshy.Com/Discord",
     Style = 1,
     SizeX = 350,
     SizeY = 250,
     Theme = "Dark"
})

-- // Main \\ --
local main = UI.New({
    Title = "Main"
})

main.Toggle({
    Text = "God Mode Nigga",
    Enabled = false,
    Callback = function(v)
        getgenv().GodMode = v
        
        local god 
        god = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            
            if method == "FireServer" and tostring(self) == "Damage" and args[1] == game.Players.LocalPlayer.Character and getgenv().GodMode then 
                return nil 
            end
        
            return god(self, ...)
        end)
    end
})

main.Toggle({
    Text = "Auto Farm HitBox",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoHitBox = v
        
        spawn(function()
            while wait() do 
                if AutoHitBox then 
                    pcall(function()
                        for i,v in pairs(workspace.CombatFolder:GetChildren()) do
                            if v:IsA("Folder") and v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("SwordOrb") then 
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.SwordOrb.Base.CFrame
                            end
                        end
                    end)
                end
            end
        end)
    end
})

main.Toggle({
    Text = "Auto Collect Chests",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoChests = v
        
        spawn(function()
            while wait() do
                if getgenv().AutoChests then 
                    pcall(function()
                        for i,v in pairs(workspace.Chests:GetChildren()) do
                            if v:IsA("Model") and not v:FindFirstChild("Open") then 
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Giver, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Giver, 1)
                            end
                        end
                    end)
                end
            end
        end)
    end
})

-- // Material \\ --
local Mat = UI.New({
    Title = "Materials"
})

Mat.Toggle({
    Text = "Auto Collect Apples",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoApples = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoApples then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Healthy Apple"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

Mat.Toggle({
    Text = "Auto Collect Orange",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoOrange = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoOrange then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Protection Orange"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

Mat.Toggle({
    Text = "Auto Collect Cherry",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoCherry = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoCherry then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Sky Cherry"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

Mat.Toggle({
    Text = "Auto Collect Sky Fruit",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoSkyFruit = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoSkyFruit then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Fruit of the Sky"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

Mat.Toggle({
    Text = "Auto Collect Rocky",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoRocky = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoRocky then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Rocky Fruit"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

Mat.Toggle({
    Text = "Auto Collect Mana Weed",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoManaWeed = v
        
        game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AutoManaWeed then
                    for _,v in pairs(game:GetService("Workspace").MaterialGivers["Mana Weed"]:GetChildren()) do
                        if v.ClassName == "Model" then
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                            wait()
                            firetouchinterest(v.Giver, game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        end
                    end
                end
            end)
        end)
    end
})

-- // Teleport \\ --
local tele = UI.New({
    Title = "Teleport"
})

local SelectedWorld = {}
for i,v in pairs(workspace.WorldMap:GetChildren()) do
    if v:IsA("Model") and not table.find(SelectedWorld, v.Name) then 
        table.insert(SelectedWorld, v.Name)
    end
end

tele.Dropdown({
    Text = "Teleport To World",
    Options = SelectedWorld,
    Callback = function(v)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap[v]:GetModelCFrame()
    end
})

local plrs = {}
for i,v in pairs(game.Players:GetPlayers()) do
    if v:IsA("Player") and not table.find(plrs, v.Name) then 
        table.insert(plrs, v.Name)
        table.sort(plrs)
    end
end

local teledrop = tele.Dropdown({
    Text = "Select - Player",
    Options = plrs,
    Callback = function(v)
       getgenv().player = v
    end
})

game.Players.PlayerAdded:Connect(function(player)
    if player:IsA("Player") then 
        table.insert(plrs, player.Name)
        teledrop:SetOptions(plrs)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if player:IsA("Player") then 
        for i,v in pairs(plrs) do 
            if v == player.Name then 
                table.remove(plrs, i)
            end
        end
    end
    teledrop:SetOptions(plrs)
end)

tele.Toggle({
    Text = "Specate - Player",
    Enabled = false,
    Callback = function(v)
        getgenv().spec = v
        if getgenv().spec then
            game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(getgenv().player).Character.Humanoid
        else
            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end
    end
})

tele.Button({
    Text = "Teleport - Player",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(getgenv().player).Character.HumanoidRootPart.CFrame
    end
})

-- // Credits \\ --
local cred = UI.New({
    Title = "Credits"
})

cred.Button({
    Text = "Discord Server",
    Callback = function()
        local req = (syn and syn.request) or (http and http.request) or http_request
        if req then
            req({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = http:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = http:GenerateGUID(false),
                    args = {code = '3uA7gBMvAd'}
                })
            })
        end
    end
})

local creators = {
    "Sensei Joshy#1060",
}

for i,v in pairs(creators) do 
    cred.Button({
        Text = v,
        Callback = function()
            setclipboard(v) 
        end
    }) 
end

UI.Banner({
    Text = "Critical Legends Script.. Had Load Successfully."
})
