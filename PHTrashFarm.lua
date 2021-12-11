while TrashFarm do wait(8)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(323.533539, 1179.40234, -1151.50696)
   local A_1 = "CleanUpRestaurant"
   local Event = game:GetService("ReplicatedStorage").Quests.AcceptQuest
   Event:FireServer(A_1)
end
pcall(function() wait()
   for _,v in pairs(game:GetService("Workspace").Trash:GetDescendants()) do
       if v:IsA("ClickDetector") then
           fireclickdetector(v)
       end
   end
end)
