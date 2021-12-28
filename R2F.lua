--Anti AFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

local SelectMobs = {}
for i,v in pairs(game:GetService("Workspace").Bots.AI:GetDescendants()) do
    if v:FindFirstChild("TouchInterest") then
        if not table.find(SelectMobs,v.Parent.Name) then
            table.insert(SelectMobs,v.Parent.Name)
        end
    end
end

local MiniQuestsTP = {}
for i,v in pairs(game:GetService("Workspace").Map.MiniQuests:GetDescendants()) do
    if v:IsA("Model") and not table.find(MiniQuestsTP, v.Name) then
        table.insert(MiniQuestsTP, v.Name)
    end
end

local Char = game.Players.LocalPlayer.Character

local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/UI-Librarys/main/SolarisLib.lua"))()

local win = SolarisLib:New({
    Name = "Right 2 Fight | Discord.gg/X-Ware",
    FolderToSave = "X-Ware"
})

SolarisLib:Notification("X-Ware", "Right 2 Fight Was Executed Successfully.")

local main = win:Tab("Main Farm")
local m1 = main:Section("Auto Farm")

m1:Dropdown("Select A Mob", SelectMobs,"","Dropdown", function(v)
    ChosenMob = v
end)

m1:Toggle("Auto Farm Mob", false,"Toggle", function(v)
    AutoFarm = v

    while AutoFarm do wait()
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Bots.AI:GetChildren()) do
                if v.Name == ChosenMob then
                    Char.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame wait(getgenv().AFWait)
                    firetouchinterest(Char.HumanoidRootPart, v.HumanoidRootPart.TouchInterest, 0)
                end
            end
        end)
    end
end)

m1:Toggle("Kill Aura Mobs", false,"Toggle", function(v)
    getgenv().KillAura = v
    
    game:GetService("RunService").Stepped:connect(function()
        pcall(function()
            if KillAura then
                for i,v in pairs(game:GetService("Workspace").Bots.AI:GetChildren()) do
                    local args = {
                        [1] = {
                            [1] = "damage",
                            [2] = v.UpperTorso,
                            [3] = Vector3.new(v.HumanoidRootPart.Position),
                            [4] = game:GetService("ReplicatedFirst").Moves.BTPunch1,
                            [5] = "Beast",
                            [6] = 0.67969219472527
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(args))
                end
            end
        end)
    end)
end)
m1:Button("Invisibility", function()
    Char.LowerTorso.Root:Destroy()
end)

m1:Button("Anti Ragdoll", function()
    Char:FindFirstChild("Ragdoller"):Destroy()
end)

m1:Slider("Auto Farm TP Wait Time", 0,50,5,2.5,"Slider", function(v)
    getgenv().AFWait = v
end)

local Tele = win:Tab("Teleport")
local tel1 = Tele:Section("Teleport | NPCs")

local tel2 = Tele:Section("Teleport | Player")

local plrs = {}
for i,v in pairs(game.Players:GetPlayers()) do
    if v:IsA("Player") then 
        table.insert(plrs, v.Name)
        table.sort(plrs)
    end
end

local plrdrop = tel2:Dropdown("Select Player", plrs, "", "Select Player", function(v)
    getgenv().chosenplr = v
end)

game.Players.PlayerAdded:Connect(function(plr)
    if plr:IsA("Player") then
        table.insert(plrs, plr.Name)
        plrdrop:Refresh(plrs, true)
    end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    if plr:IsA("Player") then
        for i,v in pairs(plrs) do 
            if v == plr.Name then 
                table.remove(plrs, i)
            end
        end
    end
    plrdrop:Refresh(plrs, true)
end)

tel2:Toggle("Spectate Player", nil, "Spectate", function(v)
    if v then
        game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(getgenv().chosenplr).Character.Humanoid
    else
        game.Workspace.Camera.CameraSubject = Char.Humanoid
    end
end)

tel2:Toggle("CRTL + Click = TP", nil ,"Toggle", function(v)
    getgenv().ctrltp = v
end)

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
Mouse.Button1Down:connect(function()
    if getgenv().ctrltp then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Mouse.Hit.p)
    end
end)

tel2:Button("Teleport To Player", function()
    Char.HumanoidRootPart.CFrame = game.Players:FindFirstChild(getgenv().chosenplr).Character.HumanoidRootPart.CFrame
end)

tel2:Button("TP Random To Player", function()
    local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]

    Char.HumanoidRootPart.CFrame =
        CFrame.new(
        Vector3.new(
            randomPlayer.Character.Head.Position.X,
            randomPlayer.Character.Head.Position.Y,
            randomPlayer.Character.Head.Position.Z
        )
    )
    Char.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(randomPlayer.Character.Head.Position.X, randomPlayer.Character.Head.Position.Y, randomPlayer.Character.Head.Position.Z))
end)

local cred = win:Tab("Credits")
local c1 = cred:Section("Made By:")

local creators = {
    "Sensei Joshy#1060"
}

c1:Button("Join Our Discord", function()
    local req = (syn and syn.request) or (http and http.request) or http_request
    if req then
        req({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = game:GetService('HttpService'):JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = game:GetService('HttpService'):GenerateGUID(false),
                args = {code = 'ySpUMF9D5e'}
            })
        })
    else
        setclipboard("https://discord.gg/ySpUMF9D5e")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "X-Ware Server Invite!",
            Text = "Copied An Invite To The Discord Server!",
            Icon = "rbxassetid://2541869220",
            Duration = 5,
        })
    end
end)

for i,v in pairs(creators) do 
    c1:Button(v, function()
        setclipboard(v)
    end)
end

tel1:Dropdown("Select Mini Quest Npc", MiniQuestsTP,"","Dropdown", function(v)
    Char.HumanoidRootPart.CFrame = game.Workspace.Map.MiniQuests[v].HumanoidRootPart.CFrame 
end)

local ShopTP = {
    "4-Store",
    "Fruit Stand",
    "Vending Mechine",
    "Coffee Shop",
    "Fisher Man",
    "O'Dea's"
}

tel1:Dropdown("Select Shop Npc", ShopTP,"","Dropdown", function(v)
    Char.HumanoidRootPart.CFrame = game.Workspace.Map.Shops[v].CFrame
end)
