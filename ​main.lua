-- [[ SANSVIN OFFICIAL - V2.0 ]] --
-- Fitur: Lightning Loading + Ultra Clean Menu + Performa Maksimal
-- Update: 18/03/2026

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR VIP (SANSVIN) - Updated: yo_gatau9 REMOVED
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
    ["razstar04"] = true, ["reyazza12"] = true, ["sixsix66_7"] = true,
    ["ahmadblabla22"] = true, ["thevordnaigh"] = true, ["kingitachisusanoo"] = true,
    ["ziolez82636"] = true, ["jierrr9"] = true, ["frisco_178"] = true,
    ["akucantikyahh"] = true
}

local function isVIP()
    local name = string.lower(Player.Name):gsub("%s+", "")
    return VIP_LIST[name] ~= nil
end

if not isVIP() then 
    Player:Kick("\n[SANSVIN OFFICIAL]\nStatus: AKSES DITOLAK!\nUsername tidak terdaftar di VIP.") 
    return 
end

-- ========================================================== --
-- ⚡ LOADING SCREEN
-- ========================================================== --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinLoader"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 75)
main.Position = UDim2.new(0.5, -160, 0.82, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", main)
Instance.new("UIStroke", main).Color = Color3.fromRGB(255, 230, 0)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.6, 0)
title.BackgroundTransparency = 1
title.Text = "SANSVIN V2.0 - PREMIUM"
title.TextColor3 = Color3.fromRGB(255, 230, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.9, 0, 0.08, 0)
barBg.Position = UDim2.new(0.05, 0, 0.75, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 230, 0)
Instance.new("UICorner", barFill)

task.spawn(function()
    local t = TweenService:Create(barFill, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 1, 0)})
    t:Play()
    t.Completed:Wait()
    task.wait(0.3)
    sg:Destroy()
    
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
end)

-- ========================================================== --
-- 🏷️ AUTO BRAND REPLACER
-- ========================================================== --
task.spawn(function()
    while task.wait(0.5) do
        for _, v in ipairs(CoreGui:GetDescendants()) do
            pcall(function()
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local t = v.Text:lower()
                    
                    if t:find("osaka") or t:find("escape tsunami") or t:find("brainrots") then
                        v.Text = "SANSVIN OFFICIAL - V2.0"
                    end
                    
                    if t:find("new update 7.6") then
                        v.Text = "SANSVIN UPDATE V2.0"
                    end

                    if t:find("add stpatrick") or t:find("17/03/2026") or t:find("18/03/2026") then
                        v.Text = "SANSVIN Update " .. os.date("%d/%m/%Y")
                        v.TextColor3 = Color3.fromRGB(255, 230, 0)
                    end
                    
                    if v.Text == "🍌" or t:find("notification") then
                        v.Text = v.Text:gsub("🍌", "")
                        if v.Text == "" then v.Visible = false end
                    end
                end
            end)
        end
    end
end)
