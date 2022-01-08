local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Phantom Forces";
	Duration = 5;
})

wait(5) 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local Aim = Library:Window("Aimbot")
local ESP = Library:Window("ESP")
local Gun = Library:Window("Gun Mods")
local b = Library:Window("Credits")
local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Loaded!";
	Text = "Made by APollo#2391";
	Duration = 5;
})


local infjumpenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)
--A

a:Toggle("Infinite Jump", function(t)
	infjumpenabled = t
end)



a:Toggle("Xray", function(t)
    if t then
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency + 0.5
			end
		end
    else
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency - 0.5
			end
		end
    end
end)

a:Button("Full Bright", function()
local L = game:GetService("Lighting")

L:GetPropertyChangedSignal("Brightness"):connect(function()
    L.Brightness = math.huge;
end)

L:GetPropertyChangedSignal("Ambient"):connect(function()
    L.Ambient = Color3.fromRGB(255,255,255)
end)

L:GetPropertyChangedSignal("GlobalShadows"):connect(function()
    L.GlobalShadows = false;
end)

L.Brightness = math.huge;
L.Ambient = Color3.fromRGB(255,255,255)
L.GlobalShadows = false;
L.MapSaturation:Destroy()
L.SkyBox:Destroy()
L.BlackWhite:Destroy()
sethiddenproperty(game.Workspace.Lighting,"Technology",2)
end)

a:Button("Server Lag/Crash", function()
local client = {}

for _,table in next, getgc(true) do
   if(typeof(table) == "table") then
      if(rawget(table, "send")) then
         client.net = table
      end
   end
end

while(wait()) do
   spawn(function()
       for _ = 0, 15 do
          client.net.send(client.net, "changecamo", "Recon", "Primary", "AK12", "Slot1", {
             Name = "",
             BrickProperties = {},
             TextureProperties = {}
          })
       end
   end)
end
end)

a:Button("Kill Aura", function()
local Range = 200

local Network;
local UiEffects; -- Hit marker because it looks cool
local PlayerInfo;
local LocalPlayer;

for _, Val in next, getgc(true) do
  if type(Val) == "table" and rawget(Val, "send") then
      Network = Val;
  elseif type(Val) == "table" and rawget(Val, "firehitmarker") then
      UiEffects = Val;
  elseif type(Val) == "table" and rawget(Val, "getbodyparts") and rawget(Val, "getplayerhit") then
      PlayerInfo = Val
  elseif type(Val) == "table" and rawget(Val, "rootpart") and rawget(Val, "setmovementmode") then
      LocalPlayer = Val
  end
  if Network and UiEffects and PlayerInfo and LocalPlayer then
      break;
  end
end
warn(LocalPlayer)
local Players = getupvalue(PlayerInfo.getbodyparts, 1)


local function GetClosestEnemy()
  local ClosestDistance = math.huge
  local ClosestBodyParts, ClosestPlayer = nil, nil;

  local LLocalPlayer = game:GetService("Players").LocalPlayer
  local CurrentTeam = LLocalPlayer.Team

  for Player, BodyParts in next, Players do
      if Player.Team ~= CurrentTeam and BodyParts and BodyParts.rootpart then
          local Distance = (BodyParts.rootpart.Position - LocalPlayer.rootpart.Position).Magnitude
          if Distance < ClosestDistance then
              ClosestDistance = Distance
              ClosestPlayer = Player
              ClosestBodyParts = BodyParts
          end
      end
  end

  return ClosestPlayer, ClosestBodyParts, ClosestDistance
end

local function DamagePlayer(Player, BodyParts)
  Network:send("knifehit", Player, tick(), BodyParts.head)
  UiEffects:firehitmarker(true) -- headshot effect, looks really cool thats why i added it lol
end

game:GetService("RunService").RenderStepped:Connect(function(dT)
  local Player, BodyParts, Distance = GetClosestEnemy()

  if Distance < Range then
      DamagePlayer(Player, BodyParts)
  end
end)
end)

--Variables.
local UserInputService = game:GetService("UserInputService")
local Camera = game:GetService('Workspace').Camera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local IsKeyDown = false

Settings = {
    Enable = false,
    TeamCheck = true,
    Smooth = 5,
    FOV = 5,
    WallCheck = false,
    BulletDrop = 149,
    TriggerKey = Enum.UserInputType.MouseButton2,
    BP = 2.7
}

Aim:Toggle("Enabled", function(t)
    Settings.Enable = t
end)

Aim:Toggle("WallCheck", function(t)
    Settings.WallCheck = t
end)

Aim:Toggle("Team Check", function(t)
    Settings.TeamCheck = t
end)


function isVisible(character)
    local Ray = Ray.new(Camera.CFrame.p, (character.Head.Position - Camera.CFrame.p).unit * 2048)
    local part = workspace:FindPartOnRayWithIgnoreList(Ray, {})
    if part:IsDescendantOf(character) then return true else return false end
