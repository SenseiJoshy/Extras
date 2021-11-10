game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Made By Sensei Joshy#1060";
    Text = "Join Discord.gg/akumahub For More!!";
})
--Re-Execcute To Stop Auto Farm.
getgenv().DBOGFarm = not getgenv().DBOGFarm
game:GetService("RunService").Stepped:Connect(function()
   if getgenv().DBOGFarm then
       local descendants = Workspace.Map.Grass:GetDescendants()
       for index, descendant in pairs(descendants) do
          if descendant.Name == "Collision" then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(descendant.Position)
               wait(.2)
               game:GetService("ReplicatedStorage").Events.Update:FireServer()
           end
       end
   end
end)