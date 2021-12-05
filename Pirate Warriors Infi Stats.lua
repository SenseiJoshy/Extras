local args = {
   [1] = "PointsControl",
   [2] = "addPoints",
   [4] = "Gun",
   [5] = -100000
}

game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(args))
