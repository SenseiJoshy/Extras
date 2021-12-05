local args = {
   [1] = game:GetService("Players").LocalPlayer.Data.Level, --[[Defense, Melee, Sword, DevilFruit]]--
   [2] = -9e15
}

game:GetService("ReplicatedStorage").Remotes.Stats:FireServer(unpack(args))
