getgenv().shoefarm = not getgenv().shoefarm 

coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().shoefarm then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)()

while getgenv().shoefarm do wait()
    for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
        if v:IsA("MeshPart") then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
            if mag < 200 then 
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(-5,0,0)
                wait(0.1)
                fireclickdetector(v.ClickDetector)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(-5,0,0)
            end
        end
    end

    if game.Workspace.Ignored.Drop:FindFirstChild("MeshPart") == nil then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored["Clean the shoes on the floor and come to me for cash"].HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
        wait(0.3)
        fireclickdetector(game.Workspace.Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
    end
end