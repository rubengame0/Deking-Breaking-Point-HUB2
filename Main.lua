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

-- Value
_G.selectedFruit = "Dragon (East) Fruit"
_G.Mas = 1000 -- Valor predeterminado para el Slider.

-- Functions
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

-- Tab
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

-- DropDown
FruitTab:AddDropdown({
		Name = "Select Fruit",
		Default = "Dragon (East) Fruit",
		Options = {"Dragon (East) Fruit", "Dragon (West) Fruit", "Spirit Fruit", "Dough Fruit", "Hito Fruit"},
		Callback = function(Value)
				_G.selectedFruit = Value
		end    
})

-- Button
FruitTab:AddButton({
		Name = "Redeem Selected Fruit",
		Callback = function()
				fireRemote(_G.selectedFruit)
		end    
})

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

--Slider
FarmTab:AddSlider({
	Name = "Select For Custom Mastery",
	Min = 0,
	Max = 100000,
	Default = 1000,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Custom Mastery",
	Callback = function(Value)
		_G.Mas = Value -- Corrige "value" por "Value".
	end    
})

-- Toggles
FarmTab:AddToggle({
	Name = "Add Mastery",
	Default = false,
	Callback = function(Value)
		if Value then -- Activa solo si el toggle está encendido.
			local args = {
				[1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
				[2] = "GiveMasteryEXPTO__Smthh",
				[3] = {
					[1] = plr,
					[2] = plr.PlayerStats.UsingBloxFruit.Value,
					[3] = _G.Mas, -- Utiliza el valor asignado desde el slider.
					[4] = true
				}
			}
			game:GetService("ReplicatedStorage"):WaitForChild("ALLREMBINDS"):WaitForChild("MainRemoteEvent"):FireServer(unpack(args))
		end
	end
})

OrionLib:Init()
