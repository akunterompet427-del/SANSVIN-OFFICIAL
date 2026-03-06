-- [[ SANSVIN OFFICIAL VIP ]] --
-- Optimasi: HP Kentang
-- Status: No Key & No Ads

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

-- NOTIFIKASI PEMBUKA SANSVIN
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "SANSVIN OFFICIAL",
    Text = "Selamat datang, VIP Member!",
    Duration = 5
})

-- MEMANGGIL FITUR UTAMA (VERSI BERSIH & NO KEY)
-- Kita menggunakan fitur yang mendukung optimasi perangkat rendah
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0Tsunami"))()
