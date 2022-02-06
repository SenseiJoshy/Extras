--[[
Created By: @LeadMarker#1219 & @Sensei Joshy#1060
Joshy Discord: https://senseijoshy.com/Discord
Lead Discord: https://discord.gg/8Cj5abGrNv
]]--

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

-- // vars \\ -- 
local plr           = game:GetService("Players").LocalPlayer
local chr 			= plr.Character or plr.CharacterAdded:Wait()
local rootPart      = chr:WaitForChild("HumanoidRootPart")
local http          = game:GetService("HttpService")
local Settings      = {}

local UI = Material.Load({
     Title = "One Piece Burning Rage | SenseiJoshy.Com/Discord",
     Style = 1,
     SizeX = 350,
     SizeY = 250,
     Theme = "Dark"
})

local stat_levels = {
     "StrengthLevel",
     "DefenseLevel",
     "SwordLevel",
     "GunLevel",
 }
 
local quest_table = {}
for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("Part") and string.find(v.Name, "Quest") and v:FindFirstChild("ProximityPrompt") and v:FindFirstChild("QuestGiver") then 
        table.insert(quest_table, v.Name)
    end
end
table.sort(quest_table)
 
 local function upgrade(v)
     local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerValues
     local ohInstance2 = game:GetService("Players").LocalPlayer.PlayerValues.StrengthLevel
     local ohInstance3 = game:GetService("Players").LocalPlayer.PlayerValues.DefenseLevel
     local ohInstance4 = game:GetService("Players").LocalPlayer.PlayerValues.SwordLevel
     local ohInstance5 = game:GetService("Players").LocalPlayer.PlayerValues.GunLevel
     local ohInstance6 = game:GetService("Players").LocalPlayer.PlayerValues[v]
     local ohNumber7 = .5
     game:GetService("ReplicatedStorage").RemoteEvents.StatPoint:InvokeServer(ohInstance1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohInstance6, ohNumber7)
 end
 
local function attack()
     pcall(function()
         game:GetService("ReplicatedStorage").RemoteEvents.CombatBase:FireServer()
     end)
end

local SelectTool = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then 
        table.insert(SelectTool, v.Name) 
    end;
end;

local main = UI.New({Title = "Auto-Farm"})

local tooldrop = main.Dropdown({
     Text = "Select Weapson To Use",
     Options = SelectTool,
     Callback = function(v)
         getgenv().ChoosenTool = v
     end;
 })

 game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
     if tool:IsA("Tool") then
         table.insert(SelectTool, tool.Name)
         tooldrop:Refresh(SelectTool, true)
     end
 end)
 
 game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
     if tool:IsA("Tool") then
         for i,v in pairs(SelectTool) do 
             if v == tool.Name then 
                 table.remove(SelectTool, i)
             end
         end
     end
     tooldrop:Refresh(SelectTool, true)
 end)

 coroutine.wrap(function()
     while wait() do 
         if Settings.autofarm then 
             if game.Players.LocalPlayer.Character:FindFirstChild(getgenv().ChoosenTool) == nil then
                 for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                     if v:IsA("Tool") and v.Name == getgenv().ChoosenTool then
                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                     end
                 end
             end
         end
     end
 end)()

local mob_list = {
     ['AkainuQuest'] = 'Akainu',
     ['BanditQuest'] = 'Bandit',
     ['BuggyPirateQuest'] = 'Buggy Pirate',
     ['BuggyQuest'] = 'Buggy D. Clown',
     ['CrocodileQuest'] = 'Crocodile',
     ['DesertBanditQuest'] = 'Desert Bandit',
     ['MarineQuest'] = 'Corupt Marine',
     ['smokerQuest'] = 'Smoker',
     ['yetiQuest'] = 'Yeti'
 }

main.Dropdown({
     Text = "Select Quest To Farm",
     Options = quest_table,
     Callback = function(v)
          Settings["ChosenQuest"] = v 
     end
})

local function findQuest()
     for i,v in pairs(workspace:GetDescendants()) do
         if v.Name == Settings.ChosenQuest and v:IsA("Part") then 
             return v 
         end
     end
end

local function noclip()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide == true then
			v.CanCollide = false
		end
	end
end

main.Toggle({
     Text = "Auto Farm Mobs",
     Enabled = false,
     Callback = function(v)
         Settings["autofarm"] = v 
     end
})

