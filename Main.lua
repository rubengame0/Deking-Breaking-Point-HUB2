repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local hmr = plr.Character:FindFirstChild("HumanoidRootPart")
local PlayerGUI = plr:FindFirstChildOfClass("PlayerGui")

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "KingHubV2 - Blox Fruits But Very Good", HidePremium = false, SaveConfig = true, ConfigFolder = "KingHubV2ot"})

-- Valores iniciales
_G.selectedFruit = "Dragon (East) Fruit"
_G.Mas = 1000 -- Valor predeterminado para el Slider.

-- Función para enviar remotamente la fruta seleccionada
local function fireRemote(fruitName)
    local args
    if fruitName == "Dragon (East) Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Dragon (East) Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Dragon (West) Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Dragon (West) Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Spirit Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Spirit Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Dough Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Dough Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Barrier Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Barrier Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Control Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Control Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Kitsune Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Kitsune Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    elseif fruitName == "Leopard Fruit" then
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Leopard Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    else
        args = {
            [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
            [2] = "AddToolToBackpackKKK",
            [3] = {
                [1] = "Hito Fruit",
                [2] = game:GetService("Players").LocalPlayer.Backpack,
                [3] = true,
                [4] = true
            }
        }
    end
    game:GetService("ReplicatedStorage").ALLREMBINDS.MainRemoteEvent:FireServer(unpack(args))
end

-- Creación de tabs
local FruitTab = Window:MakeTab({
    Name = "Fruit Givens",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local FarmTab = Window:MakeTab({
    Name = "AutoFarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CreditTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Configuración del Dropdown
FruitTab:AddDropdown({
    Name = "Select Fruit",
    Default = "Dragon (East) Fruit",
    Options = {"Dragon (East) Fruit", "Dragon (West) Fruit", "Spirit Fruit", "Dough Fruit", "Hito Fruit", "Barrier Fruit", "Control Fruit", "Kitsune Fruit", "Leopard Fruit"},
    Callback = function(Value)
        _G.selectedFruit = Value
    end    
})

-- Botones para las frutas
FruitTab:AddButton({
    Name = "Redeem Selected Fruit",
    Callback = function()
        fireRemote(_G.selectedFruit)
    end    
})

-- Funcionalidad AutoFarm
FarmTab:AddButton({
    Name = "Collect All Chest",
    Callback = function()
        for _, v in ipairs(Workspace.World.Chests:GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                firetouchinterest(plr.Character.HumanoidRootPart, v, 0)
                wait(1)
                firetouchinterest(plr.Character.HumanoidRootPart, v, 1)
            end
        end
    end    
})

-- Créditos
CreditTab:AddButton({
    Name = "By: MrBirux",
    Callback = function()
        print("KingHubV2 - Blox Fruits But Very Good")
    end    
})

CreditTab:AddButton({
    Name = "Join Of Discord Click For Copy Link",
    Callback = function()
        setclipboard("https://discord.gg/f2QuqGXeAT")
    end    
})

-- Slider para Mastery
FarmTab:AddSlider({
    Name = "Select For Custom Mastery",
    Min = 0,
    Max = 100000,
    Default = 1000,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Custom Mastery",
    Callback = function(Value)
        _G.Mas = Value
    end    
})

-- Toggle para activar Mastery
FarmTab:AddToggle({
    Name = "Add Mastery",
    Default = false,
    Callback = function(Value)
        if Value then
            local args = {
                [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
                [2] = "GiveMasteryEXPTO__Smthh",
                [3] = {
                    [1] = plr,
                    [2] = plr.PlayerStats.UsingBloxFruit.Value,
                    [3] = _G.Mas,
                    [4] = true
                }
            }
            game:GetService("ReplicatedStorage").ALLREMBINDS.MainRemoteEvent:FireServer(unpack(args))
        end
    end
})

-- Inicializar OrionLib
OrionLib:Init()
