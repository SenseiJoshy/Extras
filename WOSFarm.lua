--[[
  Really trying to steal a trash script i spent 30 seconds on LMAOOOO
  Discord - https://senseijoshy.com/Discord
]]--
getgenv().ItemFarm = true --Change to false to turn off sped

game:GetService("RunService").Stepped:connect(function()
  pcall(function()
      if ItemFarm then
          for _,v in pairs(game.Workspace:GetDescendants()) do
           if v:IsA("TouchTransmitter") then
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
               end
           end
      end
  end)
end)
