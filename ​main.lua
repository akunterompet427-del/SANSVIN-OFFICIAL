-- [[ SANSVIN OFFICIAL PROJECT ]] --
-- Base: OsakaTP2 Galaxy 6.5
-- Status: VIP ONLY & HP Kentang Friendly

-- 1. SISTEM WHITELIST SANSVIN
local VIP_LIST = {"OPWaressu", "Ardiles012"} 
local playerName = game.Players.LocalPlayer.Name
local isVip = false

for _, name in pairs(VIP_LIST) do
    if playerName == name then
        isVip = true
        break
    end
end

if not isVip then
    game.Players.LocalPlayer:Kick("Maaf, kamu bukan member VIP SANSVIN.")
    return
end

-- 2. NOTIFIKASI MASUK SANSVIN
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "SANSVIN OFFICIAL",
    Text = "Selamat datang, VIP Member! Memuat fitur...",
    Duration = 5
})

-- 3. EKSEKUSI FITUR UTAMA (OSAKA VERSION)
-- Kita panggil link yang kamu berikan tadi sebagai mesin fiturnya
loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()

-- 4. PEMBERSIH NAMA (REBRANDING)
-- Mencoba mengganti judul menu agar menjadi SANSVIN OFFICIAL
task.spawn(function()
    wait(3)
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetDescendants()) do
        if v:IsA("TextLabel") and (v.Text:find("Osaka") or v.Text:find("Galaxy")) then
            v.Text = "SANSVIN OFFICIAL"
        end
    end
end)
