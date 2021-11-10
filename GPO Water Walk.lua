_G.Jesus = true
local part = Instance.new("Part",workspace)
local RunService = game:GetService("RunService")
part.Name = "Jesus"
local target = game:GetService("Workspace").Effects.Water
part.Anchored = true
part.Size = Vector3.new(16,1.2,16)
part.Transparency = 1
part.CanCollide = true
spawn(function()
   while _G.Jesus == true do
       wait()
       part.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x,-2.6,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)
   end
end)
