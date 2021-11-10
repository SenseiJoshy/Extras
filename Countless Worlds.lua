for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

local SolarisLib = loadstring(game:HttpGet("https://solarishub.dev/SolarisLib.lua"))()

local win = SolarisLib:New({
    Name = "〈👻〉Phantom Hub | Discord.gg/phantomhub",
    FolderToSave = "〈👻〉Phantom Hub"
})

SolarisLib:Notification("〈👻〉Phantom Hub", "〈👻〉Phantom Hub Was Executed Successfully.")

local main = win:Tab("Main Farm") 
local m1 = main:Section("Auto - Farms")

m1:Toggle("Auto Bounce HitBox", false, "Auto - HitBox", function(v)
    getgenv().AutoFarm = v 
    while AutoFarm do wait()
        pcall(function()
            for i,v in pairs(game.Workspace.OrbFolder:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("HitBox") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HitBox.CFrame
                    wait(1)
                end
            end
        end)
    end
end)

m1:Toggle("Auto Collect Drops", false, "Auto - Farm", function(v)
    getgenv().Collect = v 
    while Collect do wait()
        pcall(function()
            for i,v in pairs(game.Workspace.Dropped:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Orb") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Orb.CFrame
                end
            end
        end)
    end
end)

m1:Toggle("Auto Chest Farm", false, "Auto - Farm", function(v)
    getgenv().ChestFarm = v 
    while ChestFarm do wait()
        pcall(function()
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Root") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
                    wait(1.5)
                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                    wait(2)
                end
            end
        end)
    end
end)


m1:Button("God Mode By Ezpi ", function()
    --// Exploit Check \\--
    if #{hookmetamethod, getnamecallmethod} ~= 2 then
        while true do
        end
    end
    
    --// Remote Hook \\--
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
        if not checkcaller() and getnamecallmethod() == "FireServer" and Self.Name == "HitDetection" then
            return
        end
        return OldNameCall(Self, ...)
    end)
end)

local cred = win:Tab("Credits")
local c1 = cred:Section("Made By:")

c1:Button("Join Discord", function()
    setclipboard("https://discord.com/phantomHub")
end)

c1:Button("Sensei Joshy#1060", function()
    setclipboard("Sensei Joshy#1060")
end)
