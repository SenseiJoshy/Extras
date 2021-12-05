getgenv().Autopick = true -- set to false dumbass if u want to stop
getgenv().Autofarm = true -- set to false dumbass if u want to stop

coroutine.wrap(function()
    while wait() do 
        if getgenv().Autofarm then 
           game.Players.LocalPlayer.Character.Head:FindFirstChildWhichIsA("BillboardGui"):Destroy() 
        end
    end
end)()

coroutine.wrap(function()
    while wait() do 
        if getgenv().Autofarm then 
            game:GetService("ReplicatedStorage").BackgroundFires.QuestAccept:FireServer(workspace.CityParts.QuestGivers["All Might"],true)
        end
    end
end)()

spawn(function()
    while task.wait() do
        if getgenv().Autopick == true then
            pcall(function()     
                for i, v in pairs(game:GetService("Workspace").CityParts.Beach.BeachJunk:GetDescendants()) do
                    if v:FindFirstChild("PickUp") then
                        fireproximityprompt(v.PickUp)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(.2) do
        if getgenv().Autofarm == true then
            pcall(function()
                local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                for _,v in pairs(game:GetService("Workspace").CityParts.Beach.BeachJunk:GetDescendants()) do
                    if v.Name == 'Trash' then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(.1)
                    end
                end
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
            end)
        end
    end
end)
