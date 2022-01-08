local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Prison Life";
	Duration = 5;
})

wait(5)

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local Gun = Library:Window("Gun Mods")
local Teams = Library:Window("Teams")
local Combat = Library:Window("Combat")
local TP = Library:Window("Teleports")
local Aim = Library:Window("AimBot")
local ESP = Library:Window("ESP")
local b = Library:Window("Credits")

local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Loaded!";
	Text = "Made by APollo#2391";
	Duration = 5;
})



local MarketPlaceService = game:GetService("MarketplaceService")

function checkgamepass(userid, gamepassid)
    local xy = MarketPlaceService:UserOwnsGamePassAsync(userid,gamepassid)
    return xy
end

--A

a:Button("Give All Guns", function()
	if checkgamepass(game.Players.LocalPlayer.UserId,96651) then

		local Weapon = {"M4A1"}
		for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
		    if v.Name == Weapon[1] then
		        local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		    end
		end
	end
	local Weapon = {"AK-47"}
	for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
	    if v.Name == Weapon[1] then
	        local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
	    end
	end
	
	local Weapon = {"Remington 870"}
	for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
	    if v.Name == Weapon[1] then
	        local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
	    end
	end
	
	local Weapon = {"M9"}
	for i,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
	    if v.Name == Weapon[1] then
	        local lol = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
	    end
	end

end)


a:Button("Give All Melee", function()
    local weapons = {"Crude Knife", "Sharpened stick", "Extendo mirror"}
	for i, v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
	    for j, k in pairs(weapons) do
	        if v.Name == k then
	            v:Clone().Parent = game.Players.LocalPlayer.Backpack
	        end
	    end
	end
end)

a:Button("Ear Rape Everyone", function()
while wait() do
for i,v in pairs(game.Players:GetChildren()) do
pcall(function()
local A_1 = game:GetService("Workspace")["Prison_guardspawn"].spawn.Sound
local A_2 = v.Character.Head
local Event = game:GetService("ReplicatedStorage").SoundEvent
Event:FireServer(A_1, A_2)
end)
end
end
end)

--Gun Mods
Gun:Button("Mod all weapons", function()
    pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:children()) do 
			local gunstates = v:findFirstChild("GunStates")
			if gunstates then 
				local module = require(gunstates)
				module.Bullets = 10
				module.Spread = 0
				module.CurrentAmmo = 999
				module.StoredAmmo = 9999
				module.AutoFire = true
				module.Range = 10000
				module.FireRate = 0.001
				module.MaxAmmo = 999
				module.Damage = 100
			end
		end
		
		for i, v in pairs(game.Players.LocalPlayer.Character:children()) do 
			local gunstates = v:findFirstChild("GunStates")
			if gunstates then 
				local module = require(gunstates)
				module.Bullets = 100
				module.Spread = 0
				module.CurrentAmmo = 999
				module.StoredAmmo = 9999
				module.AutoFire = true
				module.Range = 10000
				module.FireRate = 0.00001
				module.MaxAmmo = 999
			end
		end
	end)
end)

--Teams
Teams:Button("Prisoner", function()
    workspace.Remote.TeamEvent:FireServer("Bright orange") 
end)

Teams:Button("Criminal", function()
    local LP = game.Players.LocalPlayer
    local RE = LP.Character.HumanoidRootPart.Position
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
    wait(0.075)
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(RE)
end)

Teams:Button("Police", function()
    workspace.Remote.TeamEvent:FireServer("Bright blue")
end)

Teams:Button("Neatral", function()
    workspace.Remote.TeamEvent:FireServer("Medium stone grey") 
end)

--Combat

Combat:Button("Taze all", function()
    local function kill(a)
	    local A_1 = 
	    {
	        [1] = {
				["RayObject"] = Ray.new(Vector3.new(829.838562, 101.489998, 2331.25635), Vector3.new(-30.6540909, -5.42795324, 95.0308533)), 
				["Distance"] = 15.355997085571, 
				["Cframe"] = CFrame.new(826.616699, 100.8508, 2340.11279, 0.964640439, -0.00993416365, -0.263382077, 9.31322575e-10, 0.999289393, -0.0376908854, 0.263569355, 0.0363581516, 0.963954985), 
				["Hit"] = a.Character.Torso
	    	}
	    }
	    local A_2 = game.Players.LocalPlayer.Backpack["Taser"]
	    local Event = game:GetService("ReplicatedStorage").ShootEvent
	    Event:FireServer(A_1, A_2)
	end
	
	for i,v in pairs(game.Players:GetChildren())do
	    if v.Name ~= game.Players.LocalPlayer.Name then
	        kill(v)
	    end
	end
end)

