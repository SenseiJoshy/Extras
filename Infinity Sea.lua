Infinite Money | Fruit Fruit:
Code:
local args = {
   [1] = "BuyFruit",
   [2] = "Mera", --Change to fruit u want
   [3] = -10000000000000
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))

Infinite Stats:
Code:
local args = {
   [1] = "AddPoints",
   [2] = "Fruit",
   [3] = -100000
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))

Max Level:
Code:
local args = {
   [1] = "AddPoints",
   [2] = "Level",
   [3] = 300
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))

Free Sword Yoru:
Code:
local args = {
   [1] = "BuySword",
   [2] = "Yoru", ---Change to sword u want
   [3] = 0
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))

Free Mink | Fighting Style:
Code:
local args = {
   [1] = "BuyMink", --Change To Style You Want
   [2] = 0
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))

Free Haki:
Code:
local args = {
   [1] = "Shop_Haki",
   [2] = 0
}

game:GetService("ReplicatedStorage").Remotes.Geral:FireServer(unpack(args))
