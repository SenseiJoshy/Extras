getgenv().Loop = true
while wait() do
if getgenv().Loop == true then
    local args = {
            [1] = "Safe"
        }
       
        game:GetService("ReplicatedStorage").Remote.SafeZone:FireServer(unpack(args))
    end
end
