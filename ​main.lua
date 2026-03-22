-- [[ SANSVIN OFFICIAL - V2.0 PREMIUM ]] --
-- Update Terakhir: 22/03/2026 | Status: Ultra-Lightweight Optimized ✅

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR VIP (DATABASE MEMBER)
-- ========================================================== --
local VIP_LIST = { 
    ["opwaressu"] = "9999-12-31", 
    ["naga_ror"] = "2026-04-22",
    ["zero26xmoses"] = "2026-04-21", ["rinalbau1522"] = "2026-04-21", ["rendhspotify"] = "2026-04-21", 
    ["ciboyy_kids"] = "2026-04-21", ["izaaaa2504"] = "2026-04-21", ["mur8165"] = "2026-04-21", 
    ["awerse1233"] = "2026-04-21", ["xional5"] = "2026-04-21", ["kyyyonima"] = "2026-04-21", 
    ["azhar_ilang2"] = "2026-04-21", ["lukyyyy049"] = "2026-04-21", ["yanzstory6"] = "2026-04-21", 
    ["lyyonraa"] = "2026-04-21", ["faiznee"] = "2026-04-21", ["reyazza12"] = "2026-04-21", 
    ["razstar04"] = "2026-04-21", ["thisisjejeee"] = "2026-04-21", ["robloxkingo9o8"] = "2026-04-21", 
    ["skyxbar3"] = "2026-04-21", ["zaki123gg82"] = "2026-04-21", ["8catplayren"] = "2026-04-21",
    ["escape_stunami1"] = "2026-04-05", ["ggpr320"] = "2026-04-05",
    ["reczz83"] = "2026-04-05", ["erinlowery53680"] = "2026-04-05", 
    ["roblox_user_8925886113"] = "2026-04-05", ["thevordnaigh"] = "2026-04-05", 
    ["nefz152"] = "2026-04-05", ["vinzzzzz875"] = "2026-04-05", ["rafa2sf"] = "2026-04-05", 
    ["wannz890"] = "2026-04-05", ["gg33tarr"] = "2026-04-05", ["alfin141006"] = "2026-03-29",
    ["berondon47"] = "2026-04-09", ["a151215511515"] = "2026-04-04", ["godronglibinin"] = "2026-04-04", 
    ["absyarr_xyz"] = "2026-04-04", ["pnzygod"] = "2026-04-04", ["dhkvtgqevea"] = "2026-03-23", 
    ["ziolez82636"] = "2026-03-30", ["menujurebirth2026"] = "2026-04-19", ["poisonkiss_0"] = "2026-04-17", 
    ["kudaponi_231"] = "2026-04-15", ["rahmat135798"] = "2026-04-13", ["sempyak33"] = "2026-04-11", 
    ["yo_gatau9"] = "2026-04-09", ["akskkdjsndhdh"] = "2026-04-07", ["akucantikyahh"] = "2026-04-05", 
    ["frisco_178"] = "2026-04-03", ["jierrr9"] = "2026-04-01", ["kingitachisusanoo"] = "2026-03-28"
}

-- ========================================================== --
-- 🛡️ SISTEM VALIDASI & TIMER BOM
-- ========================================================== --
local function getVIPData()
    local name = string.lower(Player.Name):gsub("%s+", "")
    local expStr = VIP_LIST[name]
    if not expStr then return false, "TIDAK TERDAFTAR" end
    if expStr == "9999-12-31" then return true, "🛡️ STATUS: PERMANENT" end
    
    local y, m, d = expStr:match("(%d+)-(%d+)-(%d+)")
    local expTime = os.time({year=tonumber(y), month=tonumber(m), day=tonumber(d), hour=23, min=59, sec=59})
    local diff = expTime - os.time()
    
    if diff <= 0 then return false, "EXPIRED" end
    
    local days = math.floor(diff / 86400)
    local hours = math.floor((diff % 86400) / 3600)
    local mins = math.floor((diff % 3600) / 60)
    local secs = diff % 60
    return true, string.format("⏳ SISA WAKTU: %dD %02d:%02d:%02d", days, hours, mins, secs)
end

local function ShowLockAndKick()
    Player:Kick("\n==============================\n      [ SANSVIN OFFICIAL ]\n==============================\n   ⚠️ MASA AKTIF VIP HABIS! ⚠️\n\n  Silahkan hubungi Owner untuk\n  melakukan perpanjangan.\n==============================")
end

-- Cleaner UI Ringan (Update per 1 detik)
task.spawn(function()
    while task.wait(1) do
        local ok, statusText = getVIPData()
        if not ok then ShowLockAndKick() break end
        
        for _, v in ipairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                local txt = v.Text:lower()
                -- Ganti Notifikasi/Pisang jadi Timer
                if txt:find("notification") or txt:find("🍌") then
                    v.Text = statusText
                -- Ganti Deskripsi Update & Osaka/Tsunami
                elseif txt:find("new update") or txt:find("7.6") or txt:find("16/03/2026") or txt:find("osaka") or txt:find("tsunami") then
                    v.Text = "SANSVIN OFFICIAL - V2.0"
                end
            end
        end
    end
end)

-- ========================================================== --
-- 🚀 LOADING BAR KUNING (SMOOTH & LIGHT)
-- ========================================================== --
local function StartLoading()
    local sg = Instance.new("ScreenGui", Player.PlayerGui)
    local main = Instance.new("Frame", sg)
    main.Size, main.Position, main.BackgroundColor3 = UDim2.new(0, 320, 0, 75), UDim2.new(0.5, -160, 0.82, 0), Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", main)
    Instance.new("UIStroke", main).Color = Color3.fromRGB(255, 230, 0)
    
    local title = Instance.new("TextLabel", main)
    title.Size, title.BackgroundTransparency, title.Text, title.TextColor3, title.Font, title.TextSize = UDim2.new(1, 0, 0.6, 0), 1, "SANSVIN V2.0 - LOADING...", Color3.fromRGB(255, 230, 0), "GothamBold", 18
    
    local barBg = Instance.new("Frame", main)
    barBg.Size, barBg.Position, barBg.BackgroundColor3 = UDim2.new(0.9, 0, 0.1, 0), UDim2.new(0.05, 0, 0.75, 0), Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", barBg)
    
    local barFill = Instance.new("Frame", barBg)
    barFill.Size, barFill.BackgroundColor3 = UDim2.new(0, 0, 1, 0), Color3.fromRGB(255, 230, 0)
    Instance.new("UICorner", barFill)
    
    TweenService:Create(barFill, TweenInfo.new(2), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(2.2)
    sg:Destroy()
end

-- ========================================================== --
-- 🛡️ EXECUTION
-- ========================================================== --
local canRun, _ = getVIPData()
if canRun then
    StartLoading()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
    end)
else
    ShowLockAndKick()
end
