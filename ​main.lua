-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE PC/MOBILE OPTIMIZATION) ]] --
-- Update: Tambah zaki123gg82 | Welcome Message | Brand Replacer Optimized
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR MEMBER VIP (SUSUNAN ABJAD A-Z)
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

-- ========================================================== --
-- 1. SISTEM KEAMANAN & WELCOME MESSAGE
-- ========================================================== --
local function cekVip()
    local namaKecil = string.lower(Player.Name)
    for vNama, _ in pairs(VIP_LIST) do
        if string.lower(vNama) == namaKecil then
            return true
        end
    end
    return false
end

if not cekVip() then
    Player:Kick("\n[SANSVIN]\nAkses Ditolak!\nNama: " .. Player.Name .. " belum terdaftar.")
    return
else
    -- Mengirim pesan ke ChatBox saat berhasil masuk
    task.spawn(function()
        task.wait(1)
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[SANSVIN] Welcome, " .. Player.Name .. "! Script V1.3 Activated.",
            Color = Color3.fromRGB(0, 255, 127),
            Font = Enum.Font.SourceSansBold,
            FontSize = Enum.FontSize.Size24
        })
    end)
end

-- ========================================================== --
-- 2. LOADING SCREEN SANSVIN (RAINBOW UI)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinUI"

local mf = Instance.new("Frame", sg)
mf.Size = UDim2.new(0, 300, 0, 100)
mf.Position = UDim2.new(0.5, -150, 0.5, -50)
mf.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mf.BorderSizePixel = 0
local corner = Instance.new("UICorner", mf)
corner.CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", mf)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local t = Instance.new("TextLabel", mf)
t.Size = UDim2.new(1, 0, 1, 0)
t.Text = "SANSVIN V1.3"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.TextSize = 35
t.Font = Enum.Font.FredokaOne
t.BackgroundTransparency = 1

task.spawn(function()
    local h = 0
    while sg.Parent do
        local color = Color3.fromHSV(h, 0.7, 1)
        t.TextColor3 = color
        stroke.Color = color
        h = (h + 0.002) % 1
        task.wait()
    end
end)

task.wait(3.5)
sg:Destroy()

-- ========================================================== --
-- 3. JALANKAN SKRIP UTAMA (LOADSTRING)
-- ========================================================== --
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- ========================================================== --
-- 4. MESIN PENGGANTI BRAND (ULTRA LIGHTWEIGHT)
-- ========================================================== --
task.spawn(function()
    local kataKunci = {"Osaka", "Galaxy", "v7.3", "v8.51"}
    while task.wait(1) do 
        pcall(function()
            for _, v in ipairs(CoreGui:GetDescendants()) do
                -- Ganti Nama Brand pada Teks
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    for _, kata in ipairs(kataKunci) do
                        if string.find(v.Text, kata) then
                            v.Text = "SANSVIN V1.3"
                            v.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
                        end
                    end
                end
                -- Sembunyikan Logo Brand Lama
                if v:IsA("ImageLabel") and v.Visible then
                    local size = v.AbsoluteSize
                    if size.X > 30 and size.X < 100 and not v.Name:find("Icon") then
                        v.ImageTransparency = 1
                        v.Visible = false
                    end
                end
            end
        end)
    end
end)
