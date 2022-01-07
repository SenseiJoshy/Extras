getgenv().CandyFarm = true --Change to false to turn off sped

spawn(function()
    while CandyFarm do wait()
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").ItemSpawns.EventItems:GetDescendants()) do
                if v:IsA("MeshPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    fireproximityprompt(v:WaitForChild("ProximityAttachment").Interaction)
                end
            end
        end)
    end
end)
