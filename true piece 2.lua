for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if v:IsA("RemoteEvent") and v.Parent.Name == "ReplicatedStorage" then
        local OldNameCall = nil
        OldNameCall =
            hookmetamethod(
            game,
            "__namecall",
            function(...)
                local Args = {...}
                local Self = Args[1]
                if getnamecallmethod() == "FireServer" and tostring(Self) == v.Name then
                    return wait(math.huge)
                end
                return OldNameCall(...)
            end
        )
    end
end

SelectMob = {}
for i, v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") and not table.find(SelectMob, v.Name) then
        table.insert(SelectMob, v.Name)
        table.sort(SelectMob)
    end
end

pcall(function()
    local Clone = game.Players.LocalPlayer.Character.Animate:Clone()
    game.Players.LocalPlayer.Character.Animate:remove()
    Clone.Parent = game.Players.LocalPlayer.Character 
end)
    
getgenv().speed = 3000
    
getgenv().Distance = -2

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "True Piece Script | SenseiJoshy.Com/Discord",
    Style = 1,
    SizeX = 350,
    SizeY = 250,
    Theme = "Dark"
})

-- // Main \\ --
local main = UI.New({
    Title = "AutoFarm"
})

main.Dropdown({
    Text = "Select Mob To Farm",
    Options = SelectMob,
    Callback = function(v)
        getgenv().SelectMob = v
    end
})

main.Toggle({
    Text = "Auto Farm Mobs",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoFarm = v

        game:GetService('RunService').Stepped:connect(function()
            if getgenv().AutoFarm then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("MeshPart") then
                        pcall(function()
                            v.CanCollide = false
                        end)
                    end
                end
            end
        end)

        Clone = game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Clone()
        game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Destroy()
        Clone.Parent = game:GetService("Players").LocalPlayer.Character.LowerTorso

        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if getgenv().AutoFarm then
                pcall(function()
                    repeat
                        wait()
                    until game.Players.LocalPlayer.Character
                    wait(4)
                    Clone = game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Clone()
                    game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Destroy()
                    Clone.Parent = game:GetService("Players").LocalPlayer.Character.LowerTorso
                end)
            end
        end)
        while getgenv().AutoFarm do
            wait()
            pcall(function()
                game.Workspace.Gravity = 0
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Mobs[getgenv().SelectMob].HumanoidRootPart.CFrame * CFrame.new(0, -getgenv().Distance, 3)
                game:GetService("VirtualUser"):ClickButton1(Vector2.new(9e9, 9e9))
            end)
            if not getgenv().AutoFarm then
                game.Workspace.Gravity = 196.25
            end
        end
    end
})

main.Slider({
    Text = "Select AutoFarm Distance",
    Callback = function(v)
        getgenv().Distance = v
    end,
    Min = 0,
    Max = 10,
    Def = 5
})

main.Slider({
    Text = "Select Tween Speed",
    Callback = function(v)
        getgenv().speed = v
    end,
    Min = 0,
    Max = 20000,
    Def = 0
})

-- // Stats \\ --
local stat = UI.New({
    Title = "Auto Stats"
})

stat.Dropdown({
    Text = "Select A Stat",
    Options = {"PowerIncrease", "VitalityIncrease", "MeleeWeaponIncrease", "RangedWeaponIncrease", "EnergyIncrease"},
    Callback = function(v)
        getgenv().SelectStats = v
    end
})

stat.Toggle({
    Text = "Auto Upgrade Stats",
    Enabled = false,
    Callback = function(v)
        getgenv().AutoUpgrade = v 
        while getgenv().AutoUpgrade do wait()
            game:GetService("ReplicatedStorage").Remotes.SkillPoint:InvokeServer(getgenv().SelectStats,1)
        end
    end
})

stat.Dropdown({
    Text = "Select A Perk",
    Options = {"PerkSpin", "Perk2Spin"},
    Callback = function(v)
        getgenv().SelectPerk = v
    end
})

stat.Toggle({
    Text = "Auto Spin Perks",
    Enabled = false,
    Callback = function(v)
        getgenv().Spin = v 
        while getgenv().Spin do wait()
            game:GetService("ReplicatedStorage").Remotes.Spins:InvokeServer(getgenv().SelectPerk)
        end
    end
})

-- // Misc \\ --
local misc = UI.New({
    Title = "Misc"
})

misc.Toggle({
    Text = "Invisibility",
    Enabled = false,
    Callback = function(v)
        Invis = v
        Clone = game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Clone()
        game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Destroy()
        Clone.Parent = game:GetService("Players").LocalPlayer.Character.LowerTorso

        game.Players.LocalPlayer.CharacterAdded:Connect(
            function()
                if Invis then
                    pcall(
                        function()
                            wait(4)
                            Clone = game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Clone()
                            game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Destroy()
                            Clone.Parent = game:GetService("Players").LocalPlayer.Character.LowerTorso
                        end
                    )
                end
            end
        )
    end
})

local SwimBoi = nil
misc.Toggle({
    Text = "Anti Swim DMG",
    Enabled = false,
    Callback = function(v)
        SwimBoi = v
    end
})

local old 
    old = hookmetamethod(game, "__namecall", function(self,...)
    if getnamecallmethod() == "InvokeServer" and self.Name == "DFDamage" and SwimBoi then
        return 
    end
    return old(self, ...)
end)

misc.Toggle({
    Text = "Infinite Jump",
    Enabled = false,
    Callback = function(v)
        Geppo = v
        game:GetService("UserInputService").JumpRequest:connect(function()
            if Geppo then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end
})

misc.Button({
    Text = "Rejoin Server - Current Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

misc.Button({
    Text = "Server Hop - Different Server",
    Callback = function()
        local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false
            --[[
            local File = pcall(function()
                AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
            end)
            if not File then
                table.insert(AllIDs, actualHour)
                writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
            end
            ]]
            function TPReturner()
                local Site;
                if foundAnything == "" then
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                    foundAnything = Site.nextPageCursor
                end
                local num = 0;
                for i,v in pairs(Site.data) do
                    local Possible = true
                    ID = tostring(v.id)
                    if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        for _,Existing in pairs(AllIDs) do
                            if num ~= 0 then
                                if ID == tostring(Existing) then
                                    Possible = false
                                end
                            else
                                if tonumber(actualHour) ~= tonumber(Existing) then
                                    local delFile = pcall(function()
                                        -- delfile("NotSameServers.json")
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                    end)
                                end
                            end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(function()
                                -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                            end)
                            wait(4)
                        end
                    end
                end
            end

            function Teleport()
                while wait() do
                    pcall(function()
                        TPReturner()
                        if foundAnything ~= "" then
                            TPReturner()
                        end
                    end)
                end
            end

            Teleport()
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
                    args = {code = 'xgRwzdtnXC'}
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
    Text = "True Piece Script.. Has Load Successfully."
})