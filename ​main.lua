-- [[ SANSVIN OFFICIAL - V1.3 (VIP ONLY EDITION) ]] --
-- Fitur: Lock VIP + Loading Kuning + Instant Name Swap
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ SISTEM LOCK VIP (37 Member Terdaftar)
-- ========================================================== --
local VIP_LIST = { 
    ["8Catplayren"] = true,
    ["OPWaressu"] = true,
    ["zaki123gg82"] = true,
    ["Pemancinganhanda"] = true,
    ["wannz890"] = true,
    ["Rinalbau1522"] = true,
    ["boci1261"] = true,
    ["dHKvTGQeVeA"] = true,
    ["mirz_4443"] = true,
    ["Rosemary_616"] = true,
    ["Reczz83"] = true,
    ["imroon1"] = true,
    ["pnzygod"] = true,
    ["Flick_v3n0m76"] = true,
    ["ggpr320"] = true,
    ["rafa2sf"] = true,
    ["Dzibaan_12"] = true,
    ["lightlord054"] = true,
    ["Ohnyvell_4"] = true,
    ["bulllll45"] = true,
    ["Hafri789"] = true,
    ["Farel_lagee"] = true,
    ["rafa2sf_"] = true,
    ["rorwww938"] = true,
    ["UPIN124589"] = true,
    ["ArsyaMH12"] = true,
    ["escape_stunami1"] = true,
    ["rizky_ridho2013"] = true,
    ["damar474739"] = true,
    ["berondon47"] = true,
    ["vhyzu1"] = true,
    ["Akunke2ku612"] = true,
    ["NAGA_ROR"] = true,
    ["Godronglibinin"] = true,
    ["Nefz152"] = true,
    ["only4christy"] = true,
    ["Skryfie3e"] = true
}

local function cekVip()
    -- Cek nama player (Case Sensitive sesuai input)
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
-- 2. LOADING UI (KUNING)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinVipLoader"
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
title.Text = "SANSVIN V1.3"
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
barFill.BackgroundColor3 = Color3.fromRGB(255, 230, 0) -- KUNING
Instance.new("UICorner", barFill)

-- Jalankan Animasi Loading Sebelum Load Script Asli
task.spawn(function()
    local tween = TweenService:Create(barFill, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait() 
    
    task.wait(0.2)
    sg:Destroy()
    
    -- LOAD SCRIPT OSAKA
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
end)

-- ========================================================== --
-- 3. INSTANT BRAND REPLACER (PENGGANTI NAMA)
-- ========================================================== --
local function fastReplace()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                
                if txt:find("escape") or txt:find("v7.5") or txt:find("fix farm") or txt:find("07/03") then
                    v.Text = "SANSVIN UPDATE"
                    v.TextColor3 = Color3.fromRGB(255, 230, 0)
                end
                
                if txt:find("osaka") or txt:find("galaxy") or txt:find("yt") then
                    v.Text = "SANSVIN OFFICIAL"
                end
            end
            
            if v:IsA("ImageLabel") and (v.Name:find("Icon") or v.Image:find("rbxassetid")) then
                v.Visible = false
            end
        end)
    end
end

task.spawn(function()
    while true do
        fastReplace()
        task.wait() 
    end
end)
