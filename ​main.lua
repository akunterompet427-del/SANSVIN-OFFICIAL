-- [[ SANSVIN OFFICIAL VIP ]] --
-- Optimasi: HP Kentang
-- Status: No Key & Auto-Load

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

-- NOTIFIKASI SANSVIN
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "SANSVIN OFFICIAL",
    Text = "Menyiapkan Fitur VIP... Tunggu Sekejap",
    Duration = 5
})

-- MEMANGGIL FITUR UTAMA DENGAN DELAY AGAR TIDAK CRASH
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0Tsunami"))()
