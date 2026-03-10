-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE EDITION) ]] --
-- Perbaikan: Sinkronisasi Loading & Multi-Game Support
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

-- ========================================================== --
-- ⚙️ DAFTAR MEMBER VIP
-- ========================================================== --
local VIP_LIST = { 
    ["OPWaressu"] = true
}

local function cekVip()
    local namaKecil = string.lower(Player.Name)
    for vNama, _ in pairs(VIP_LIST) do
        if string.lower(vNama) == namaKecil then return true end
    end
    return false
end

if not cekVip() then Player:Kick("\n[SANSVIN]\nAkses Ditolak! Anda bukan member VIP.") return end

-- ========================================================== --
-- ⚙️ DATABASE GAME SANSVIN (Otomatis Deteksi Game)
-- ========================================================== --
local SANSVIN_DATABASE = {
    -- Masukkan GameID dan Link Skrip di sini
    [15502339080] = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5",
}

-- ========================================================== --
-- 2. MODERN COMPACT LOADING (RAINBOW)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinMiniLoader"
sg.DisplayOrder = 9999

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 60)
main.Position = UDim2.new(0.5, -130, 0.9, -70)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BackgroundTransparency = 0.3
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 1.5

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.6, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V1.3 OFFICIAL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 18

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.8, 0, 0.08, 0)
barBg.Position = UDim2.new(0.1, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", barFill)

task.spawn(function()
    local h = 0
    while sg.Parent do
        local color = Color3.fromHSV(h, 0.7, 1)
        stroke.Color = color
        title.TextColor3 = color
        barFill.BackgroundColor3 = color
        h = (h + 0.01) % 1
        task.wait()
    end
end)

task.spawn(function()
    local tween = TweenService:Create(barFill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait()
    sg:Destroy()
    
    local ScriptURL = SANSVIN_DATABASE[game.GameId] or SANSVIN_DATABASE[game.PlaceId]
    
    if ScriptURL then
        loadstring(game:HttpGet(ScriptURL))()
    else
        warn("SANSVIN: Game ini belum ada di database.")
    end
end)

-- ========================================================== --
-- 3. INSTANT BRAND REPLACER (Auto-SANSVIN)
-- ========================================================== --
local function fastReplace()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                if txt:find("escape") or txt:find("v7.5") or txt:find("fix farm") then
                    v.Text = "SANSVIN UPDATE"
                end
                if txt:find("osaka") or txt:find("galaxy") or txt:find("speed hub") then
                    v.Text = "SANSVIN OFFICIAL"
                end
            end
        end)
    end
end

task.spawn(function()
    while true do
        fastReplace()
        task.wait(1) 
    end
end)
