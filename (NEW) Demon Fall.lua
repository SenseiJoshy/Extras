--//Vars\\--
local plr = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

game:GetService("UserInputService").MouseIconEnabled = true

function toTarget(target)
    local speed = getgenv().speed
    local info = TweenInfo.new((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
    local _, broke = pcall(function()
        game:GetService("TweenService"):Create(plr.Character.HumanoidRootPart, info, {CFrame = target}):Play()
    end)
    if broke then error("Couldn't Tween Dumbass ", broke) end
end
function BigDick()
    local mt = getrawmetatable(game)
    local oldIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, i, v)
        if checkcaller() and self == plr.Character.HumanoidRootPart and i == 'CFrame' then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            return toTarget(v) 
        end
        return oldIndex(self, i, v)
    end)

    setreadonly(mt, true)
end
BigDick()


local function GetNearest()
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then
        return
    end;
    local TargetDistance = math.huge
    local Target
    for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Part") and v:FindFirstChild("Spawn") and v:FindFirstChild("Id")  then
            local mag = (HumanoidRootPart.Position - v.Part.Position).magnitude
            if mag < TargetDistance then
                TargetDistance = mag
                Target = v
            end;
        end;
    end;
    return Target
end;

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Trinket or getgenv().OreFarm then
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        end;
    end;
    end;
end);

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Demon Fall | SenseiJoshy.Com/Discord",
    Style = 1,
    SizeX = 350,
    SizeY = 250,
    Theme = "Dark"
})

-- // Main \\ --
local main = UI.New({
    Title = "Trinket"
})

getgenv().speed = 75

main.Toggle({
    Text = "Trinket Farm Sped",
    Enabled = false,
    Callback = function(v)
        getgenv().Trinket = v

        while getgenv().Trinket and wait() do
            if GetNearest() ~= nil then
                plr.Character.HumanoidRootPart.CFrame = GetNearest():FindFirstChild("Part").CFrame - Vector3.new(-3,-3,-3)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
            end;
        end;
    end
})

_G.Refresh = 2
_G.TrinketESP = false

