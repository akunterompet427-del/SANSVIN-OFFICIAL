-- [[ SANSVIN OFFICIAL - V1.4 (DEBUG MODE) ]] --
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- 1. VIP CHECK
local VIP_LIST = { ["OPWaressu"] = true }
if not VIP_LIST[Player.Name] then Player:Kick("Bukan member VIP!") return end

-- 2. LOADING BAR (Dibuat sederhana)
local sg = Instance.new("ScreenGui", Player.PlayerGui)
local main = Instance.new("TextLabel", sg)
main.Size = UDim2.new(0, 300, 0, 50)
main.Position = UDim2.new(0.5, -150, 0.9, -70)
main.Text = "SANSVIN OFFICIAL - MEMUAT..."

-- 3. LOAD SCRIPT
task.spawn(function()
    local url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"
    
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        main.Text = "SANSVIN OFFICIAL - BERHASIL"
        task.wait(1)
        sg:Destroy()
        loadstring(result)()
    else
        main.Text = "ERROR: GAGAL MEMUAT!"
        warn("DEBUG ERROR: " .. tostring(result))
    end
end)
