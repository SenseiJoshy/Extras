local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Game Detected!";
	Text = "Loading UI | Destruction Simulator";
	Duration = 5;
})

wait(5) 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6W1ZqV53"))()

local a = Library:Window("Apollo Hub")
local b = Library:Window("Credits")
local CoreGui = game:GetService("StarterGui")

   CoreGui:SetCore("SendNotification", {
	Title = "Loaded!";
	Text = "Made by APollo#2391";
	Duration = 5;
})



--A

a:Button("Infinite Coins", function()
game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)

end)


a:Button("Add 10 levels", function()
game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)

end)

a:Button("Auto Sell ", function()
while wait(1) do
   game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
end
end)




--B

b:Button("Made By APollo#2391", function()
end)