Combat:Button("Kill All", function()
local players = game:GetService("Players");
local runservice = game:GetService("RunService");

local localplayer = players.LocalPlayer;


local meleeevent = game.ReplicatedStorage.meleeEvent;
local signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))();
local attacking = signal.new();
local queue = {cancontinue = false};


attacking:Connect(function(plr, char)
    local killed = false;
    local killedcon; killedcon = plr.CharacterRemoving:Connect(function()
        killed = true;
        queue.cancontinue = true;
        killedcon:Disconnect();
        killedcon = nil;
    end);
    local step; step = runservice.Heartbeat:Connect(function()
        if killed then
            step:Disconnect();
            step = nil;
        end
        if char:FindFirstChild("Head") and localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
            localplayer.Character.HumanoidRootPart.CFrame = char.Head.CFrame + Vector3.new(0, localplayer.Character.Humanoid.HipHeight, 0);
            meleeevent:FireServer(plr);
        end
    end);
end);

for i,v in pairs(players:GetPlayers()) do
    if v ~= localplayer then
        if v.Character and localplayer.Character and v.Character:FindFirstChild("Head") and localplayer.Character:FindFirstChild("HumanoidRootPart") then
            attacking:Fire(v, v.Character);
            repeat
                runservice.Heartbeat:Wait();
            until queue.cancontinue;
            queue.cancontinue = false;
        end
    end
end
end)

--Teleports

TP:Button("Prison Entrance", function()
    	teleport("474.655701, 98.1900101, 2250.36841")
end)

TP:Button("Gaurd Room", function()
	teleport("798.664368, 99.9900055, 2264.11157")
end)

TP:Button("Yard", function()
	teleport("767.570129, 97.9999466, 2461.25659")
end)

TP:Button("Prison Cells", function()
	teleport("916.622131, 99.9899902, 2465.79858")
end)

TP:Button("Cafe", function()
	teleport("960.83783, 99.9899597, 2340.33911")
end)

TP:Button("Main Tower", function()
	teleport("823.287292, 130.039948, 2587.73975")
end)

TP:Button("Kitchen", function()
	teleport("941.972778, 99.9899597, 2222.83716")
end)

TP:Button("Police Garage", function()
	teleport("614.918396, 98.2000275, 2512.02368")
end)

--AimBot

local aimbotsettings = {
    enabled = false,
    freeforall = false,
    radius = 2500,
    wallcheck = true
}

local players = game:GetService("Players")
local client = players.LocalPlayer
local inputservice = game:GetService("UserInputService")
local mouse = client:GetMouse()
local runservice = game:GetService("RunService")
local aim = false

function GetMouse()
    return Vector2.new(mouse.X, mouse.Y)
end

inputservice.InputBegan:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = true
    end
end)

inputservice.InputEnded:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = false
    end
end)

function FreeForAll(targetplayer)
    if aimbotsettings.freeforall == false then
        if client.Team == targetplayer.Team then return false
        else return true end
    else return true end
end

function NotObstructing(destination, ignore)
    if aimbotsettings.wallcheck then
        Origin = workspace.CurrentCamera.CFrame.p
        CheckRay = Ray.new(Origin, destination- Origin)
        Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
        return Hit == nil
    else
        return true
    end
end

function GetClosestToCuror()
    MousePos = GetMouse()
    Radius = aimbotsettings.radius
    Closest = math.huge
    Target = nil
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if FreeForAll(v) then
            if v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
                Point,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                clientchar = client.Character
                if OnScreen and NotObstructing(v.Character.Head.Position,{clientchar,v.Character}) then
                    Distance = (Vector2.new(Point.X,Point.Y) - MousePos).magnitude
                    if Distance < math.min(Radius,Closest) then
                        Closest = Distance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end 

runservice.RenderStepped:Connect(function()
    if aimbotsettings.enabled == false or aim == false then return end
    ClosestPlayer = GetClosestToCuror()
    if ClosestPlayer then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p,ClosestPlayer.Character.Head.CFrame.p)
    end
end)

-- Enables/Disables aimbot. Essentially its the main toggle.
Aim:Toggle( "Enabled", function(value)
    aimbotsettings.enabled = value
end)

-- Enables/Disables wallcheck. It locks on only if the enemy is not obstructed by a part.
Aim:Toggle( "Wall Check", function(value)
    aimbotsettings.wallcheck = value
end)

