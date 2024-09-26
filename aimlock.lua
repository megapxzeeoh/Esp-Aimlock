local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function aimlock()
    local target = nil
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            target = player.Character.HumanoidRootPart
            break
        end
    end
    
    if target then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame
    end
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then  -- Вы можете изменить кнопку
        aimlock()
    end
end)
