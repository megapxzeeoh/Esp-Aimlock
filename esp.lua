local espEnabled = false
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function toggleESP()
    if espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight", player.Character)
                highlight.FillColor = Color3.new(1, 0, 0) -- Красный цвет
                highlight.OutlineColor = Color3.new(1, 1, 1) -- Белый цвет
            end
        end
    end
end

local function Initialize(tab)
    tab:AddToggle("espToggle", {
        Title = "Toggle ESP",
        Default = false,
        Callback = function(value)
            espEnabled = value
            toggleESP()
        end
    })

    -- Логика ESP
    game:GetService("RunService").RenderStepped:Connect(function()
        if espEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    if not player.Character:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight", player.Character)
                        highlight.FillColor = Color3.new(1, 0, 0) -- Красный цвет
                        highlight.OutlineColor = Color3.new(1, 1, 1) -- Белый цвет
                    end
                end
            end
        end
    end)
end

return { Initialize = Initialize }
