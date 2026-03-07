-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE FIX) ]] --
-- Perbaikan: Efek Loading + Pembersihan Header & Update Log
-- Author: SANSVIN (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- 1. VALIDASI VIP
local VIP_LIST = { ["8Catplayren"] = true, ["OPWaressu"] = true, ["zaki123gg82"] = true, ["Pemancinganhanda"] = true }
if not VIP_LIST[Player.Name] then Player:Kick("Akses SANSVIN Ditolak!") return end

-- 2. KEMBALIKAN EFEK LOADING YANG CAKEP
local function showLoading()
    local sg = Instance.new("ScreenGui", Player.PlayerGui)
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 240, 0, 50)
    main.Position = UDim2.new(0.5, -120, 0.9, -55)
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", main)
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.Text = "SANSVIN OFFICIAL"
    title.Font = Enum.Font.FredokaOne
    title.BackgroundTransparency = 1
    
    local barBg = Instance.new("Frame", main)
    barBg.Size = UDim2.new(0.8, 0, 0.1, 0)
    barBg.Position = UDim2.new(0.1, 0, 0.7, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0)

    -- Efek Pelangi & Animasi
    task.spawn(function()
        local h = 0
        for i = 1, 100 do
            local color = Color3.fromHSV(h, 0.7, 1)
            title.TextColor3 = color
            barFill.BackgroundColor3 = color
            barFill.Size = UDim2.new(i/100, 0, 1, 0)
            h = (h + 0.01) % 1
            task.wait(0.02)
        end
        task.wait(0.5)
        sg:Destroy()
    end)
end
showLoading()

-- 3. PEMBERSIH TOTAL (Target Lingkaran Merah & Update Log)
local function finalClean()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                
                -- Hapus area header (Escape tsunami, v7.5, dll)
                if txt:find("escape") or txt:find("brainrots") or txt:find("v7.5") then
                    v.Text = "SANSVIN UPDATE"
                end
                
                -- Hapus log update yang kamu lingkari di gambar terbaru
                if txt:find("fix farm") or txt:find("fix trial") or txt:find("07/03") then
                    v.Text = "SANSVIN OFFICIAL" -- Mengganti teks yang dilingkari merah
                end
                
                -- Ganti branding Osaka/Galaxy
                if txt:find("osaka") or txt:find("galaxy") then
                    v.Text = "SANSVIN OFFICIAL"
                end
            end
            
            -- Sembunyikan Ikon Pisang & Logo Asli
            if v:IsA("ImageLabel") and (v.Image:find("rbxassetid") or v.Name:find("Icon")) then
                v.Visible = false
            end
        end)
    end
end

-- Load Script Asli
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- Jalankan pembersihan secara rutin
task.spawn(function()
    while true do
        finalClean()
        task.wait(0.2)
    end
end)
