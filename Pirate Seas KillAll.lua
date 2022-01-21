game:GetService("RunService").Stepped:connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetPlayers()) do
            local args = {
                [1] = workspace[v.Name],
                [2] = math.huge
            }
            
            game:GetService("ReplicatedStorage").Events.CombatEvent:FireServer(unpack(args))
        end 
    end)
end)
