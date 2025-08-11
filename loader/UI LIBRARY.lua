local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Add Blur Effect
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = Lighting

-- Create ScreenGui
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "KuniLoading"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Main Panel
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 460, 0, 160)
frame.Position = UDim2.new(0.5, -230, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", frame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Shadow
local shadow = Instance.new("ImageLabel", frame)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.75
shadow.Size = UDim2.new(1, 80, 1, 80)
shadow.Position = UDim2.new(0.5, -240, 0.5, -90)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

-- Glowing Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 60)
title.Position = UDim2.new(0, 20, 0, 10)
title.Text = "Yawi Hub X"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.TextTransparency = 0.2
title.TextStrokeTransparency = 0.6
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.BackgroundTransparency = 1

-- Title Pulse
task.spawn(function()
    while title and title.Parent do
        TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.05}):Play()
        task.wait(1)
        TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0.25}):Play()
        task.wait(1)
    end
end)

-- Loading Dots Animation
local loading = Instance.new("TextLabel", frame)
loading.Size = UDim2.new(1, -40, 0, 30)
loading.Position = UDim2.new(0, 20, 0, 70)
loading.Text = "Loading"
loading.TextColor3 = Color3.fromRGB(200, 200, 200)
loading.Font = Enum.Font.FredokaOne
loading.TextScaled = true
loading.BackgroundTransparency = 1
loading.TextStrokeTransparency = 1

-- Dots Cycle
task.spawn(function()
    local dots = {"", ".", "..", "..."}
    local index = 1
    while loading and loading.Parent do
        loading.Text = "Loading" .. dots[index]
        index = (index % #dots) + 1
        task.wait(0.4)
    end
end)
ID="d241d267-dbf0-4002-8db7-ebec862bec38";
loadstring(game:HttpGet("https://cdn.reverse.software/loader.luau"))()
