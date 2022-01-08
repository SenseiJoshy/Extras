
   
    --AntiCheat
local gm = getrawmetatable(game)
setreadonly(gm, false)
local OldNameCall = gm.__namecall
local OldIndex = gm.__index
local oldspeed, oldjump = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed, game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
gm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if getnamecallmethod() == "Kick" and self == game.Players.LocalPlayer then print("Fuck no nigga")
    elseif args[1] == "kills" and getnamecallmethod() == "FindFirstChild" and godmodeenabled then return false
    else return OldNameCall(self, ...) end
end)
gm.__index = newcclosure(function(self, key)
    if key == "WalkSpeed" and self == game.Players.LocalPlayer.Character.Humanoid then
        return oldspeed;
    elseif key == "JumpPower" and self == game.Players.LocalPlayer.Character.Humanoid then
        return oldjump;
    else
        return OldIndex(self, key)
    end
end)
setreadonly(gm, true)
game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()


local infjumpenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Tower Of Hell";
	Duration = 5;
})

wait(5) 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local b = Library:Window("Credits")
local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Loaded!";
	Text = "Made by APollo#2391";
	Duration = 5;
})



--A

a:Button("Get all Items", function()
for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if e:IsA("Tool") then
e:Destroy()
end
end
wait() 
for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
if v:IsA("Tool") then
local CloneThings = v:Clone()
wait()
CloneThings.Parent = game.Players.LocalPlayer.Backpack

end
end

end)


a:Button("Gravity", function()
game:GetService("Workspace")[me].currentSection.Value = 6969
workspace.Gravity = 147.14999999999998
end)



a:Button("Invincibility", function()
local LocalPlayer = game:GetService("Players").LocalPlayer

local function Invincibility()
    if LocalPlayer.Character then
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v.Name == "hitbox" then
                v:Destroy()
            end
        end
    end
end

while wait(0.5) do
    Invincibility(LocalPlayer)
end
end)

a:Button("Teleport to End", function()
for i,v in pairs(game:GetService("Workspace").tower.sections.finish:GetChildren()) do
    if v.Name == "FinishGlow" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
end
end)

a:Button("Delete Kill Parts", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:FindFirstChild("kills") then 
		v:destroy()
	end
end
end)




a:Toggle("Time Freeze", function(value)
game:GetService("Players").LocalPlayer.PlayerScripts.timefreeze.Value = value
end)

a:Toggle("infinite Jump", function(value)
infjumpenabled = value
end)


--B

b:Button("Made By APollo#2391", function()
end)