local folder = Instance.new("Folder")
folder.Name = "espf"
local randomr = Random.new()
local workspacechild1 = game:GetService("Workspace"):GetChildren()
local randomparent1 = workspacechild1[randomr:NextInteger(1, #workspacechild1)]
folder.Parent = randomparent1
game:GetService("RunService").RenderStepped:Connect(function()
    --print('ok')
    local oldresult = ""

    local fs1 = ""
    local sl = ""
    local tl = ""
    local f1 = ""
    for i= 1, 4 do

        local random = math.random(1,10)

        local rannumber = string.char(math.random(string.byte('A'), string.byte('Z')))
        --print(rannumber)
        local loworbig = math.random(1,2)

        if loworbig == 1 then
            string.lower(rannumber)
        else
            string.upper(rannumber)
        end

        if i == 1 then
            fs1 = rannumber
        elseif i == 2 then
            sl = rannumber
        elseif i == 3 then
            tl = rannumber
        else
            f1 = rannumber
        end
        --print(oldresult)

    end
    --print(fs1)
    local reee = tostring(fs1..sl..tl..f1)
    folder.Name = "okfornow" --tostring(reee)
    --print(tostring(reee))

    local randomr = Random.new()

    local workspacechild = game:GetService("Workspace"):GetChildren()
    --local anotherrandom = math.random(1,40)
    local randomparent = workspacechild[randomr:NextInteger(1, #workspacechild)]

    --print(folder.Parent)

    wait(2)
end)

local num = 1

function addUiCorner(prnt)
    local UICorner = Instance.new("UICorner",prnt)
    UICorner.CornerRadius = UDim.new(0,6)
end


coroutine.resume(coroutine.create(function()
    while wait() do
        if _G.TrinketESP == true then
            print("true")
            for i, v in pairs(folder:GetChildren()) do
                if v:IsA("BillboardGui") then
                    v:Destroy()
                end
            end
            print("removed")
            for i, v in pairs(workspace.Trinkets:GetChildren()) do
                print("E")
                num = num + 1

                
                    --print("Is a model")
                if v.Name == "Spawn" or v.Name == "RareSpawn" or v.Name == "EpicSpawn" and v:IsA("Part") then
                    if v:FindFirstChild("Spawned") then
                        print("Found spawnedd")
                        
                        --print("Foundspawn")
                        
                    -- print("Found spawn")
                    
                    -- print("yes")
    
                    
                        
                        local BillboardGui = Instance.new("BillboardGui",folder)
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.Size = UDim2.new(3,0,2,0)
                        BillboardGui.SizeOffset = Vector2.new(0,2)
                        BillboardGui.Adornee = v
                        BillboardGui.Name = "Frame"..num
        
                        print("ree")
                        local Frame = Instance.new("Frame",BillboardGui)
                        Frame.Name = "Frame"
                        Frame.BackgroundTransparency = 1
                        Frame.Size = UDim2.new(1,0,1,0)
                        Frame.BorderSizePixel = 0
        
                        
                        
                        
        
                        local TextLabel = Instance.new("TextLabel",BillboardGui)
                        TextLabel.Name = "Frame"
                        
                        TextLabel.Size = UDim2.new(1,0,1,0)
                        TextLabel.TextScaled = true
                        TextLabel.Text = v.Name
                        TextLabel.Font = Enum.Font.SourceSansBold

                        if v.Name == "Spawn" then
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
                        elseif v.Name == "RareSpawn" then
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255,0,0)
                        else
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255,196,0)
                        end

                        addUiCorner(TextLabel)
                        
                        spawn(function()
                            while wait() do
                                if v:FindFirstChild("Spawned") then
    
                                else
                                    local ts = game:GetService("TweenService"):Create(TextLabel,TweenInfo.new(1),{Transparency = 1})
                                    ts:Play()
                                    wait(1)
                                    BillboardGui:Destroy()
                                    break
                                end
                            end
                    end)
                        
                    end
                        
    
                    
                end
                
            end
            wait(2)
        else
            --print("false")
            for i, v in pairs(folder:GetChildren()) do
                if v:IsA("BillboardGui") then
                    v:Destroy()
                end
            end
    
        end
    end
end))

main.Toggle({
    Text = "Trinket ESP Sped",
    Enabled = false,
    Callback = function(v)
        _G.TrinketESP = v
    end
})

main.Button({
    Text = "Teleport To Seller",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(827.004761, 757.951782, -2248.31909)
    end
})

-- // Main2 \\ --
local main2 = UI.New({
    Title = "Ore Farm"
})

main2.Toggle({
    Text = "Ore Farm Sped",
    Enabled = false,
    Callback = function(v)
        getgenv().OreFarm = v

        while getgenv().OreFarm and wait() do
        pcall(function()
            for i, v in ipairs(game:GetService("Workspace").Map.Minerals:GetChildren()) do
                if v:IsA("MeshPart") then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Mineral.CFrame - Vector3.new(0,0,0)
                    end;
                end;
            end);
        end;
    end
})

main2.Toggle({
    Text = "Auto Pick Sped",
    Enabled = false,
    Callback = function(v)
        getgenv().UsePick = v

        while getgenv().UsePick and wait(1) do
            game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Pickaxe","Server")
        end;
    end
})

main2.Button({
    Text = "Teleport To Seller",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(398.572083, 755.152771, -2378.90942)
    end
})

-- // Misc \\ --
local misc = UI.New({
    Title = "Misc"
})


misc.Toggle({
    Text = "Hide Name & Rank Sped",
    Enabled = false,
    Callback = function(v)
        getgenv().HideName = v

        while true do
            if HideName == false then return end
            pcall(function()
                local player = game.Players.LocalPlayer
                    for i,v in pairs(player.Character:GetChildren()) do
                        if v.ClassName == "Accessory" or v.Name == "Belt" or v.Name == "Shirt" or v.Name == "Pants" or v.Name == "Hair" and player.Character:FindFirstChild("Humanoid") then
                            v:Destroy()
                            game.Players.LocalPlayer.Character.Head.TrueName:Destroy()
                            game.Players.LocalPlayer.Character.Head.Rank:Destroy()
                            local player = game.Players.LocalPlayer
                            for i,v in pairs(player.Character.Head:GetChildren()) do
                                if v:IsA("Decal") then
                                    v:remove()
                                end
                        end
                        end
                    end
                end) 
            wait()
        end
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
    Text = "Demon Fall Script.. Has Load Successfully."
})