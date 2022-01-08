local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Arsenal";
	Duration = 5;
})

wait(5) 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local m = Library:Window("AimBot")
local e = Library:Window("ESP")
local gun = Library:Window("Gun Mods")
local b = Library:Window("Credits")


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
a:Toggle("AutoFarm",function(bool)
   if bool then
       wait(5)
       getgenv().AutoFarm = true
       local camera = game.Workspace.CurrentCamera
       function getClosest()
           local closestdistance = math.huge
           local ClosetPlayer = nil
           for i,v in pairs(game.Players:GetChildren()) do
               if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
                   local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                   if distance < closestdistance then
                       closestdistance = distance
                       ClosetPlayer = v
                   end
               end
           end
           return ClosetPlayer
       end

       game:GetService("RunService").Stepped:connect(function()
           if getgenv().AutoFarm == true then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosest().Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
           camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)
           mouse1press()
           wait()
           mouse1release()
           keypress(0x52)
           end
       end)
   else
       print("Stopped")
       getgenv().AutoFarm = false
   end
end)

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
--B

b:Button("Made By APollo#2391", function()
end)

--Gun Mods

local wallbangenabled = false
-- Ill explain the wallbang script
local gm = getrawmetatable(game)            -- gets metatable of game
setreadonly(gm,false)                       -- Makes it writable
local OldIndex = gm.__index                 -- Save old index so we can return it if condition is not met
gm.__index = newcclosure(function(self,i)   -- Make new index method with a C function making it undetectable
    if i == "Clips" and wallbangenabled then                    -- Check if index was clips meaning thats the ammo we want to spoof
        return workspace.Map                -- Then we just return workspace.map so that the bullet doesnt stop when it comes in contact
    end
    return OldIndex(self,i)                 -- If its not met we just return old index we saved
end)

-- Toggles wallbang
gun:Toggle("WallBang", function(t)
    wallbangenabled = t
end)


local InfAmmoVar = false
local NoRecoilVar = false
local AutomaticModeVar = false
local NoSpreadVar = false

local a
local b
for i,v in next, getgc() do
  if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
     a = getfenv(v);
     b = v
  end
end

game:GetService("RunService").Heartbeat:Connect(function()
	if InfAmmoVar then
		debug.setupvalue(b,5,420)
	end
	if InfAmmoVar or NoSpreadVar or AutomaticModeVar or NoRecoilVar then
		a.DISABLED = false
		a.DISABLED2 = false
	end
	if NoSpreadVar then
		a.currentspread = 0
	end
	if NoRecoilVar then
		a.recoil = 0
	end
	if AutomaticModeVar then
		a.mode = "automatic"
	end
end)

gun:Toggle("No Recoil", function(t)
	NoRecoilVar = t
end)

gun:Toggle("Inf Ammo", function(t)
	InfAmmoVar = t
end)

gun:Toggle("Automatic", function(t)
	AutomaticModeVar = t
end)

gun:Toggle("No Spread", function(t)
	NoSpreadVar = t
end)

gun:Button("RainBow Gun", function()
local c = 1
function zigzag(X)
 return math.acos(math.cos(X * math.pi)) / math.pi
end
game:GetService("RunService").RenderStepped:Connect(function()
 if game.Workspace.Camera:FindFirstChild('Arms') then
  for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do
   if v.ClassName == 'MeshPart' then 
    v.Color = Color3.fromHSV(zigzag(c),1,1)
    c = c + .0001
   end
  end
 end
end)
end)

