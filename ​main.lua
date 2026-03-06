-- [[ SANSVIN OFFICIAL PROJECT ]] --
-- Optimasi: HP Kentang
-- Status: VIP ONLY

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

-- Rebranding GUI SANSVIN
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/main/solix%20new%20keyui.lua"))()

-- Menghilangkan Foto & Mengganti Nama
task.spawn(function()
    wait(1)
    if Library and Library.WindowTitle then
        Library.WindowTitle = "SANSVIN OFFICIAL"
    end
    local ui = game.CoreGui:FindFirstChild("Solix ScreenGui", true)
    if ui then
        for _, v in pairs(ui:GetDescendants()) do
            if v:IsA("ImageLabel") then v.Visible = false end -- Hilangkan foto
        end
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/main/solix%20new%20keyui.lua"))()
