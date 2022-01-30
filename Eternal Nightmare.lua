game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AutoFarm or getgenv().SpecificFarm then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end;
        end;
    end;
end);

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))();

	local UI = Material.Load({
		Title = "Eternal Nightmare | SenseiJoshy.Com/Discord",
		Style = 1,
		SizeX = 380,
		SizeY = 250,
		Theme = "Dark"
	});

	-- // Main \\ --
	local main = UI.New({
		Title = "Auto-Farm"
	});

    local SelectWeapon = {};
    for i,v in pairs(game:GetService("ReplicatedStorage").ClientSidedActions:GetChildren()) do
        if string.find(v.Name, "Basic") then
            table.insert(SelectWeapon, v.Name)
        end;
    end;

    main.Dropdown({
        Text = "Select A Weapon",
        Options = SelectWeapon,
        Callback = function(v)
            getgenv().ChosenWeapon = v
        end;
    });

    main.Toggle({
        Text = "Auto Farm Mobs",
        Enabled = false,
        Callback = function(v)

            getgenv().AutoFarm = v

            while getgenv().AutoFarm and wait() do
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
                        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
                            if v.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(getgenv().ChosenWeapon,1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,getgenv().Distance,0)
                                until v.Humanoid.Health <= 0 or not getgenv().AutoFarm
                            end;
                        end;
                    end;
                end);
            end;
        end;
    });

    main.Slider({
        Text = "Mob Distances",
        Callback = function(v)
            getgenv().Distance = v
        end,
        Min = -20,
        Max = 20,
        Def = -5
    });

    -- // Main \\ --
	local main = UI.New({
		Title = "Specific-Farm"
	});

    local SelectWeapon = {};
    for i,v in pairs(game:GetService("ReplicatedStorage").ClientSidedActions:GetChildren()) do
        if string.find(v.Name, "Basic") then
            table.insert(SelectWeapon, v.Name)
        end;
    end;

    main.Dropdown({
        Text = "Select A Weapon",
        Options = SelectWeapon,
        Callback = function(v)
            getgenv().SpecificWeapon = v
        end;
    });

    local SelectMob = {};
    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
        if not table.find(SelectMob,v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and not v:FindFirstChild("LookDirection") then
            table.insert(SelectMob,v.name)
        end;
    end;

    main.Dropdown({
        Text = "Select A Mob",
        Options = SelectMob,
        Callback = function(v)
            getgenv().SpecificMob = v
        end;
    });

    main.Toggle({
        Text = "Auto Farm Mobs",
        Enabled = false,
        Callback = function(v)

            getgenv().SpecificFarm = v

            while getgenv().SpecificFarm and wait() do
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Entity:GetChildren()) do
                        if game.Players.LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and not v:FindFirstChild("LookDirection") then
                            if v.Name == getgenv().SpecificMob and v.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    game:GetService("ReplicatedStorage").Requests.UseSkill:FireServer(getgenv().SpecificWeapon,1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - Vector3.new(0,getgenv().SpecificDistance,0)
                                until v.Humanoid.Health <= 0 or not getgenv().SpecificFarm
                            end;
                        end;
                    end;
                end);
            end;
        end;
    });

    main.Slider({
        Text = "Mob Distances",
        Callback = function(v)
            getgenv().SpecificDistance = v
        end,
        Min = -20,
        Max = 20,
        Def = -5
    });

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

    -- // Misc \\ --
    local misc = UI.New({
        Title = "Misc"
    });

    misc.Toggle({
        Text = "Hide Name Nigga",
        Enabled = false,
        Callback = function(v)

            getgenv().HideName = v

            while getgenv().HideName and wait() do
                pcall(function()
                    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Overhead") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Overhead:Destroy()
                    end;
                end);
            end;
        end;
    });

    misc.Button({
        Text = "Chat Logger Nigga",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/ChatLogger.lua"))()
        end;
    })

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
			end;
		end;
	});
    
    local creators = {
        "Sensei Joshy#1060",
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
        Text = "Eternal Nightmare Script.. Has Load Successfully."
    });
