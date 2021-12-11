local client = game.Players.LocalPlayer.Character

local function GetChest()
    local TargetDistance = math.huge
    local Target
    for i, v in ipairs(game:GetService("Workspace").Chests:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("Main") then
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
        if ChestFarm then 
            client.Humanoid:ChangeState(11)
        end
    end
end)()

while ChestFarm do
    wait(0.1)
    pcall(function()
        local Time =
            (GetChest().Main.CFrame.p + Vector3.new(0, 0, 2) -
            client.HumanoidRootPart.Position).magnitude / 250
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Elastic)
        local Tween =
            game:GetService("TweenService"):Create(
                client.HumanoidRootPart,
            Info,
            {CFrame = CFrame.new(GetChest().Main.CFrame.p + Vector3.new(0, 0, 2))}
        )
        Tween:Play()
        repeat
            wait()
        until (GetChest().Main.CFrame.p + Vector3.new(0, 0, 2) -
        client.HumanoidRootPart.Position).Magnitude < 5
        wait(0.2)
        if GetChest().Claimed.Value == false then
            game:GetService("Players").LocalPlayer.PlayerGui.Loot.Ado.PickUp:FireServer(
                GetChest(),
                game:GetService("Players").LocalPlayer.Character
            )
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
    end)
end
