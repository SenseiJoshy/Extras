local SelectTool = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then 
        table.insert(SelectTool, v.Name) 
    end;
end;

local SelectMob = {};
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if not table.find(SelectMob,v.Name) and v:FindFirstChild("Humanoid") then
        table.insert(SelectMob,v.name)
    end;
end;

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Autofarm then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end;
        end;
    end;
end);

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

	local UI = Material.Load({
		Title = "Simple Piece Script | SenseiJoshy.Com/Discord",
		Style = 1,
		SizeX = 360,
		SizeY = 260,
		Theme = "Dark"
	})

	-- // Main \\ --
	local main = UI.New({
		Title = "Auto-Farm"
	})

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
            if getgenv().Autofarm then 
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
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                            if v.Name == getgenv().ChosenMob and v.Humanoid.Health > 0 then
                                repeat wait() 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0, getgenv().Distance,0)
                                until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                            end;
                        end;
                    end;
                end);
            end;
        end;
    })

    main.Toggle({
        Text = "Kill Aura Niggas",
        Enabled = false,
        Callback = function(v)
            getgenv().Autofarm = v
    
            while getgenv().Autofarm and wait() do
                pcall(function()
                    local args = {
                        [1] = "meleeHitbox",
                        [3] = game:GetService("Players").LocalPlayer.Character.Combat,
                        [4] = 2
                    }
                    
                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args))
                end);
            end;
        end;
    })

    main.Slider({
        Text = "Distance From Mobs",
        Callback = function(v)
            getgenv().Distance = v
        end,
        Min = -20,
        Max = 20,
        Def = 0
    })

     -- // Player \\ --
	local plr = UI.New({
		Title = "Player Farm"
	})

    local tooldrop = plr.Dropdown({
        Text = "Select Weapson To Use",
        Options = SelectTool,
        Callback = function(v)
            getgenv().ChoosenTool = v
        end;
    })

    local SelectPlayer = {}
    for i,v in pairs(game.Players:GetPlayers()) do
        if v:IsA("Player") and not table.find(SelectPlayer, v.Name) then 
            table.insert(SelectPlayer, v.Name)
            table.sort(SelectPlayer)
        end;
    end;

    local plrdrop = plr.Dropdown({
        Text = "Select Player To Farm",
        Options = SelectPlayer,
        Callback = function(v)
            getgenv().ChoosenPlayer = v
        end;
    })

    game.Players.PlayerAdded:Connect(function(player)
        if player:IsA("Player") then 
            table.insert(SelectPlayer, player.Name)
            plrdrop:SetOptions(SelectPlayer)
        end;
    end);

    game.Players.PlayerRemoving:Connect(function(player)
        if player:IsA("Player") then 
            for i,v in pairs(SelectPlayer) do 
                if v == player.Name then 
                    table.remove(SelectPlayer, i)
                end;
            end;
        end;
        plrdrop:SetOptions(SelectPlayer)
    end); 

    plr.Toggle({
        Text = "Auto Farm Player",
        Enabled = false,
        Callback = function(v)
            getgenv().Autofarm = v
    
            while getgenv().Autofarm and wait() do
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                            if v.Name == getgenv().ChoosenPlayer and v.Humanoid.Health > 0 then
                                repeat wait() 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0, getgenv().PlayerDis,0)
                                until v.Humanoid.Health <= 0 or not getgenv().Autofarm
                            end;
                        end;
                    end;
                end);
            end;
        end;
    })

    plr.Slider({
        Text = "Distance From Player",
        Callback = function(v)
            getgenv().PlayerDis = v
        end,
        Min = -20,
        Max = 20,
        Def = 0
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

    misc.Dropdown({
        Text = "Select Stat To Upgrade",
        Options = SelectTool,
        Callback = function(v)
            getgenv().ChoosenStats = v
        end;
    })

    misc.Toggle({
        Text = "Auto Upgrade Stats",
        Enabled = false,
        Callback = function(v)
            getgenv().Upgrade = v
            while getgenv().Upgrade do wait()
                if getgenv().ChoosenStats == "Melee" then
                    local args = {
                        [1] = "addPoints",
                        [3] = "Melee"
                    }

                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args))
                elseif getgenv().ChoosenStats == "Sword" then
                    local args = {
                        [1] = "addPoints",
                        [3] = "Sword"
                    }
                    
                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args))
                elseif getgenv().ChoosenStats == "Defense" then
                    local args = {
                        [1] = "addPoints",
                        [3] = "Defense"
                    }
                    
                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args)) 
                elseif getgenv().ChoosenStats == "Stamina" then
                    local args = {
                        [1] = "addPoints",
                        [3] = "StamPts"
                    }
                    
                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args))
                elseif getgenv().ChoosenStats == "Devil Fruit" then
                    local args = {
                        [1] = "addPoints",
                        [3] = "DevilFruit"
                    }
                    
                    game:GetService("ReplicatedStorage").Handler:FireServer(unpack(args))
                end;
            end;
        end;
    })

    misc.Button({
        Text = "Make Char Invisibile",
        Callback = function()
            pcall(function()
                game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
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
        Text = "Simple Piece Script.. Has Load Successfully."
    })