--[[
********************* IMPORTANT *****************************
Created By: Sensei Joshy#1060
Our Website: https://senseijoshy.com/
Our Business Email: info@senseijoshy.com
Our Discord: https://senseijoshy.com/discord
************************************************************
]]--

local plr = game.Players.LocalPlayer
for _, f in pairs(getgc()) do
   local ups = getupvalues(f)
   if #ups == 8 and ups[2] == plr then
       hookfunction(f, function(...) return math.random(0, 1) end)
   end;
end;

for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable();
end;

local SelectMob = {};
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if not table.find(SelectMob,v.Name) and not v:FindFirstChild("ClientHandler") then
        table.insert(SelectMob,v.name)
    end;
end;

local SelectQuest = {};
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if v:IsA("Model") then
            table.insert(SelectQuest,v.Dialogue["1"]["2"].Quest.Value)
        end;
    end);
end;

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

	local UI = Material.Load({
		Title = "Reaper 2 Script | SenseiJoshy.Com/Discord",
		Style = 1,
		SizeX = 350,
		SizeY = 250,
		Theme = "Dark"
	})

	-- // Main \\ --
	local main = UI.New({
		Title = "Auto-Farm"
	})

    main.Dropdown({
        Text = "Select Quest To Farm",
        Options = SelectQuest,
        Callback = function(v)
            getgenv().ChosenQuest = v
        end;
    })

    main.Dropdown({
        Text = "Select Mob To Farm",
        Options = SelectMob,
        Callback = function(v)
            getgenv().ChosenMob = v
        end;
    })

    main.Toggle({
        Text = "Auto Farm Mobs",
        Enabled = false,
        Callback = function(v)
            getgenv().Autofarm = v
    
            while getgenv().Autofarm and wait() do
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
                        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                            if v.Name == getgenv().ChosenMob and v.Humanoid.Health > 0 then
                                repeat wait() 
                                    local args = {[1] = {["inputType"] = Enum.UserInputType.MouseButton1,["keyCode"] = Enum.KeyCode.Unknown}}
                                    game:GetService("ReplicatedStorage").Remotes.Input:FireServer(unpack(args))
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,1,0)
                                until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                            end;
                        end;
                    end;
                end);
            end;
        end;
    })

    main.Toggle({
        Text = "Auto Get Quests",
        Enabled = false,
        Callback = function(v)
            getgenv().AutoQuest = v

            while getgenv().AutoQuest and wait() do
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                        if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("QuestsFrame2") then
                            if not game:GetService("Players").LocalPlayer.PlayerGui.HUD.QuestsFrame2:FindFirstChild(getgenv().ChosenMob) then wait(2)
                                game:GetService("ReplicatedStorage").Remotes.TakeQuest:FireServer(getgenv().ChosenMob)
                            end;
                        end;
                    end;
                end);
            end;
        end;
    })

    -- // Teleport
    local tele = UI.New({
        Title = "Teleport"
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
            getgenv().player = v
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
            getgenv().spec = v
            if getgenv().spec then
                game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(getgenv().player).Character.Humanoid
            else
                game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            end;
        end;
    })

    tele.Button({
        Text = "Teleport - Player",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(getgenv().player).Character.HumanoidRootPart.CFrame
        end;
    })

    -- // Misc
    local misc = UI.New({
        Title = "Misc"
    })

    misc.Toggle({
        Text = "Auto Auto Eat Corpse",
        Enabled = false,
        Callback = function(v)
            getgenv().AutoEat = v

            while getgenv().AutoEat and wait() do
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Food:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame - Vector3.new(0,-5,0)
                            fireproximityprompt(v.ProximityPrompt)
                        end;
                    end;
                end);
            end;
        end;
    })

    misc.Toggle({
        Text = "Auto Skill (R T Y)",
        Enabled = false,
        Callback = function(v)
            getgenv().AutoSkills = v

            while getgenv().AutoSkills do wait() 
                pcall(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.T, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.T, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Y, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Y, false, game)
                end);
            end;
        end;
    })

    misc.Button({
        Text = "Make Char Invisibile",
        Callback = function()
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint:Destroy()
            end);
        end;
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
			end
		end
	})
    
    local creators = {
        "Sensei Joshy#1060",
        "MrKix | TP BYPASSES",
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
        Text = "Reaper 2 Script.. Has Load Successfully."
    })
    