repeat
for i=1,7 do
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("evil ", "All")
end
wait(12)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
