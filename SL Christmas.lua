getgenv().AutoFarm = true

local Char = game.Players.LocalPlayer.Character

spawn(function()
    game:GetService("RunService").Stepped:connect(function()
        if getgenv().AutoFarm then
            Char:WaitForChild("Humanoid"):ChangeState(11)
        end
    end)
    while getgenv().AutoFarm do wait()
        pcall(function()
            repeat
                wait(0.3)
                for i, v in pairs(game:GetService("Workspace").missiongivers:GetDescendants()) do
                    if v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission") and v.Head.givemission.Enabled and v.Head.givemission:FindFirstChild("color").Image == "rbxassetid://8308597049" then
                        pcall(function()
                            Char.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            v:FindFirstChild("CLIENTTALK"):FireServer()
                            v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                        end)
                    end
                end
            until getgenv().AutoFarm == false
        end)
    end
end)