-- [[ SANSVIN OFFICIAL - V1.3 (MEMBER EDITION) ]] --
-- Fitur: Flexible VIP Lock + Loading Kuning + Instant Name Swap
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ SISTEM AKSES MEMBER (Dibuat Lebih Flexible)
-- ========================================================== --
local VIP_LIST = { 
    ["8catplayren"] = true,
    ["opwaressu"] = true,
    ["zaki123gg82"] = true,
    ["pemancinganhanda"] = true,
    ["wannz890"] = true,
    ["rinalbau1522"] = true,
    ["boci1261"] = true,
    ["dhkvtgqevea"] = true,
    ["mirz_4443"] = true,
    ["rosemary_616"] = true,
    ["reczz83"] = true,
    ["imroon1"] = true,
    ["pnzygod"] = true,
    ["flick_v3n0m76"] = true,
    ["ggpr320"] = true,
    ["rafa2sf"] = true,
    ["dzibaan_12"] = true,
    ["lightlord054"] = true,
    ["ohnyvell_4"] = true,
    ["bulllll45"] = true,
    ["hafri789"] = true,
    ["farel_lagee"] = true,
    ["rafa2sf_"] = true,
    ["rorwww938"] = true,
    ["upin124589"] = true,
    ["arsyamh12"] = true,
    ["escape_stunami1"] = true,
    ["rizky_ridho2013"] = true,
    ["damar474739"] = true,
    ["berondon47"] = true,
    ["vhyzu1"] = true,
    ["akunke2ku612"] = true,
    ["naga_ror"] = true,
    ["godronglibinin"] = true,
    ["nefz152"] = true,
    ["only4christy"] = true,
    ["skryfie3e"] = true,
    ["mainrobloxajayam"] = true,
    ["nadim141206"] = true,
    ["wawj615435j"] = true,
    ["alfin141006"] = true,
    ["gr33n_frost934"] = true,
    ["ridzz_192z"] = true,
    ["vinzzzzz875"] = true,
    ["erinlowery53680"] = true,
    ["a151215511515"] = true,
    ["gengdudul"] = true,
    ["zero26xmoses"] = true,
    ["kepobae_54"] = true,
    ["roblox_user_8925886113"] = true,
    ["singgelera"] = true,
    ["absyarr_xyz"] = true,
    ["clydee2828"] = true,
    ["rorr_2290"] = true,
    ["tukula56"] = true,
    ["xp_saudi"] = true,
    ["lendy_gun"] = true,
    ["gg33tarr"] = true
}

local function cekAkses()
    -- Mengubah nama player menjadi huruf kecil semua agar tidak error saat pengecekan
    local playerName = string.lower(Player.Name)
    if VIP_LIST[playerName] then 
        return true 
    end
    return false
end

-- Pengecekan Akses
if not cekAkses() then 
    Player:Kick("\n[SANSVIN OFFICIAL]\nMaaf, Nama Anda Tidak Terdaftar di List Member!\nHubungi SANSVIN untuk pendaftaran.") 
    return 
end

-- ========================================================== --
-- 2. LOADING UI (KUNING SANSVIN)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinMemberLoader"
sg.DisplayOrder = 999

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 70)
main.Position = UDim2.new(0.5, -160, 0.8, -35)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.2
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.7, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V1.3 - MEMBER"
title.TextColor3 = Color3.fromRGB(255, 230, 0) -- Kuning
title.Font = Enum.Font.FredokaOne
title.TextSize = 20

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.85, 0, 0.08, 0)
barBg.Position = UDim2.new(0.075, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 230, 0)
Instance.new("UICorner", barFill)

-- Animasi Loading
task.spawn(function()
    local tween = TweenService:Create(barFill, TweenInfo.new(2.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait() 
    
    task.wait(0.1)
    sg:Destroy()
    
    -- LOAD SCRIPT UTAMA
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
end)

-- ========================================================== --
-- 3. BRAND REPLACER (LEBIH CEPAT & SMOOTH)
-- ========================================================== --
local function fastReplace()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                
                if txt:find("escape") or txt:find("v7.5") or txt:find("fix farm") then
                    v.Text = "SANSVIN UPDATE"
                    v.TextColor3 = Color3.fromRGB(255, 230, 0)
                end
                
                if txt:find("osaka") or txt:find("galaxy") or txt:find("yt") then
                    v.Text = "SANSVIN OFFICIAL"
                    v.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            end
        end)
    end
end

task.spawn(function()
    while task.wait(0.5) do -- Jeda sedikit agar tidak lag
        fastReplace()
    end
end)
