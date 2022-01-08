-- seizure script
--Credit to sked
--[[
    how to use:
    press "j" on your keyboard to toggle seizure mode
    works best if you run, jump then press j
    works on all games works best on r6 avatar because u shake but it works on r15 too
]]

local an = Instance.new("Animation",workspace)
an.AnimationId = "rbxassetid://48972923"
local an2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(an)
an:Remove()

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if key == "j" then
        if game.Players.LocalPlayer.Character.Humanoid.PlatformStand then
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
            an2:Stop()
        else
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(-60, 0, 0)
            an2:Play()
            an2:AdjustSpeed(9999)
        end
    end
end)
