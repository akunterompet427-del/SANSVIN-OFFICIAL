-- [[ SANSVIN OFFICIAL - V1.3 (FINAL CLEAN) ]] --
-- Perbaikan: Total Overwrite & No Leak
-- Author: SANSVIN (2026)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Player = Players.LocalPlayer

-- 1. VALIDASI VIP (Sesuai list kamu)
local VIP_LIST = { ["8Catplayren"] = true, ["OPWaressu"] = true, ["zaki123gg82"] = true, ["Pemancinganhanda"] = true }
if not VIP_LIST[Player.Name] then Player:Kick("SANSVIN: Akses Ditolak") return end

-- 2. SISTEM PEMBERSIH (Target Lingkaran Merah Kamu)
local function totalClean()
    for _, v in ipairs(CoreGui:GetDescendants()) do
        pcall(function()
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                -- Hapus area yang kamu lingkari di atas
                if v.Text:find("Escape") or v.Text:find("brainrots") or v.Text:find("v7.5") or v.Text:find("Osaka") then
                    v.Text = "SANSVIN UPDATE" -- Ganti jadi satu nama saja biar gak berantakan
                    v.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
                
                -- Ganti notifikasi pisang & youtube
                if v.Text:find("Notification") or v.Text:find("Youtube") then
                    v.Text = "SANSVIN OFFICIAL"
                end
            end
            
            -- Hapus gambar pisang & logo asli secara instan
            if v:IsA("ImageLabel") and (v.Image:find("rbxassetid") or v.Name:find("Icon")) then
                v.Visible = false
            end
        end)
    end
end

-- Load Script Asli
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- Loop Super Cepat (0.1 detik) biar nama aslinya gak sempat nongol
task.spawn(function()
    while true do
        totalClean()
        task.wait(0.1)
    end
end)
