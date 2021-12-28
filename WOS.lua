--Anti-AFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

local SolarisLib = loadstring(game:HttpGet("https://solarishub.dev/SolarisLib.lua"))()

local win = SolarisLib:New({
    Name = "Stand Of Worlds Demo | Discord.gg/X-Ware",
    FolderToSave = "X-Ware"
})

SolarisLib:Notification("X-Ware", "X-Ware Was Executed Successfully.")

Table_Mob = {}
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if not table.find(Table_Mob, v.Name) and v:FindFirstChild("Humanoid") and not v:FindFirstChild("PlayerHeader") and not string.find(v.Name,"Dummy") then 
        table.insert(Table_Mob, v.Name)
    end
end

table.sort(Table_Mob)

local mobs = {}

local main = win:Tab("Main")
local m1 = main:Section("Auto Farm")
local m2 = main:Section("Auto Pickup")

local Skills = win:Tab("Skills")
local SkillsTab = Skills:Section("Other")

local Misc = win:Tab("Misc")
local MiscTab = Misc:Section("Character")
local MiscTab2 = Misc:Section("Others")

local Credits = win:Tab("Credits")
local Credit = Credits:Section("Credit Tab")

local player = game.Players.LocalPlayer

local shit = m1:Dropdown("Select A Mob",Table_Mob,"","Dropdown",function(a)
    mob = a
end)

m1:Toggle("Auto Farm", false,"AutoFarm", function(v)
Farmer = v 
while task.wait() do
if Farmer == false then return end
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == mob and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health ~= 0 then
repeat 
    task.wait()
    if Farmer == false then break end
    pcall(function()
player.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,0,-4.5),v.HumanoidRootPart.Position)
    end)
until v.Humanoid.Health <= 0 or not v or Farmer == false
end
end
end
end)

SkillsTab:Toggle("Auto E", false,"AutoFarm", function(v)
    E = v
while wait() do
if E == false then return end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
wait(5)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
end
end)
SkillsTab:Toggle("Auto R", false,"AutoFarm", function(v)
    R = v
while wait() do
if R == false then return end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)
end
end)

SkillsTab:Toggle("Auto G", false,"AutoFarm", function(v)
    G = v
while wait() do
if G == false then return end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.G, false, game)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.G, false, game)
end
end)

SkillsTab:Toggle("Auto X", false,"AutoFarm", function(v)
    X = v
while wait() do
if X == false then return end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.X, false, game)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.X, false, game)
end
end)

SkillsTab:Toggle("Auto V", false,"AutoFarm", function(t)
    V = t
while wait() do
if V == false then return end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.V, false, game)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.V, false, game)
end
end)
m2:Toggle("Auto Grab All", false,"AutoFarm", function(v)
Arrow = v 
while wait() do
if Arrow == false then return end
for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "StandArrow" or v.Name == "ShinyArrow" or v.Name == "LocacacaFruit" and v:FindFirstChild("Part") and v.Part:FindFirstChild("TouchInterest") then
        pcall(function()
        firetouchinterest(player.Character.Head,v.Part,0)
        firetouchinterest(player.Character.Head,v.Part,1)
        end)
    end
end
end
end)

MiscTab:Toggle("God Mode", false,"AutoFarm", function(v)
    God = v 
    while wait() do
        if God == false then return end
pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("PlayerHitBox") then
    game.Players.LocalPlayer.Character:FindFirstChild("PlayerHitBox"):Destroy()
end
end)
end
end)

Credit:Button("localplayer#0404",function()
setclipboard("localplayer#0404")
end)