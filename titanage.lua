local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Venyx-UI-Library/main/source.lua"))()

local lib = library.new("Titanage | Discord.gg/CastAways", 5013109572)
local page = lib:addPage("Auto Farm", 5012544693)
local section1 = page:addSection("Auto Farm")
local section2 = page:addSection("ETC")


local wrk = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local lp = game:GetService("Players").LocalPlayer
local run = game:GetService("RunService")

local farmStuff = {
  ["Farming"] = false,
  ["Tping"] = false,
  ["GettingBlades"] = false,
  ["Speed"] = 200
}

-- functions
local function tweenTo(to,speed, bad)
  if (lp.Character.HumanoidRootPart.Position - to.p).Magnitude > 100 and lp.Character.HumanoidRootPart.Position.Y < 400 then
    local TweenService = game:GetService("TweenService")
    local hrp = lp.Character.HumanoidRootPart
    local goal = {["CFrame"] = CFrame.new(hrp.Position + Vector3.new(0, 200,0))}
    local tweenInfo = TweenInfo.new((hrp.Position - goal.CFrame.p).Magnitude / speed)

    local t = TweenService:Create(hrp, tweenInfo, goal)
 
    t:Play()
    farmStuff.Tping = true
    coroutine.wrap(function()
      repeat 
        lp.Character.Humanoid:ChangeState(11)
        run.RenderStepped:Wait()
      until farmStuff.Tping == false
    end)()
    t.Completed:Wait()
    farmStuff.Tping = false


    local goal = {["CFrame"] = CFrame.new(to.p.X, hrp.Position.Y, to.p.Z)}
    local tweenInfo = TweenInfo.new((hrp.Position - goal.CFrame.p).Magnitude / speed)
  
    local t = TweenService:Create(hrp, tweenInfo, goal)
   
    t:Play()
    farmStuff.Tping = true
    coroutine.wrap(function()
      repeat 
        lp.Character.Humanoid:ChangeState(11)
        run.RenderStepped:Wait()
      until farmStuff.Tping == false
    end)()
    t.Completed:Wait()
    farmStuff.Tping = false


    local TweenService = game:GetService("TweenService")
    local hrp = lp.Character.HumanoidRootPart
    local goal = {["CFrame"] = to}
    local tweenInfo = TweenInfo.new((hrp.Position - goal.CFrame.p).Magnitude / speed)
  
    local t = TweenService:Create(hrp, tweenInfo, goal)
   
    t:Play()
    farmStuff.Tping = true
    coroutine.wrap(function()
      repeat 
        lp.Character.Humanoid:ChangeState(11)
        run.RenderStepped:Wait()
      until farmStuff.Tping == false
    end)()
    t.Completed:Wait()
    farmStuff.Tping = false
    wait(0.5)
  else
    local TweenService = game:GetService("TweenService")
    local hrp = lp.Character.HumanoidRootPart
    local goal = {["CFrame"] = to}
    local tweenInfo = TweenInfo.new((hrp.Position - goal.CFrame.p).Magnitude / speed)
  
    local t = TweenService:Create(hrp, tweenInfo, goal)
   
    t:Play()
    farmStuff.Tping = true
    coroutine.wrap(function()
      repeat 
        lp.Character.Humanoid:ChangeState(11)
        run.RenderStepped:Wait()
      until farmStuff.Tping == false
    end)()
    t.Completed:Wait()
    farmStuff.Tping = false
  end
end

