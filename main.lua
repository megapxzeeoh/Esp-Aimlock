-- main.lua

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window

local function initializeWindow()
    Window = Fluent:CreateWindow({
        Title = "Fluent ESP & Aimlock",
        SubTitle = "by megapxzeeoh",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
end

local function setupTabs()
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    -- Подключаем файлы
    local esp = require(script.esp)
    local aimlock = require(script.aimlock)

    esp.Initialize(Tabs.Main)
    aimlock.Initialize(Tabs.Main)

    Fluent:Notify({
        Title = "Fluent Loaded",
        Content = "ESP and Aimlock script has been loaded.",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()
end

local function Start()
    initializeWindow()
    setupTabs()
end

return { Start = Start }
