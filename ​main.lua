-- [[ SANSVIN OFFICIAL - V2.0 PREMIUM ]] --
-- Update Terakhir: 22/03/2026 | Status: Final Audit Verified ✅
-- Penambahan: alfin141006 (Verified 1 Minggu)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

-- ========================================================== --
-- ⚙️ DAFTAR VIP (WAJIB HURUF KECIL - AUTO SYNC)
-- ========================================================== --
local VIP_LIST = { 
    -- [ OWNER ]
    ["opwaressu"] = "9999-12-31", 

    -- [ GROUP: EXPIRE 21 APRIL 2026 (1 BULAN) ]
    ["zero26xmoses"] = "2026-04-21", ["rinalbau1522"] = "2026-04-21", ["rendhspotify"] = "2026-04-21", 
    ["ciboyy_kids"]  = "2026-04-21", ["izaaaa2504"]  = "2026-04-21", ["mur8165"]      = "2026-04-21", 
    ["awerse1233"]   = "2026-04-21", ["xional5"]     = "2026-04-21", ["kyyyonima"]   = "2026-04-21", 
    ["azhar_ilang2"] = "2026-04-21", ["lukyyyy049"]  = "2026-04-21", ["yanzstory6"]  = "2026-04-21", 
    ["lyyonraa"]     = "2026-04-21", ["faiznee"]     = "2026-04-21", ["reyazza12"]   = "2026-04-21", 
    ["razstar04"]    = "2026-04-21", ["thisisjejeee"] = "2026-04-21", ["robloxkingo9o8"] = "2026-04-21", 
    ["skyxbar3"]     = "2026-04-21", ["zaki123gg82"] = "2026-04-21", ["8catplayren"]  = "2026-04-21",

    -- [ GROUP: EXPIRE 05 APRIL 2026 (2 MINGGU) ]
    ["roblox_user_8925886113"] = "2026-04-05", ["thevordnaigh"] = "2026-04-05", 
    ["nefz152"]                = "2026-04-05", ["vinzzzzz875"] = "2026-04-05", 
    ["rafa2sf"]                = "2026-04-05", ["wannz890"]    = "2026-04-05",
    ["gg33tarr"]               = "2026-04-05", ["erinlowery53680"] = "2026-04-05",

    -- [ BATCH MINGGUAN & LAINNYA ]
    ["alfin141006"]      = "2026-03-29", -- BARU: Habis 29 Maret
    ["berondon47"]       = "2026-04-09",
    ["a151215511515"]    = "2026-04-04", ["godronglibinin"]   = "2026-04-04", 
    ["absyarr_xyz"]      = "2026-04-04", ["pnzygod"]          = "2026-04-04", 
    ["dhkvtgqevea"]      = "2026-03-23", ["ziolez82636"]      = "2026-03-30",
    
    -- [ MEMBER LAMA - HITUNG MUNDUR ]
    ["menujurebirth2026"] = "2026-04-19", ["poisonkiss_0"] = "2026-04-17", ["kudaponi_231"] = "2026-04-15",
    ["rahmat135798"] = "2026-04-13", ["sempyak33"] = "2026-04-11", ["yo_gatau9"] = "2026-04-09",
    ["akskkdjsndhdh"] = "2026-04-07", ["akucantikyahh"] = "2026-04-05", ["frisco_178"] = "2026-04-03",
    ["jierrr9"] = "2026-04-01", ["kingitachisusanoo"] = "2026-03-28"
}

-- ========================================================== --
-- 🛡️ SISTEM VALIDASI KEAMANAN (ANTI-BYPASS)
-- ========================================================== --
local function getVIPStatus()
    local name = string.lower(Player.Name):gsub("%s+", "")
    local expStr = VIP_LIST[name]
    
    if not expStr then return false, "TIDAK TERDAFTAR" end
    if expStr == "9999-12-31" then return true, "STATUS: PERMANENT" end
    
    local y, m, d = expStr:match("(%d+)-(%d+)-(%d+)")
    local success, expTime = pcall(function() 
        return os.time({year=y, month=m, day=d, hour=23, min=59, sec=59}) 
    end)
    
    if not success then return false, "ERROR FORMAT TANGGAL" end
    
    local diff = expTime - os.time()
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
                    local textLower = v.Text:lower()
                    if textLower:find("osaka") or textLower:find("tsunami") or textLower:find("v7.6") then
                        v.Text = "SANSVIN OFFICIAL - V2.0"
                    elseif textLower:find("aktif:") or textLower:find("status:") then
                        v.Text = "SANSVIN OFFICIAL | " .. liveTime
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