end

function Calculate(distance)
    return (1.01*math.pow(distance,4)+0.002*math.pow(distance,3)-0.07*math.pow(distance,2)+0.8*distance-2.05)
end

function WorldToScreen(Position)
    return Camera:WorldToViewportPoint(Position)
end

function IsOnScreen(part)
    local vector, onscreen = WorldToScreen(part.Position)
    return (vector.Z > 0)
end

function IsInFov(part)
    if part then
        if IsOnScreen(part) then
            local pos = WorldToScreen(part.Position)
            local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
            if dist <= workspace.CurrentCamera.ViewportSize.X / (90 / Settings.FOV) and dist < math.huge then
                return true
            end
        end
    end
end

function MyTeam()
    if "Bright blue" == tostring(game.Players.LocalPlayer.TeamColor) then return "Phantoms" else return "Ghosts" end
end

function GetClosestPlayer()
    local TargetDistance = math.huge
    local Target = nil
    for i, v in pairs(game.Workspace.Players:GetDescendants()) do
        if v.Name == "Player" and v:FindFirstChild('HumanoidRootPart') then
            local TargetScreenPos = WorldToScreen(v.HumanoidRootPart.Position)
            local mag = (Vector2.new(TargetScreenPos.X, TargetScreenPos.Y) - Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)).magnitude
            if IsInFov(v:FindFirstChild('Head')) then
                if Settings.TeamCheck then
                    if v.Parent.Name ~= MyTeam() then
                        if mag < TargetDistance then
                            TargetDistance = mag
                            Target = v
                        end
                    end
                elseif mag < TargetDistance then
                    TargetDistance = mag
                    Target = v
                end
            end
        end
    end
    return Target
end

function GetClosestPlayerW()
    local TargetDistance = math.huge
    local Target = nil
    for i, v in pairs(game.Workspace.Players:GetDescendants()) do
        if v.Name == "Player" and v:FindFirstChild('HumanoidRootPart') then
            local TargetScreenPos = WorldToScreen(v.HumanoidRootPart.Position)
            local mag = (Vector2.new(TargetScreenPos.X, TargetScreenPos.Y) - Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)).magnitude
            if IsInFov(v:FindFirstChild("Head")) then
                if Settings.TeamCheck then
                    if v.Parent.Name ~= MyTeam() then
                        if Settings.WallCheck then
                            if isVisible(v) and mag < TargetDistance then
                                TargetDistance = mag
                                Target = v
                            end
                        end
                    end
                elseif Settings.WallCheck then
                    if isVisible(v) and mag < TargetDistance then
                        TargetDistance = mag
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Settings.TriggerKey and Settings.Enable then
        IsKeyDown = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Settings.TriggerKey then
        IsKeyDown = false
	end
end)

local target = nil
local function aimbot()

    if Settings.WallCheck == false then
        target = GetClosestPlayer()
    else
        target = GetClosestPlayerW()
    end

    if target ~= nil then
        local BulletPrediction = target.HumanoidRootPart.Velocity * (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).magnitude / 1200 / Settings.BP
        local aimAt, visible = WorldToScreen(target.Head.Position + Vector3.new(0,Calculate((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).magnitude / Settings.BulletDrop) / Settings.BulletDrop,0) + BulletPrediction) --We get the target's head and add a new vector3 with y being BulletDrop, then we get that from vector3 to vector2, and we basically get the magnitude of target and localplayer and then use our sick math to get a nice curve.
        mousemoverel((aimAt.X - UserInputService:GetMouseLocation().X) / Settings.Smooth, (aimAt.Y - UserInputService:GetMouseLocation().Y) / Settings.Smooth)
    end
end

game:GetService("RunService").RenderStepped:connect(function()
    if IsKeyDown then
        aimbot()
    end
end)

Aim:Toggle("Silent Aim", function()
	local Players = game:GetService("Players")
	local Camera = workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local GameLogic, CharTable, Trajectory
	for I, V in pairs(getgc(true)) do
		if type(V) == "table" then
			if rawget(V, "gammo") then
				GameLogic = V
			end
		elseif type(V) == "function" then
			if debug.getinfo(V).name == "getbodyparts" then
				CharTable = debug.getupvalue(V, 1)
			elseif debug.getinfo(V).name == "trajectory" then
				Trajectory = V
			end
		end
		if GameLogic and CharTable and Trajectory then
			break
		end
	end
	local function Closest()
		local Max, Close = math.huge
		for I, V in pairs(Players:GetPlayers()) do
			if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and CharTable[V] then
				local Pos, OnScreen = Camera:WorldToScreenPoint(CharTable[V].head.Position)
				if OnScreen then
					local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
					if Dist < Max then
						Max = Dist
						Close = V
					end
				end
			end
		end
		return Close
	end
	local MT = getrawmetatable(game)
	local __index = MT.__index
	setreadonly(MT, false)
	MT.__index = newcclosure(function(self, K)
		if not checkcaller() and GameLogic.currentgun and GameLogic.currentgun.data and (self == GameLogic.currentgun.barrel or tostring(self) == "SightMark") and K == "CFrame" then
			local CharChosen = (CharTable[Closest()] and CharTable[Closest()].head)
			if CharChosen then
				local _, Time = Trajectory(self.Position, Vector3.new(0, -workspace.Gravity, 0), CharChosen.Position, GameLogic.currentgun.data.bulletspeed)
				return CFrame.new(self.Position, CharChosen.Position + (Vector3.new(0, -workspace.Gravity / 2, 0)) * (Time ^ 2) + (CharChosen.Velocity * Time))
			end
		end
		return __index(self, K)
	end)
	setreadonly(MT, true)
end)

