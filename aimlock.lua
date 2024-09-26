local aimlockEnabled = false
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local function toggleAimlock()
    aimlockEnabled = not aimlockEnabled
    if aimlockEnabled then
        print("Aimlock is enabled")
    else
        print("Aimlock is disabled")
    end
end

local function Initialize(tab)
    tab:AddToggle("aimlockToggle", {
        Title = "Toggle Aimlock",
        Default = false,
        Callback = function(value)
            aimlockEnabled = value
            toggleAimlock()
        end
    })

    -- Логика Aimlock
    UserInputService.InputBegan:Connect(function(input, isProcessed)
        if aimlockEnabled and not isProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local closestPlayer = nil
            local closestDistance = math.huge

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local distance = (player.Character.Head.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end

            if closestPlayer then
                LocalPlayer.Character.HumanoidRootPart.CFrame = closestPlayer.Character.Head.CFrame
            end
        end
    end)
end

return { Initialize = Initialize }
