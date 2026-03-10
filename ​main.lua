-- [[ SANSVIN OFFICIAL - V1.3 (ULTIMATE EDITION) ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

-- 1. CEK VIP
local VIP_LIST = { ["OPWaressu"] = true }
local function cekVip()
    local namaKecil = string.lower(Player.Name)
    for vNama, _ in pairs(VIP_LIST) do
        if string.lower(vNama) == namaKecil then return true end
    end
    return false
end

if not cekVip() then Player:Kick("\n[SANSVIN]\nAkses Ditolak!") return end

-- 2. DATABASE (TEMPAT LINK SKRIP)
local SANSVIN_DATABASE = {
    [15502339080] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
}

-- 3. LOADING BAR
local sg = Instance.new("ScreenGui", Player.PlayerGui)
sg.Name = "SansvinMiniLoader"
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 60)
main.Position = UDim2.new(0.5, -130, 0.9, -70)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", main)
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "SANSVIN OFFICIAL - LOADING..."
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

task.spawn(function()
    task.wait(2)
    sg:Destroy()
    
    local ScriptURL = SANSVIN_DATABASE[game.GameId] or SANSVIN_DATABASE[game.PlaceId]
    if ScriptURL then
        -- Mencoba memuat skrip target
        local success, err = pcall(function()
            loadstring(game:HttpGet(ScriptURL))()
        end)
        
        if not success then
            warn("SANSVIN ERROR: Gagal memuat skrip: " .. tostring(err))
        end
    else
        warn("SANSVIN: GameID tidak ada di database.")
    end
end)

-- 4. BRAND REPLACER (GANTI NAMA SPEED HUB KE SANSVIN)
task.spawn(function()
    while true do
        for _, v in ipairs(CoreGui:GetDescendants()) do
            pcall(function()
                if (v:IsA("TextLabel") or v:IsA("TextButton")) then
                    if v.Text:lower():find("speed hub") then
                        v.Text = "SANSVIN OFFICIAL"
                    end
                end
            end)
        end
        task.wait(0.5)
    end
end)