-- Determines if it should only lock onto players who are on the same team or not. Sometimes can get fucked so turning it on is the way to go.
Aim:Toggle( "Free For All ", function(value)
    aimbotsettings.freeforall = value
end)

Aim:Button("Silent Aim", function()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
function ClosestChar()
    local Max, Close = math.huge
    for I,V in pairs(GetPlayers(Players)) do
        if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
            local Head = FindFirstChild(V.Character, "Head")
            if Head then
                local Pos, OnScreen = WTSP(Camera, Head.Position)
                if OnScreen then
                    local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                    if Dist < Max then
                        Max = Dist
                        Close = V.Character
                    end
                end
            end
        end
    end
    return Close
end

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Head, Character.Head.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)

end)

--ESP
local ESPEnabled = false
local DistanceEnabled = false
local TracersEnabled = false

pcall(function()
	
	Camera = game:GetService("Workspace").CurrentCamera
	RunService = game:GetService("RunService")
	camera = workspace.CurrentCamera
	Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

	function GetPoint(vector3)
		local vector, onScreen = camera:WorldToScreenPoint(vector3)
		return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
	end
	
	function MakeESP(model)
		local CurrentParent = model.Parent
	
		local TopL = Drawing.new("Line")
		local BottomL = Drawing.new("Line")
		local LeftL = Drawing.new("Line")
		local RightL = Drawing.new("Line")
		local Tracer = Drawing.new("Line")
		local Display = Drawing.new("Text")

        coroutine.resume(coroutine.create(function()
			while model.Parent == CurrentParent do
				
				local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
                local GetP = GetPoint(model.Head.Position)
                local headps = model.Head.CFrame
                
				if ESPEnabled and GetP[2] then
					
                    -- Calculate Cords
                    local topright = headps * CFrame.new(3,0.5, 0)
                    local topleft = headps * CFrame.new(-3,0.5, 0)
                    local bottomleft = headps * CFrame.new(-3,-7,0)
                    local bottomright = headps * CFrame.new(3,-7,0)
					topright = GetPoint(topright.p)[1]
					topleft = GetPoint(topleft.p)[1]
					bottomleft = GetPoint(bottomleft.p)[1]
					bottomright = GetPoint(bottomright.p)[1]

                    local teamcolor = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                    TopL.Color, BottomL.Color, RightL.Color, LeftL.Color = teamcolor, teamcolor, teamcolor, teamcolor
                    TopL.From, BottomL.From, RightL.From, LeftL.From = topleft, bottomleft, topright, topleft
                    TopL.To, BottomL.To, RightL.To, LeftL.To = topright, bottomright, bottomright, bottomleft
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = true, true, true, true
				else
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = false, false, false, false
                end
                
				if ESPEnabled and TracersEnabled and GetP[2] then
					Tracer.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
					Tracer.From = Bottom
					Tracer.To = GetPoint(headps.p)[1]
					Tracer.Thickness = 1.5
					Tracer.Visible = true
				else
					Tracer.Visible = false
                end
                
				if ESPEnabled and DistanceEnabled and GetP[2] then
					Display.Visible = true
					Display.Position = GetPoint(headps.p + Vector3.new(0,0.5,0))[1]
					Display.Center = true
					Display.Text = tostring(math.floor(Distance)).." studs"
				else
					Display.Visible = false
                end
                
				RunService.RenderStepped:Wait()
			end
	
			TopL:Remove()
			BottomL:Remove()
			RightL:Remove()
			LeftL:Remove()
			Tracer:Remove()
			Display:Remove()
        
        end))
    end
    
	for _, Player in next, game:GetService("Players"):GetChildren() do
		if Player.Name ~= game.Players.LocalPlayer.Name then
			MakeESP(Player.Character)
			Player.CharacterAdded:Connect(function()
				delay(0.5, function()
					MakeESP(Player.Character)
				end)
			end)
		end	
	end
	
	game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            delay(0.5, function()
                MakeESP(player.Character)
            end)
		end)
	end)
	
end)

-- Enables/Disables ESP. Main toggle
ESP:Toggle( "Enabled", function(value)
    ESPEnabled = value
end)

-- Toggles tracers
ESP:Toggle( "Tracers", function(value)
    TracersEnabled = value
end)

-- Toggles distance display
ESP:Toggle( "Distance Display", function(value)
    DistanceEnabled = value
end)

--B

b:Button("Made By APollo#2391", function()
end)
