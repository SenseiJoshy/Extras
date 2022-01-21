game:GetService("RunService").Stepped:connect(function()
  pcall(function()
        for _,v in pairs(game:GetService("Workspace").ChestSpawns:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) 
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) 
            end
        end
    end)
end)
