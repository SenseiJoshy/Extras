getgenv().KillAura = true --Change to false to turn off

game:GetService("RunService").Stepped:connect(function()
   pcall(function()
       if KillAura then
           for i,v in pairs(game:GetService("Workspace").Bots.AI:GetChildren()) do
               local args = {
                   [1] = {
                       [1] = "damage",
                       [2] = v.UpperTorso,
                       [3] = Vector3.new(v.HumanoidRootPart.Position),
                       [4] = game:GetService("ReplicatedFirst").Moves.BTPunch1,
                       [5] = "Beast",
                       [6] = 0.67969219472527
                   }
               }
               
               game:GetService("ReplicatedStorage").Events.ME:FireServer(unpack(args))
           end
       end
   end)
end)
