local function noclip()
    for i, v in pairs(chr:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
        end
    end
end

game:GetService("RunService").Stepped:Connect(noclip)
