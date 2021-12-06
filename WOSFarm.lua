--[[
  Really trying to steal a trash script i spent 30 seconds on LMAOOOO
  Discord - https://sensei-joshy.xyz/discord
]]--
getgenv().Farm = True

while getgenv().Farm do wait()
    pcall(function()
        for _,v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
            end
        end
    end)
end
