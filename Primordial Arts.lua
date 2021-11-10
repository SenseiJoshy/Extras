--Anti AFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
	v:Disable()
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Primordial Arts | CastAways", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

--Pages
local page1 = venyx:addPage("Auto Farm", 5012544693)
local page2 = venyx:addPage("Teleport", 5012544693)
local page3 = venyx:addPage("Misc", 5012544693)
local page4 = venyx:addPage("Credits", 5012544693)
local section1 = page1:addSection("Farm")

--Page 1

local Mobs_Table = {} 
         for i,v in pairs(game:GetService("Workspace").Humanoids:GetDescendants()) do 
         if v:IsA("Model") and v:FindFirstChild("Humanoid") and not table.find(Mobs_Table,v.Name) then 
         table.insert(Mobs_Table,v.Name)
         end 
    end 

section1:addDropdown("Choose Mobs",Mobs_Table,function(t)
Mobs = t     
end) 

  section1:addToggle("Auto Farm", nil,function(t)

    pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
        if Enabled then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

Enabled = t 
while Enabled do wait() 
    pcall(function()
    for i,v in pairs(game:GetService("Workspace").Humanoids:GetDescendants()) do 
if v.Name == Mobs and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then 
  repeat  
       wait() 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,Distance,0),v.HumanoidRootPart.Position)
until v.Enemy.Health <= 0 or Enabled == false 
end 
end 
end)
end 
end)

Distance = 6 

section1:addSlider("Mob Distance",0,-20,20,function(t)
Distance = t 
end)



getgenv().SkillOne = false
getgenv().SkillTwo = false
getgenv().SkillThree = false
getgenv().SKillFour = false

local section2 = page1:addSection("Auto Skill")

section2:addToggle("Auto First Skill", "First Skill", function(Onee)
    getgenv().SkillOne = Onee
end)

section2:addToggle("Auto Second Skill", "Second Skill", function(Twoo)
    getgenv().SkillTwo = Twoo
end)

section2:addToggle("Auto Three Skill", "Three Skill", function(Tree)
    getgenv().SkillThree = Tree
end)

section2:addToggle("Auto Fourth Skill", "Fourth Skill", function(For)
    getgenv().SKillFour = For
end)

section2:addToggle("Auto Fifth Skill", "Fifth Skill", function(Fift)
    getgenv().SKillFifth = Fift
end)


game:GetService("RunService").Stepped:Connect(function()
    if getgenv().SkillOne then
        pcall(function()
            keypress(0x31)
            wait(1)
            keyrelease(0x31)
        end)
    end
    if getgenv().SkillTwo then
        pcall(function()
            keypress(0x32)
            wait(1)
            keyrelease(0x32)
        end)
    end
    if getgenv().SkillThree then
        pcall(function()
            keypress(0x33)
            wait(1)
            keyrelease(0x33)
        end)
    end
    if getgenv().SKillFour then
        pcall(function()
            keypress(0x34)
            wait(1)
            keyrelease(0x34)
        end)
    end
    if getgenv().SKillFifth then
        pcall(function()
            keypress(0x35)
            wait(1)
            keyrelease(0x35)
        end)
    end
end)



--Page 2
local section1 = page2:addSection("Teleport")

section1:addButton("Mine exit", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3853.86377, 649.587646, 6967.16504, -0.982131004, 0, -0.18819882, 0, 1, 0, 0.18819882, 0, -0.982131004)
end)

section1:addButton("Mine Enterance", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3943.43, 588.672, 4462.95)
end)

section1:addButton("Desert Temple exit", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1039.48, 647.384, 276.775)
end)

section1:addButton("Desert Temple Enterance", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2682.34644, 593.840393, 2677.2002, -0.743395567, 0, -0.668852508, 0, 1, 0, 0.668852508, 0, -0.743395567)
end)

section1:addButton("King Of Winds Arena exit", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5336.68896, 716.401062, 1772.13696, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

section1:addButton("King Of Winds Arena Enterance", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4152.83594, 597.35907, 3407.85962, -0.473903656, 0, 0.88057673, 0, 1, 0, -0.88057673, 0, -0.473903656)
end)

section1:addButton("Ronin Arena exit", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71.4813, 586.604, 3974.52)
end)

section1:addButton("Ronin Arena Enterance", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2933.25635, 591.25531, 3776.60303, 0.0249899626, -0, -0.999687731, 0, 1, -0, 0.999687731, 0, 0.0249899626)
end)

--Page 3
local section1 = page3:addSection("Misc")

section1:addKeybind("Hide GUI", N, function(keycall)
    if keycall then
        venyx:toggle()
    end
end)

section1:addButton("DeleteGui", function()
    game.CoreGui:FindFirstChild("Primordial Arts | CastAways"):Destroy()
end)

--Page 4
local section1 = page4:addSection("Made By:")

section1:addButton("CastAways Discord Link",function()
setclipboard("https://discord.gg/7A4wSP9v5C")
end)
    
section1:addButton("Sensei Joshy#1060",function()
setclipboard("Sensei Joshy#1060")
end)

-- load
venyx:SelectPage(venyx.pages[1], true)