-- ESP Section

Camera = game:GetService("Workspace").CurrentCamera
RunService = game:GetService("RunService")
camera = workspace.CurrentCamera
Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

function GetPoint(vector3)
    local vector, onScreen = camera:WorldToScreenPoint(vector3)
    return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
end

ColorOfESP = Color3.fromRGB(200,20,0)
ESPEnabled = false
DisplayEnabled = false
TracersEnabled = false

local function MakeESP(model)
    local CurrentParent = model.Parent

    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    local Display = Drawing.new("Text")
    spawn(function()
        while model.Parent == CurrentParent do
            
            local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
            local GetP = GetPoint(model.Head.Position)
            if ESPEnabled and GetP[2] and model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name then
                Box.Color = ColorOfESP
                Box.Thickness = 2
                Box.Size = Vector2.new(25,50)
                Box.Filled = false
                Box.Position = GetP[1] - Vector2.new(15,-30)
                Box.Visible = true
            else
                Box.Visible = false
            end
            if ESPEnabled and TracersEnabled and GetP[2] and model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name then
                Tracer.Color = ColorOfESP
                Tracer.From = Bottom
                Tracer.To = GetP[1] + Vector2.new(0,50)
                Tracer.Thickness = 1.5
                Tracer.Visible = true
            else
                Tracer.Visible = false
            end
            if ESPEnabled and DisplayEnabled and GetP[2] and model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name then
                Display.Visible = true
                Display.Position = GetP[1] + Vector2.new(0,-15)
                Display.Center = true
                Display.Text = tostring(math.floor(Distance)).." studs"
            else
                Display.Visible = false
            end
            RunService.RenderStepped:Wait()
        end

        Box:Remove()
        Tracer:Remove()
        Display:Remove()

    end)
end

for _, Player in next, game:GetService("Workspace").Players.Phantoms:GetChildren() do
    MakeESP(Player)
end

for _, Player in next, game:GetService("Workspace").Players.Ghosts:GetChildren() do
    MakeESP(Player)
end

game:GetService("Workspace").Players.Phantoms.ChildAdded:Connect(function(Player)
    delay(0.5, function()
        MakeESP(Player)
    end)
end)

game:GetService("Workspace").Players.Ghosts.ChildAdded:Connect(function(Player)
    delay(0.5, function()
        MakeESP(Player)
    end)
end)

ESP:Toggle("Enabed", function(t)
    ESPEnabled = t
end)

ESP:Toggle("Display Distance", function(t)
    DisplayEnabled = t
end)

ESP:Toggle("Tracers", function(t)
    TracersEnabled = t
end)

--Gun Mods
Gun:Button("RainBow Gun", function()
game:GetService("RunService").RenderStepped:Connect(function()
 for i,v in pairs(game.Workspace.Camera:GetChildren()) do
  if v.Name ~= 'Left Arm' and v.Name ~= 'Right Arm' then 
   for i,g in pairs(v:GetDescendants()) do
    if g.ClassName == 'Texture' then
      g:Remove()
     else if g.ClassName == 'Part' or g.ClassName == 'MeshPart' or g.ClassName == 'UnionOperation' then
      g.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
     end
    end
   end
  end
 end
end)
end)

Gun:Button("RainBow Gun Particle", function()
local Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
local GameLogic
local Particle = require(game.ReplicatedFirst.ClientModules.Old.framework.particle)
for I,V in pairs(getgc(true)) do
    if type(V) == "table" then
        if rawget(V, "gammo") then
            GameLogic = V
        end
    end
end
local New = Particle.new
Particle.new = function(Data)
    if GameLogic and GameLogic.currentgun and Data.visualorigin == GameLogic.currentgun.barrel.Position then
        Data.color = Color
    end
    return New(Data)
end
coroutine.wrap(function()
    while true and wait() do
        Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)()
end)

Gun:Button("No Recoil or Spread", function()
c = hookfunction(getrenv().math.random, newcclosure(function(a, b, ...)
    if a and b then
        b = a
    else
        return 0
    end
    return c(a, b, ...)
end))
end)
--B

b:Button("Made By APollo#2391", function()
end)

