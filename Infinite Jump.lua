game:GetService("UserInputService").JumpRequest:connect(function()
	if Jump then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