spawn(function()
    while wait() do 
        if Settings.autofarm then
            pcall(function()
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestsGUI") == nil then 
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = findQuest().CFrame * CFrame.new(0,-5,0) * CFrame.Angles(math.rad(90),0,0)
                        fireproximityprompt(findQuest().ProximityPrompt)
                    until plr.PlayerGui:FindFirstChild("QuestsGUI") or not Settings.autofarm
                end

                if game:GetService("Players").LocalPlayer.PlayerValues.Quest.Value == 0 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestsGUI") then 
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = findQuest().CFrame * CFrame.new(0,-5,0) * CFrame.Angles(math.rad(90),0,0)
                        fireproximityprompt(findQuest().ProximityPrompt)
                    until game:GetService("Players").LocalPlayer.PlayerValues.Quest.Value == 1 or not Settings.autofarm
                end
                
                if plr.PlayerGui:FindFirstChild("QuestsGUI") then 
                    for i,v in pairs(game.Workspace.Map.Live:GetChildren()) do
                        if v.Humanoid.Health <= 0 and v.Name == mob_list[Settings.ChosenQuest] then
                            v:Destroy()
                        end

                        if v:IsA('Model') and v.Name == mob_list[Settings.ChosenQuest] and v.Humanoid.Health > 0 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestsGUI") then 
                            repeat wait()
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then 
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Combat"))
                                end
                                game.Players.LocalPlayer.Character:FindFirstChild("Combat"):Activate()
                                v.HumanoidRootPart.Size = Vector3.new(100,500,100)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Torso.CFrame * CFrame.new(0,200,0)
                            until not Settings.autofarm or v.Humanoid.Health <= 0 
                        end
                    end
                end
            end)
        end 
    end
end)

spawn(function()
    while task.wait() do 
        if Settings.autofarm then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        end
    end
end)

main.Toggle({
    Text = "Hide Name Bozos",
    Enabled = false,
    Callback = function(v)
        Settings["HideName"] = v 
    end
})

spawn(function()
    while wait() do 
        if Settings.HideName then
            pcall(function()
                for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
                    if v:IsA("BillboardGui") and v.Name == "Status" then 
                        v:FindFirstChild("Bounty"):Destroy()
                    end

                    if v:IsA("BillboardGui") and v.Name == "NameDisplay" then 
                        v:FindFirstChild("ImageLabel"):Destroy()
                    end
                end
            end)
        end
    end
end)

local tele = UI.New({Title = "Teleport"})

local npcs = {}
for i,v in pairs(game:GetService("Workspace").Map.NPCs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("Torso") and v.Torso:FindFirstChild("ProximityPrompt")then 
        table.insert(npcs, v.Name) 
    end
end

tele.Dropdown({
     Text = "Teleport To NPC",
     Options = npcs,
     Callback = function(v)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.NPCs:FindFirstChild(v).Torso.CFrame
     end;
})

local shops = {}
for i,v in pairs(game:GetService("Workspace").Map.Shops:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("RedBox") and v.RedBox:FindFirstChild("ProximityPrompt") then 
        table.insert(shops, v.Name) 
    end
end

tele.Dropdown({
     Text = "Teleport To Shop",
     Options = shops,
     Callback = function(v)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Shops:FindFirstChild(v):GetModelCFrame() 
     end;
})

local islands = {}
for i,v in pairs(game:GetService("Workspace").Map.SpawnPoints:GetChildren()) do
    table.insert(islands, v.Name)
end

tele.Dropdown({
     Text = "Teleport To Island",
     Options = islands,
     Callback = function(v)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints:FindFirstChild(v).CFrame
     end;
})

local plrs = {}
for i,v in pairs(game.Players:GetPlayers()) do
    if v:IsA("Player") and not table.find(plrs, v.Name) then 
        table.insert(plrs, v.Name)
        table.sort(plrs)
    end;
end;

local teledrop = tele.Dropdown({
    Text = "Select - Player",
    Options = plrs,
    Callback = function(v)
        Settings["Players"] = v
    end;
})

game.Players.PlayerAdded:Connect(function(player)
    if player:IsA("Player") then 
        table.insert(plrs, player.Name)
        teledrop:SetOptions(plrs)
    end;
end);

game.Players.PlayerRemoving:Connect(function(player)
    if player:IsA("Player") then 
        for i,v in pairs(plrs) do 
            if v == player.Name then 
                table.remove(plrs, i)
            end;
        end;
    end;
    teledrop:SetOptions(plrs)
end);

tele.Toggle({
    Text = "Specate - Player",
    Enabled = false,
    Callback = function(v)
        Settings["Spec"] = v
        if Settings.Spec then
            game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(Settings.Players).Character.Humanoid
        else
            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end;
    end;
})

tele.Button({
    Text = "Teleport - Player",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(Settings.Players).Character.HumanoidRootPart.CFrame
    end;
})



local misc = UI.New({
     Title = "Misc"
});

spawn(function()
     while wait() do 
         if Settings.InfStats then 
             for i,v in next, stat_levels do 
                 upgrade(v)
             end
         end
     end
end)

misc.Toggle({
     Text = "Chest Farm Bozo",
     Enabled = false,
     Callback = function(v)
         Settings["ChestFarm"] = v 
     end
})

spawn(function()
     while wait() do 
         if Settings.ChestFarm then
             pcall(function()
                 for i,v in pairs(game:GetService("Workspace").Map.Chests:GetChildren()) do
                     if v:IsA("Part") and v:FindFirstChild("TouchInterest") then 
                         firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0) 
                         firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1) 
                     end
                 end
             end)
         end
     end
end)

