getgenv().Invis = true
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-222, 804, 103)
if getgenv().Invis then
   if Invis == false then return end
    if game:GetService("Players").LocalPlayer.Character.LowerTorso:FindFirstChild'Root' then
        game:GetService("Players").LocalPlayer.Character.LowerTorso.Root:Remove()
    end
    if game:GetService("Players").LocalPlayer.Character.UpperTorso:FindFirstChild'Waist' then
        game:GetService("Players").LocalPlayer.Character.UpperTorso.Waist:Remove()
    end
end
