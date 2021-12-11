local client = game.Players.LocalPlayer.Character

local function GetOre()
    local TargetDistance = math.huge
    local Target
    for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("Main") and v.Name == SelectedOre and v.Interact.Value == true then
            local Mag = (client.HumanoidRootPart.Position - v:FindFirstChildOfClass("Part").Position).Magnitude
            if Mag < TargetDistance then
                TargetDistance = Mag
                Target = v
            end
        end
    end
    return Target
end;

coroutine.wrap(function()
    while wait() do 
        if OreFarm then 
            client.Humanoid:ChangeState(11)
        end
    end
end)()

while OreFarm do
    pcall(function() 
        wait(0.2)
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            local Time =
                (GetOre().Main.CFrame.p + Vector3.new(0, 0, 2) -
                client.HumanoidRootPart.Position).magnitude / 250
            local Info = TweenInfo.new(Time, Enum.EasingStyle.Elastic)
            local Tween =
                game:GetService("TweenService"):Create(
                    client.HumanoidRootPart,
                Info,
                {CFrame = CFrame.new(GetOre().Main.CFrame.p + Vector3.new(0, 0, 2))}
            )
            Tween:Play()
            if GetOre().Interact.Value == true then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").SwordScript.Activate:FireServer()
            end
            wait(0.1)
            for _, v in pairs(game:GetService("Workspace").Drops:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    wait(0.1)
                    firetouchinterest(client.HumanoidRootPart, v.Parent, 0)
                    wait()
                    firetouchinterest(client.HumanoidRootPart, v.Parent, 1)
                end
            end
        end
    end)
end
