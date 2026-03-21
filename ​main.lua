-- [[ SANSVIN OFFICIAL - V2.0 PREMIUM ]] --
-- Performa Maksimal | Anti-Bypass | RAM 4GB Safe
-- Update: 21/03/2026

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR VIP (WAJIB HURUF KECIL SEMUA)
-- ========================================================== --
local VIP_LIST = { 
    -- [ OWNER ]
    ["opwaressu"] = "9999-12-31", 

    -- [ MEMBER BARU - 1 BULAN (HABIS: 21 APRIL 2026) ]
    ["ciboyy_kids"] = "2026-04-21", -- BARU DITAMBAHKAN
    ["izaaaa2504"] = "2026-04-21", ["mur8165"] = "2026-04-21", ["awerse1233"] = "2026-04-21", 
    ["xional5"] = "2026-04-21", ["kyyyonima"] = "2026-04-21", ["azhar_ilang2"] = "2026-04-21", 
    ["lukyyyy049"] = "2026-04-21", ["yanzstory6"] = "2026-04-21", ["lyyonraa"] = "2026-04-21", 
    ["faiznee"] = "2026-04-21",

    -- [ MEMBER LAMA - HITUNG MUNDUR PER 2 HARI ]
    ["menujurebirth2026"] = "2026-04-19", ["poisonkiss_0"] = "2026-04-17", ["kudaponi_231"] = "2026-04-15",
    ["rahmat135798"] = "2026-04-13", ["sempyak33"] = "2026-04-11", ["yo_gatau9"] = "2026-04-09",
    ["akskkdjsndhdh"] = "2026-04-07", ["akucantikyahh"] = "2026-04-05", ["frisco_178"] = "2026-04-03",
    ["jierrr9"] = "2026-04-01", ["ziolez82636"] = "2026-03-30", ["kingitachisusanoo"] = "2026-03-28",
    ["thevordnaigh"] = "2026-03-26", ["ahmadblabla22"] = "2026-03-24", ["sixsix66_7"] = "2026-03-22",
    
    -- [ SISANYA ]
    ["reyazza12"] = "2026-04-21", ["razstar04"] = "2026-04-21", ["thisisjejeee"] = "2026-04-21",
    ["robloxkingo9o8"] = "2026-04-21", ["skyxbar3"] = "2026-04-21", ["gg33tarr"] = "2026-04-21",
    ["lendy_gun"] = "2026-04-21", ["xp_saudi"] = "2026-04-21", ["tukula56"] = "2026-04-21",
    ["rorr_2290"] = "2026-04-21", ["clydee2828"] = "2026-04-21", ["absyarr_xyz"] = "2026-04-21",
    ["singgelera"] = "2026-04-21", ["roblox_user_8925886113"] = "2026-04-21", ["kepobae_54"] = "2026-04-21",
    ["zero26xmoses"] = "2026-04-21", ["gengdudul"] = "2026-04-21", ["a151215511515"] = "2026-04-21",
    ["erinlowery53680"] = "2026-04-21", ["vinzzzzz875"] = "2026-04-21", ["ridzz_192z"] = "2026-04-21",
    ["gr33n_frost934"] = "2026-04-21", ["alfin141006"] = "2026-04-21", ["wawj615435j"] = "2026-04-21",
    ["nadim141206"] = "2026-04-21", ["mainrobloxajayam"] = "2026-04-21", ["skryfie3e"] = "2026-04-21",
    ["only4christy"] = "2026-04-21", ["nefz152"] = "2026-04-21", ["godronglibinin"] = "2026-04-21",
    ["naga_ror"] = "2026-04-21", ["akunke2ku612"] = "2026-04-21", ["vhyzu1"] = "2026-04-21",
    ["berondon47"] = "2026-04-21", ["damar474739"] = "2026-04-21", ["rizky_ridho2013"] = "2026-04-21",
    ["escape_stunami1"] = "2026-04-21", ["arsyamh12"] = "2026-04-21", ["upin124589"] = "2026-04-21",
    ["rorwww938"] = "2026-04-21", ["rafa2sf_"] = "2026-04-21", ["farel_lagee"] = "2026-04-21",
    ["hafri789"] = "2026-04-21", ["bulllll45"] = "2026-04-21", ["ohnyvell_4"] = "2026-04-21",
    ["lightlord054"] = "2026-04-21", ["dzibaan_12"] = "2026-04-21", ["rafa2sf"] = "2026-04-21",
    ["ggpr320"] = "2026-04-21", ["flick_v3n0m76"] = "2026-04-21", ["pnzygod"] = "2026-04-21",
    ["imroon1"] = "2026-04-21", ["reczz83"] = "2026-04-21", ["rosemary_616"] = "2026-04-21",
    ["mirz_4443"] = "2026-04-21", ["dhkvtgqevea"] = "2026-04-21", ["boci1261"] = "2026-04-21",
    ["rinalbau1522"] = "2026-04-21", ["wannz890"] = "2026-04-21", ["pemancinganhanda"] = "2026-04-21",
    ["zaki123gg82"] = "2026-04-21", ["8catplayren"] = "2026-04-21"
}

