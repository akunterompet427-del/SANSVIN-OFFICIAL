-- [[ SANSVIN OFFICIAL VIP ]] --
-- Bypass Key System & Rebranding Total

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

-- MEMBERSIHKAN LAYAR DARI LOGO & KEY
task.spawn(function()
    while task.wait(0.5) do
        local coreGui = game:GetService("CoreGui")
        -- Cari dan hapus layar Key atau Logo yang mengganggu
        for _, v in pairs(coreGui:GetDescendants()) do
            if v:IsA("TextLabel") and (v.Text:find("Solix") or v.Text:find("Key")) then
                local screen = v:FindFirstAncestorOfClass("ScreenGui")
                if screen then screen.Enabled = false end 
            end
            if v:IsA("ImageLabel") and (v.Image:find("http") or v.Name == "Avatar") then
                v.Visible = false -- Hilangkan foto orang
            end
        end
    end
end)

-- EKSEKUSI FITUR UTAMA SANSVIN
-- Langsung panggil fiturnya tanpa melewati pengecekan awal
loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/main/solix%20new%20keyui.lua"))()

-- GANTI NAMA MENU SECARA PAKSA
task.spawn(function()
    wait(2)
    local ui = game.CoreGui:FindFirstChild("Solix ScreenGui", true)
    if ui then
        for _, t in pairs(ui:GetDescendants()) do
            if t:IsA("TextLabel") and t.Text:find("Solix") then
                t.Text = "SANSVIN OFFICIAL" -- Branding kamu
            end
        end
    end
end)