spawn(function()
    while wait() do 
        if Settings.ChestFarm then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Map.Chests:GetChildren()) do
                    if v:IsA("Part") and v:FindFirstChild("Taken").Value == false then
                        if Settings.ChestFarm then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            wait(.2)
                            fireproximityprompt(v:FindFirstChild("ProximityPrompt"))
                            wait(0.4)
                        end
                    end
                end
            end)
        end
    end
end)

misc.Toggle({
     Text = "Fruit/Tool Sniper Bozo",
     Enabled = false,
     Callback = function(v)
         Settings["ToolSniper"] = v 
     end
})

spawn(function()
     while wait() do 
         if Settings.ToolSniper then
             pcall(function()
                 for i,v in pairs(workspace:GetChildren()) do
                     if v:IsA("Tool") and v:FindFirstChildWhichIsA("BasePart") then 
                         v:FindFirstChildWhichIsA("BasePart").CanCollide = false
                         v:FindFirstChildWhichIsA("BasePart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                     end
                 end
             end)
         end
     end
end)

misc.Button({
     Text = "Rejoin Server - Current Server",
     Callback = function()
         game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
     end;
 });
 
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
     end;
 });

-- // Credits \\ --
local cred = UI.New({
     Title = "Credits"
 })
 
 cred.Button({
     Text = "Joshy Discord Server",
     Callback = function()
         if syn then
             syn.request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "xgRwzdtnXC"
                    },
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                }),
             })
         else 
                 setclipboard("https://discord.gg/xgRwzdtnXC")
                 game.StarterGui:SetCore("SendNotification", {
                 Title = "Please Read!!"; 
                 Text = "Discord Link Copied";
                 Duration = 35; 
             })
         end;
     end;
 });

 cred.Button({
    Text = "Lead Discord Server",
    Callback = function()
        if syn then
            syn.request({
               Url = "http://127.0.0.1:6463/rpc?v=1",
               Method = "POST",
               Headers = {
                   ["Content-Type"] = "application/json",
                   ["Origin"] = "https://discord.com"
               },
               Body = game:GetService("HttpService"):JSONEncode({
                   cmd = "INVITE_BROWSER",
                   args = {
                       code = "8Cj5abGrNv"
                   },
                   nonce = game:GetService("HttpService"):GenerateGUID(false)
               }),
            })
        else 
                setclipboard("https://discord.gg/8Cj5abGrNv")
                game.StarterGui:SetCore("SendNotification", {
                Title = "Please Read!!"; 
                Text = "Discord Link Copied";
                Duration = 35; 
            })
        end;
    end;
});
 
 local creators = {
     "Sensei Joshy#1060",
     "LeadMarker#1219",
 }
 
 for i,v in pairs(creators) do 
     cred.Button({
         Text = v,
         Callback = function()
             setclipboard(v) 
         end;
     });
 end;
 
 UI.Banner({
     Text = "One Piece Burning Rage Script.. Has Load Successfully."
});