local function getClosest(t)
  if #t == 1 then
    return t[1]
  elseif #t > 1 then
    local distances = {}
    local targets = {}
    for i,v in next, t do
      targets[#targets+1] = v
      distances[#targets] = (v.Position - lp.Character.HumanoidRootPart.Position).Magnitude
    end
    local smallest = table.find(distances, math.min(unpack(distances)))
    return targets[smallest]
  end
end

local function getPossibleReloads()
  local bladeReloads = {}
  local gasReloads = {}
  for i,v in next, wrk.SupplyStations:GetChildren() do
    if v.Name == "Blades" and v.BladesLeft.Value > 0 then
      bladeReloads[#bladeReloads+1] = v
    elseif v.Name == "Gas" and v.GasLeft.Value > 0 then
      gasReloads[#gasReloads+1] = v
    end
  end
  return bladeReloads, gasReloads
end

local function reGas()
  local gas = select(2,getPossibleReloads())
  if type(gas) == "table" and #gas ~= 0 then
    farmStuff.GettingBlades = true
    wait(0.5)
    local gassy = getClosest(gas)
    local remote = gassy:FindFirstChild("RemoteEvent")
    tweenTo(CFrame.new(gassy.Position), farmStuff.Speed)
    wait(0.5)
    remote:FireServer(true)
    wait(0.5)
    for i=1, 11 do
      remote:FireServer(false)
    end
    wait(0.5)
    farmStuff.GettingBlades = false
    return "done"
  end
  return "nope"
end

local function reBlades()
  local blades = select(1,getPossibleReloads())
  if type(blades) == "table" and #blades ~= 0 then
    farmStuff.GettingBlades = true
    wait(0.5)
    local blade = getClosest(blades)
    local remote = blade:FindFirstChild("RemoteEvent")
    tweenTo(CFrame.new(blade.Position), farmStuff.Speed)
    wait(0.5)
    remote:FireServer(true)
    wait(0.5)
    for i=1, 11 do
      remote:FireServer(false)
    end
    wait(0.5)
    farmStuff.GettingBlades = false
    return "done"
  end
  return "nope"
end



local function attack()
  if not lp.Character:FindFirstChild("LeftBlade") or not lp.Character:FindFirstChild("RightBlade") then
    replicatedStorage.Remotes.ODM:FireServer({"ToggleBlades"})
      wait(0.5)
  elseif lp.Character:FindFirstChild("LeftBlade") and lp.Data.BladeDurability.Value > 0 then
    replicatedStorage.Remotes.ODM:FireServer({"StartSwing", "AmongUs"})
      wait()
    replicatedStorage.Remotes.ODM:FireServer({"EndSwing", "AmongUs"})
  elseif lp.Data.BladeDurability.Value == 0 and lp.Data.BladesLeft.Value > 0 then
    replicatedStorage.Remotes.ODM:FireServer({"ReloadBlades"})
  elseif lp.Data.BladesLeft.Value == 0 and lp.Data.BladeDurability.Value == 0 then
    reBlades()
  end
end

function getNpcs()
  local napes = {}
  local titans = wrk.Titans:GetChildren()
  for i,titan in next, titans do
    local hitboxes = titan:FindFirstChild("Hitboxes")
    if hitboxes and hitboxes:FindFirstChild("Nape") then
      napes[#napes+1] = hitboxes.Nape
    end
  end
  if #napes == 0 then
    wait(1)
    return getNpcs()
  end
  return napes
end
local function Farm()
  local nape = getNpcs()
    local v = getClosest(nape)
    if v.Parent.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Humanoid.Health > 0 then
      if farmStuff.GettingBlades == true then
        return
      end
      repeat
        if farmStuff.GettingBlades == true then
          return
        end
        coroutine.wrap(function()
          repeat
            local napePos = v.Position
            local tpPos = CFrame.new(napePos + v.CFrame.LookVector*-0.05 , napePos)
            tweenTo(tpPos, farmStuff.Speed)
            run.RenderStepped:Wait()
            if farmStuff.GettingBlades == true then
              break
            end
          until not v or not v.Parent or not v.Parent.Parent or not v.Parent.Parent:FindFirstChild("Humanoid") or v.Parent.Parent.Humanoid.Health <= 0
        end)()
        wait(0.1)
        attack()
        wait(0.5)
      until not v or not v.Parent or not v.Parent.Parent or not v.Parent.Parent:FindFirstChild("Humanoid") or v.Parent.Parent.Humanoid.Health <= 0
    end
end
-- functions end
section1:addToggle("Autofarm", nil, function(bool)
    farmStuff.Farming = bool
    while farmStuff.Farming do
      Farm()
    end
end)
section1:addSlider("Tween Speed (Recommend Using Max)", 200, 0, 1500, function(val)
    farmStuff.Speed = val
end)

section2:addButton("Anti Grip | Press Before Auto Farming (Server Hop)", function()
  local Character = game:GetService("Players").LocalPlayer.Character
  Character.DescendantAdded:Connect(function(A_1)
      wait(0.2)
      if A_1.Name == "Grip" then
          Character:Destroy()
          wait()
          game:GetService("TeleportService"):Teleport(6737540754)
      end
  end)

end)

section2:addButton("Server Hop", function()
  game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

section2:addButton("", function()
  reGas()
end)

section2:addButton("", function()
  reBlades()
end)

-- Credit Page
local page2 = lib:addPage("Credits", 5012544693)
local section1 = page2:addSection("Made By:")
section1:addButton("Castaways - Discord", function()
    setclipboard("https://discord.gg/castaways")
end)
section1:addButton("Sensei Joshy#1060", function()
  setclipboard("Sensei Joshy#1060")
end)
section1:addButton("Discord !0000#6303", function()
    setclipboard("Discord !0000#6303")
end)

