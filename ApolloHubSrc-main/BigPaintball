local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Big PaintBall";
	Duration = 5;
})

wait(5) 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local Gun = Library:Window("Gun Mods")
local m = Library:Window("AimBot")
local e = Library:Window("ESP")
local b = Library:Window("Credits")

   CoreGui:SetCore("SendNotification", {
	Title = "Loaded!";
	Text = "Made by APollo#2391";
	Duration = 5;
})
--A
a:Button("TP to BanLand", function()
game:GetService("TeleportService"):Teleport(4505939773, LocalPlayer)
end)

a:Button("Unlock all", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Singularity5490/bigpaintball/main/unlockall.lua'))()
end)

a:Button("Additional Speed", function(value)
        for i,v in pairs(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Guns:GetChildren()) do
            pcall(function()
                require(v)[tostring(i)].additionalSpeed = 15
            end)
        end
end)

--GunMods

Gun:Button("Increased Fire Rate", function()
        for i,v in pairs(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Guns:GetChildren()) do
            pcall(function()
                require(v)[tostring(i)].automatic = 999999
            end)
        end
end)

Gun:Button("Range (No Drop)", function()
for i,v in pairs(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Guns:GetChildren()) do
pcall(function()
require(v)[tostring(i)].velocity = 9999999
end)
end
end)

Gun:Button("Super Gun", function()
for i,v in pairs(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Guns:GetChildren()) do
pcall(function()
require(v)[tostring(i)].firerate = math.huge
require(v)[tostring(i)].velocity = 9999999
require(v)[tostring(i)].additionalSpeed = 10
require(v)[tostring(i)].automatic = false
end)
end
end)

    
Gun:Toggle("Automatic Fire Rate", function(value)
        for i,v in pairs(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Guns:GetChildren()) do
            pcall(function()
                require(v)[tostring(i)].automatic = value
            end)
        end
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
e:Toggle("Enabled", function(t)
    ESPEnabled = t
end)

-- Toggles tracers
e:Toggle("Tracers", function(t)
    TracersEnabled = t
end)

-- Toggles distance display
e:Toggle("Distance Display", function(t)
    DistanceEnabled = t
end)

--Combat


m:Toggle("Silent Aim", function(t)
-- Var
local Players       = game:GetService("Players"); --> Wally is sexy!
local Player        = Players.LocalPlayer;

-- Game Things
local scriptEnv     = require(game:GetService("ReplicatedStorage").Framework.Library);
local network       = scriptEnv.Network;
local gunCmds       = scriptEnv.GunCmds;
local SilentAimTog  = t;


-- Close Player Func
local function getClosestPlayer()
    local shortestDistance, closestPlayer  = math.huge;

    for i, v in next, Players:GetPlayers() do
        if (v.Name ~= Player.Name and v.Team ~= Player.Team and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and v.Character and v.Character:FindFirstChild("HumanoidRootPart")) then
            local mag = (v.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).magnitude;
            
            if (mag < shortestDistance) then
                closestPlayer = v;
                shortestDistance = mag;
            end;
        end;
    end;

    return closestPlayer;
end;

-- Kill Function
local function kill(code, plr)
    if (code and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
        local data = 
            {
                [1] = 
            {
                [1] = plr.Character.Humanoid;
                [2] = code;
                [3] = 235;
                [4] = plr.Character.HumanoidRootPart.Position;
                [5] = false;
            };
                [2] = 
            {
                [1] = false;
                [2] = false;
                [3] = false;
                [4] = false;
                [5] = false;
            };
        };

        game:GetService("Workspace"):FindFirstChild("__THINGS"):FindFirstChild("__REMOTES"):FindFirstChild("do damage"):FireServer(data);
    end;
end;


-- Network Hook
do
    -- Hook
    local oldFire = network.Fire;

    network.Fire = newcclosure(function(self, ...)
        local args = {...};

        if (tostring(self) == "New Projectile" and SilentAimTog) then
            local closePlayer = getClosestPlayer();

            if (closePlayer) then
                kill(args[2], closePlayer); --> Epic func
            end;
        elseif (tostring(self) == "Request Respawn" and UnlockAllTog) then
            args[1] = "1"; --> Easy peasy bypass :)
        end;

        return oldFire(self, unpack(args));
    end);
end;
end)

--AImbot

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
m:Toggle("Enabled", function(t)
    aimbotsettings.enabled = t
end)

-- Enables/Disables wallcheck. It locks on only if the enemy is not obstructed by a part.
m:Toggle("Wall Check", function(t)
    aimbotsettings.wallcheck = t
end)

-- Determines if it should only lock onto players who are on the same team or not. Sometimes can get fucked so turning it on is the way to go.
m:Toggle("Free For All", function(t)
    aimbotsettings.freeforall = t
end)
--B

b:Button("Made By APollo#2391", function()
end)