-- [ SISTEM FUNGSI ] --
local function getVIPStatus()
    local name = string.lower(Player.Name):gsub("%s+", "")
    local expStr = VIP_LIST[name]
    if not expStr then return false, "TIDAK TERDAFTAR" end
    if expStr == "9999-12-31" then return true, "STATUS: PERMANENT" end
    local y, m, d = expStr:match("(%d+)-(%d+)-(%d+)")
    local diff = os.time({year=y, month=m, day=d, hour=23, min=59, sec=59}) - os.time()
    if diff <= 0 then return false, "MASA AKTIF HABIS" end
    local days = math.floor(diff / 86400)
    local hours = math.floor((diff % 86400) / 3600)
    local mins = math.floor((diff % 3600) / 60)
    local secs = diff % 60
    return true, string.format("AKTIF: %dD %02d:%02d:%02d", days, hours, mins, secs)
end

local function ShowLockAndKick()
    if CoreGui:FindFirstChild("SANSVIN_LOCK") then return end
    local sg = Instance.new("ScreenGui", CoreGui)
    sg.Name = "SANSVIN_LOCK"
    sg.IgnoreGuiInset, sg.DisplayOrder = true, 9999
    local f = Instance.new("Frame", sg)
    f.Size, f.BackgroundColor3, f.BackgroundTransparency = UDim2.new(1,0,1,0), Color3.new(0,0,0), 0.3
    local t = Instance.new("TextLabel", f)
    t.Size, t.Position, t.BackgroundTransparency = UDim2.new(0.8,0,0.4,0), UDim2.new(0.1,0,0.3,0), 1
    t.Text = "SANSVIN OFFICIAL\n\nSTATUS VIP ANDA SUDAH HABIS.\nSILAHKAN HUBUNGI OWNER UNTUK PERPANJANG."
    t.TextColor3, t.TextSize, t.Font, t.TextWrapped = Color3.new(1,1,1), 22, "GothamBold", true
    task.wait(3)
    Player:Kick("\n[ SANSVIN ]\nMASA AKTIF VIP HABIS!")
end

local function StartLoading()
    local sg = Instance.new("ScreenGui", Player.PlayerGui)
    sg.Name = "SansvinLoader"
    local main = Instance.new("Frame", sg)
    main.Size, main.Position, main.BackgroundColor3 = UDim2.new(0, 320, 0, 75), UDim2.new(0.5, -160, 0.82, 0), Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", main)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color, stroke.Thickness = Color3.fromRGB(255, 230, 0), 2
    local title = Instance.new("TextLabel", main)
    title.Size, title.BackgroundTransparency, title.Text, title.TextColor3, title.Font, title.TextSize = UDim2.new(1, 0, 0.6, 0), 1, "SANSVIN V2.0 - PREMIUM", Color3.fromRGB(255, 230, 0), "GothamBold", 18
    local barBg = Instance.new("Frame", main)
    barBg.Size, barBg.Position, barBg.BackgroundColor3 = UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, 0.75, 0), Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", barBg)
    local barFill = Instance.new("Frame", barBg)
    barFill.Size, barFill.BackgroundColor3 = UDim2.new(0, 0, 1, 0), Color3.fromRGB(255, 230, 0)
    Instance.new("UICorner", barFill)
    local t = TweenService:Create(barFill, TweenInfo.new(2.5), {Size = UDim2.new(1, 0, 1, 0)})
    t:Play()
    t.Completed:Wait()
    task.wait(0.3)
    sg:Destroy()
end

task.spawn(function()
    while task.wait(1) do
        local ok, liveTime = getVIPStatus()
        if not ok then ShowLockAndKick() break end
        for _, v in ipairs(CoreGui:GetDescendants()) do
            pcall(function()
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local t = v.Text:lower()
                    if t:find("osaka") or t:find("escape tsunami") or t:find("brainrots") or t:find("v7.6") then
                        v.Text = "SANSVIN OFFICIAL - V2.0"
                    elseif t:find("notification") or t:find("aktif:") or t:find("status:") or v.Text:find("07:00") then
                        v.Text = "SANSVIN OFFICIAL | " .. liveTime
                    elseif t:find("add stpatrick") or t:find("17/03") or t:find("18/03") or t:find("fix small") then
                        v.Text = "⭐ SANSVIN UPDATED | 21/03/2026 ⭐"
                        v.TextColor3 = Color3.fromRGB(255, 230, 0)
                    end
                end
            end)
        end
    end
end)

local canRun, msg = getVIPStatus()
if canRun then
    StartLoading()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
else
    Player:Kick("\n[ SANSVIN ]\n" .. msg)
end
