-- [[ SANSVIN OFFICIAL VIP ]] --
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

-- Load Original Script Features
loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/main/solix%20new%20keyui.lua"))()
