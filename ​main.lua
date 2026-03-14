-- [[ SANSVIN OFFICIAL - V1.3 (MEMBER EDITION) ]] --
-- Fitur: VIP Lock + Trim Fix + Loading Kuning + Name Swap
-- Author: SANSVIN Team (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR MEMBER VIP (VIP LIST)
-- ========================================================== --
local VIP_LIST = { 
    ["8catplayren"] = true, ["opwaressu"] = true, ["zaki123gg82"] = true,
    ["pemancinganhanda"] = true, ["wannz890"] = true, ["rinalbau1522"] = true,
    ["boci1261"] = true, ["dhkvtgqevea"] = true, ["mirz_4443"] = true,
    ["rosemary_616"] = true, ["reczz83"] = true, ["imroon1"] = true,
    ["pnzygod"] = true, ["flick_v3n0m76"] = true, ["ggpr320"] = true,
    ["rafa2sf"] = true, ["dzibaan_12"] = true, ["lightlord054"] = true,
    ["ohnyvell_4"] = true, ["bulllll45"] = true, ["hafri789"] = true,
    ["farel_lagee"] = true, ["rafa2sf_"] = true, ["rorwww938"] = true,
    ["upin124589"] = true, ["arsyamh12"] = true, ["escape_stunami1"] = true,
    ["rizky_ridho2013"] = true, ["damar474739"] = true, ["berondon47"] = true,
    ["vhyzu1"] = true, ["akunke2ku612"] = true, ["naga_ror"] = true,
    ["godronglibinin"] = true, ["nefz152"] = true, ["only4christy"] = true,
    ["skryfie3e"] = true, ["mainrobloxajayam"] = true, ["nadim141206"] = true,
    ["wawj615435j"] = true, ["alfin141006"] = true, ["gr33n_frost934"] = true,
    ["ridzz_192z"] = true, ["vinzzzzz875"] = true, ["erinlowery53680"] = true,
    ["a151215511515"] = true, ["gengdudul"] = true, ["zero26xmoses"] = true,
    ["kepobae_54"] = true, ["roblox_user_8925886113"] = true, ["singgelera"] = true,
    ["absyarr_xyz"] = true, ["clydee2828"] = true, ["rorr_2290"] = true,
    ["tukula56"] = true, ["xp_saudi"] = true, ["lendy_gun"] = true, ["gg33tarr"] = true,
    ["skyxbar3"] = true, ["robloxkingo9o8"] = true, ["thisisjejeee"] = true,
    ["razstar04"] = true
}

-- Fungsi cek akses dengan pembersihan nama (Anti-Error)
local function cekAkses()
    local name = string.lower(Player.Name):gsub("%s+", "") 
    return VIP_LIST[name] or false
end

-- Eksekusi Kick jika tidak terdaftar
if not cekAkses() then 
    Player:Kick("\n[SANSVIN OFFICIAL]\nUsername: " .. Player.Name .. "\nStatus: TIDAK TERDAFTAR!\nHubungi SANSVIN untuk akses VIP.") 
    return 
end

-- ========================================================== --
-- 🎨 LOADING UI (KUNING SANSVIN)
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinLoader"
sg.DisplayOrder = 999

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 75)
main.Position = UDim2.new(0.5, -160, 0.85, -37)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BackgroundTransparency = 0.1
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.6, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V1.3 - MEMBER"
title.TextColor3 = Color3.fromRGB(255, 230, 0)
title.Font = Enum.Font.FredokaOne
title.TextSize = 18

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.9, 0, 0.1, 0)
barBg.Position = UDim2.new(0.05, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 230, 0)
Instance.new("UICorner", barFill)

-- Animasi Loading & Fetch Script
task.spawn(function()
    TweenService:Create(barFill, TweenInfo.new(2, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(2.2)
    sg:Destroy()
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
    if not success then warn("SANSVIN ERROR: " .. err) end
end)

-- ========================================================== --
-- 🏷️ AUTO BRAND REPLACER (BACKGROUND TASK)
-- ========================================================== --
task.spawn(function()
    while task.wait(0.7) do
        for _, v in ipairs(CoreGui:GetDescendants()) do
            pcall(function()
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local t = v.Text:lower()
                    if t:find("escape") or t:find("v7.5") or t:find("fix farm") then
                        v.Text = "SANSVIN UPDATE"
                        v.TextColor3 = Color3.fromRGB(255, 230, 0)
                    elseif t:find("osaka") or t:find("galaxy") or t:find("yt") then
                        v.Text = "SANSVIN OFFICIAL"
                        v.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
            end)
        end
    end
end)
