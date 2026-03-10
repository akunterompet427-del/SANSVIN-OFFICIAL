-- [[ SANSVIN OFFICIAL - V1.3 (VIP ONLY EDITION) ]] --
-- Fitur: Lock VIP + Loading Kuning + Instant Name Swap
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ SISTEM LOCK VIP (Hanya Nama Ini Yang Bisa Akses)
-- ========================================================== --
local VIP_LIST = { 
    ["OPWaressu"] = true -- Nama VIP utama kamu
}

local function cekVip()
    -- Cek nama player (tidak peduli huruf besar/kecil)
    if VIP_LIST[Player.Name] then 
        return true 
    end
    return false
end

-- Jika bukan VIP, langsung Kick!
if not cekVip() then 
    Player:Kick("\n[SANSVIN OFFICIAL]\nMaaf, Script Ini Hanya Untuk Member VIP!\nHubungi SANSVIN untuk akses.") 
    return 
end

-- ========================================================== --
-- 2. LOADING UI (PERSIS GAMBAR 1000054108.jpg)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinVipLoader"
sg.DisplayOrder = 999

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 70)
main.Position = UDim2.new(0.5, -160, 0.8, -35)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.2 -- Efek transparan seperti di gambar
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.7, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V1.3" -- Branding SANSVIN
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 22

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.85, 0, 0.08, 0)
barBg.Position = UDim2.new(0.075, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 230, 0) -- Warna KUNING sesuai gambar
Instance.new("UICorner", barFill)

-- Jalankan Animasi Loading Sebelum Load Script Asli
task.spawn(function()
    local tween = TweenService:Create(barFill, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait() -- Tunggu loading bar kuning penuh
    
    task.wait(0.2)
    sg:Destroy()
    
    -- LOAD SCRIPT SETELAH LOADING BERES
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
end)

-- ========================================================== --
-- 3. INSTANT BRAND REPLACER (ANTI BOCOR)
-- ========================================================== --
local function fastReplace()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                
                -- Target area lingkaran merah & update log
                if txt:find("escape") or txt:find("v7.5") or txt:find("fix farm") or txt:find("07/03") then
                    v.Text = "SANSVIN UPDATE"
                    v.TextColor3 = Color3.fromRGB(255, 230, 0) -- Teks warna kuning biar matching
                end
                
                -- Ganti nama Osaka/Galaxy
                if txt:find("osaka") or txt:find("galaxy") or txt:find("yt") then
                    v.Text = "SANSVIN OFFICIAL"
                end
            end
            
            -- Hapus gambar pisang & ikon setting
            if v:IsA("ImageLabel") and (v.Name:find("Icon") or v.Image:find("rbxassetid")) then
                v.Visible = false
            end
        end)
    end
end

-- Loop Tanpa Delay (Instan Tempel)
task.spawn(function()
    while true do
        fastReplace()
        task.wait() 
    end
end)
