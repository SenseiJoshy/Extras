game:GetService("Workspace").MAP.Map["hood kicks"]:Destroy()
print("Da Hood Money Collect ON")
while wait(1) do
local descendants = Workspace.Ignored.Drop:GetDescendants()
for index, descendant in pairs(descendants) do
   if descendant.Name == "MoneyDrop" then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(descendant.Position)
  game.Players.LocalPlayer.Character.Humanoid.Jump = true
  wait(.4)
      fireclickdetector(game.Workspace.Ignored.Drop.MoneyDrop.ClickDetector)
      wait(.1)
end
end
end