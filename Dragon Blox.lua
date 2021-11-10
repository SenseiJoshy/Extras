--Anti AFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
	v:Disable()
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Dragon Blox | CastAways", 5013109572)

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
local section1 = page1:addSection("Farm")

section1:addToggle("Auto Farm",nil ,function(a)
    Enabled = a 
    while Enabled do wait()
        local A_1 = "Combat"
        local A_2 = true
        local A_3 =  CFrame.new(1, 5, 8)
        local A_4 = CFrame.new(1, 5, 8)
        local A_5 = CFrame.new(1, 5, 8)
        local Event = game:GetService("ReplicatedStorage").Remotes.SkillRemote
        Event:FireServer(A_1, A_2, A_3, A_4, A_5)
    end
end)

section1:addToggle("Farm Player", nil, function(p)
    pcall(function()
        game:GetService("RunService").Heartbeat:Connect(
            function()
                if player then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
          end)
end)

playerfarm = p
while playerfarm do wait()
pcall(function()
        for i, v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart")then
                 
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(v.Character.HumanoidRootPart.Position + Vector3.new(0, -5, 0),v.Character.HumanoidRootPart.Position)
                    local A_1 = "Combat"
                    local A_2 = true
                    local A_3 =  CFrame.new(1, 5, 8)
                    local A_4 = CFrame.new(1, 5, 8)
                    local A_5 = CFrame.new(1, 5, 8)
                    local Event = game:GetService("ReplicatedStorage").Remotes.SkillRemote
                    Event:FireServer(A_1, A_2, A_3, A_4, A_5)
                until v.Character.Humanoid.Health <= 0 or playerfarm == false 
            end
        end
    end)
end
end)

section1:addButton("Hide Name",function()
    game.Players.LocalPlayer.Character.Head:FindFirstChildWhichIsA("BillboardGui"):Destroy()
end)

local section2 = page1:addSection("Made By:")

section2:addButton("CastAways Discord Link",function()
setclipboard("https://discord.gg/7A4wSP9v5C")
end)
    
section2:addButton("Sensei Joshy#1060",function()
setclipboard("Sensei Joshy#1060")
end)

local section3 = page1:addSection("Misc")

section3:addKeybind("Hide GUI", N, function(keycall)
    if keycall then
        venyx:toggle()
    end
end)

section3:addButton("DeleteGui", function()
    game.CoreGui:FindFirstChild("Dragon Blox | CastAways"):Destroy()
end)

-- load
venyx:SelectPage(venyx.pages[1], true)