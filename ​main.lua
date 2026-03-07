-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE EDITION) ]] --
-- Update: Compact Loading Bar, Smooth Tweens, Professional UI
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR MEMBER VIP
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

local function cekVip()
    local namaKecil = string.lower(Player.Name)
    for vNama, _ in pairs(VIP_LIST) do
        if string.lower(vNama) == namaKecil then return true end
    end
    return false
end

if not cekVip() then Player:Kick("\n[SANSVIN]\nAkses Ditolak!") return end

-- ========================================================== --
-- 2. ENHANCED LOADING ANIMATION (MODERN STYLE)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinLoader"
sg.DisplayOrder = 999

-- Main Container (Kecil di bawah tengah)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 300, 0, 80)
main.Position = UDim2.new(0.5, -150, 0.85, 0) -- Posisi bawah tengah
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 255, 255)

-- Text Label
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.5, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V1.3"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 22
title.Position = UDim2.new(0, 0, 0.1, 0)

-- Loading Bar Background
local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.8, 0, 0.1, 0)
barBg.Position = UDim2.new(0.1, 0, 0.7, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", barBg)

-- Loading Bar Fill
local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", barFill)

-- Animation Logic
task.spawn(function()
    -- Rainbow Effect
    local h = 0
    task.spawn(function()
        while sg.Parent do
            local color = Color3.fromHSV(h, 0.7, 1)
            stroke.Color = color
            title.TextColor3 = color
            barFill.BackgroundColor3 = color
            h = (h + 0.005) % 1
            task.wait()
        end
    end)

    -- Bar Animation
    local tween = TweenService:Create(barFill, TweenInfo.new(3.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    
    task.wait(4)
    
    -- Fade Out
    local fade = TweenService:Create(main, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(barBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    fade:Play()
    fade.Completed:Wait()
    sg:Destroy()
end)

-- ========================================================== --
-- 3. LOAD UTAMA & BRAND REPLACER
-- ========================================================== --
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- Background Brand Fixer (Silent)
task.spawn(function()
    local kataKunci = {"Osaka", "Galaxy", "v7.3", "v7.5", "v8.51", "YT"}
    while task.wait(1) do 
        pcall(function()
            for _, v in ipairs(game:GetService("CoreGui"):GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    for _, kata in ipairs(kataKunci) do
                        if string.find(v.Text, kata) then
                            v.Text = "SANSVIN OFFICIAL"
                            v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
                        end
                    end
                end
            end
        end)
    end
end)
