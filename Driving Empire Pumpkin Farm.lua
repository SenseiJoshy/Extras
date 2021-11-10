while wait(1) do --Change If You Want
   local descendants = Workspace.Game.Halloween.Pumpkins:GetDescendants()
   for index, descendant in pairs(descendants) do
       if descendant.Name == "_p" then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(descendant.Position)
           wait(5) --Change If You Want
           game.Players.LocalPlayer.Character.Humanoid.Jump = true
           wait(10) --Change If You Want
       end
   end
end
