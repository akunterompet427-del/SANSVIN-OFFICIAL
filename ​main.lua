-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE EDITION) ]] --
-- Update: Instant Version Overwrite & UI Deep Clean
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ VALIDASI VIP
-- ========================================================== --
local VIP_LIST = { 
    ["8Catplayren"] = true, ["aditya12377799999"] = true, ["ahmadblabla22"] = true,
    ["ajri_133"] = true, ["AldoTT8"] = true, ["Alfin141006"] = true,
    ["alwx_087"] = true, ["ANTISIGMA63"] = true, ["anyong605"] = true,
    ["ArsyaMH12"] = true, ["bangkileRBX3"] = true, ["bapak_tobrut"] = true,
    ["barumain031"] = true, ["belacan_28"] = true, ["bulllll45"] = true,
    ["Cecepcicip0"] = true, ["d4f_493"] = true, ["Dave937373"] = true,
    ["dHKvTGQeVeA"] = true, ["Dit9982"] = true, ["Dzibaan_12"] = true,
    ["escape_stunami1"] = true, ["Evade6570"] = true, ["EZ_ABRA"] = true,
    ["Farel_lagee"] = true, ["flick_v3n0m76"] = true, ["ggpr320"] = true,
    ["gr33n_frost"] = true, ["gr33n_frost934"] = true, ["Gregno22"] = true,
    ["HachieAlexandra"] = true, ["Ilhamkwt"] = true, ["imroon1"] = true,
    ["kacang234560"] = true, ["Kingitachisusanoo"] = true, ["kulzz_btk33"] = true,
    ["legendaotot999"] = true, ["lemang1933"] = true, ["Lepios_t"] = true,
    ["lightlord054"] = true, ["Liokillua2"] = true, ["MALIKA12346361"] = true,
    ["mboh3416"] = true, ["mirz_4443"] = true, ["Mrshazelsilver67"] = true,
    ["Ohmyvell_4"] = true, ["OPWaressu"] = true, ["Pemancinganhanda"] = true,
    ["rafa2sf"] = true, ["rafa2sf bg"] = true, ["RAPANBD2"] = true,
    ["raxzzz123"] = true, ["Reczz83"] = true, ["reyyz_199"] = true,
    ["Rinalbau1522"] = true, ["rizky_ridho2013"] = true, ["Rosemary_616"] = true,
    ["ryzz_sja"] = true, ["secretttt_talonnnn"] = true, ["sep_ironman"] = true,
    ["thetrikis"] = true, ["wannz890"] = true, ["xybcaa203"] = true,
    ["xyzdekz"] = true, ["Xzzz1139"] = true, ["yama12160102"] = true,
    ["ZAHAH005"] = true, ["zaki123gg82"] = true, ["Zero26xMoses"] = true
}

if not VIP_LIST[Player.Name] then Player:Kick("\n[SANSVIN]\nAkses Ditolak!") return end

-- ========================================================== --
-- 2. LOADING UI MINIMALIS (Sesuai Gambar)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinLoader"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0, 50)
main.Position = UDim2.new(0.5, -120, 0.9, -55)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BackgroundTransparency = 0.2
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.6, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN OFFICIAL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 14

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.8, 0, 0.08, 0)
barBg.Position = UDim2.new(0.1, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", barFill)

task.spawn(function()
    local h = 0
    task.spawn(function()
        while sg.Parent do
            local color = Color3.fromHSV(h, 0.7, 1)
            stroke.Color = color
            title.TextColor3 = color
            barFill.BackgroundColor3 = color
            h = (h + 0.01) % 1; task.wait()
        end
    end)
    TweenService:Create(barFill, TweenInfo.new(2.5), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3); sg:Destroy()
end)

-- ========================================================== --
-- 3. INSTANT CLEAN REPLACER (Fix New Update & Owner Text)
-- ========================================================== --
local function deepCleanUI()
    -- Daftar kata-kata yang HARUS diganti
    local replacements = {
        ["new update 7.5"] = "SANSVIN Update v1.3",
        ["update 7.5"] = "SANSVIN Update v1.3",
        ["osaka"] = "SANSVIN OFFICIAL",
        ["galaxy"] = "SANSVIN OFFICIAL",
        ["fix farm"] = "SANSVIN OFFICIAL",
        ["fix trial"] = "SANSVIN OFFICIAL",
        ["fix fire ice"] = "SANSVIN OFFICIAL"
    }

    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                for original, replacement in pairs(replacements) do
                    if string.find(txt, original) then
                        v.Text = replacement
                        v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 0.8, 1) -- Rainbow Sync
                    end
                end
            end
            -- Sembunyikan Logo Pemilik Asli
            if v:IsA("ImageLabel") and (v.Name:find("Star") or v.Name:find("Icon")) then
                v.ImageTransparency = 1 
            end
        end)
    end
end

-- Eksekusi Script
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- Loop pengecekan super cepat (0.1s)
task.spawn(function()
    while true do
        deepCleanUI()
        task.wait(0.1)
    end
end)
