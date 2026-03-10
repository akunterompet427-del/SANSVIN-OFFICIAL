-- [[ SANSVIN OFFICIAL - V1.7 (OSAKA EDITION) ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Player = Players.LocalPlayer

-- 1. VIP CHECK
local VIP_LIST = { ["OPWaressu"] = true }
if not VIP_LIST[Player.Name] then Player:Kick("Akses Ditolak!") return end

-- 2. LOADING BAR
local sg = Instance.new("ScreenGui", Player.PlayerGui)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 60)
main.Position = UDim2.new(0.5, -130, 0.9, -70)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", main)
local txt = Instance.new("TextLabel", main)
txt.Size = UDim2.new(1, 0, 1, 0)
txt.Text = "SANSVIN OFFICIAL - LOADING..."
txt.TextColor3 = Color3.new(1,1,1)
txt.BackgroundTransparency = 1

-- 3. LOAD SCRIPT
task.spawn(function()
    task.wait(2)
    sg:Destroy()
    -- Memuat skrip Osaka
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"))()
end)

-- 4. PENGHAPUS JEJAK (BRANDING SANSVIN)
-- Fungsi ini akan memantau layar dan mengganti nama Osaka menjadi SANSVIN
task.spawn(function()
    while true do
        for _, v in ipairs(CoreGui:GetDescendants()) do
            pcall(function()
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local t = v.Text:lower()
                    -- Kata-kata yang akan diganti jadi SANSVIN
                    if t:find("osaka") or t:find("tp2") or t:find("galaxy") or t:find("tsunami") then
                        v.Text = "SANSVIN OFFICIAL"
                    end
                end
            end)
        end
        task.wait(0.3)
    end
end)
