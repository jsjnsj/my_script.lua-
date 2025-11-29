-- 可无限重复加载的 WindUI 裸壳 - 已修复 Slider + 容错
------------------------------------------------------------------
-- 1. 拉库
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

------------------------------------------------------------------
-- 2. 创窗
local Window = WindUI:CreateWindow({
    Title   = "xhknfjnknn脚本",
    Icon    = "lightning",
    Author  = "作者xhknfjnknn qq2136024871",
    Folder  = "RepeatLoad",
    Size    = UDim2.fromOffset(560, 360),
    Theme   = "Dark",
    Transparent = true
})

------------------------------------------------------------------
-- 3. 常用 helper
local function AddTab(name, icon)
    return Window:Tab({Title = name, Icon = icon or "folder"})
end
local function AddButton(tab, text, callback)
    tab:Button({Title = text, Callback = callback or function() end})
end
local function AddSlider(tab, text, min, max, default, callback)
    tab:Slider({
        Title = text,
        Step  = 1,
        Value = {Min = min, Max = max, Default = default},
        Callback = callback
    })
end

------------------------------------------------------------------
-- 4. 拿人物（容错）
local function GetHuman()
    local lp = game:GetService("Players").LocalPlayer
    local char = lp and lp.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

------------------------------------------------------------------
-- 5. 示范 Tab
local T1 = AddTab("主页", "home")
local T2 = AddTab("玩家", "user")

AddButton(T1, "按钮 A", function() print("A 被点了") end)
AddButton(T1, "按钮 B", function() print("B 被点了") end)

-- 速度滑条（已容错）
AddSlider(T2, "移动速度", 16, 200, (GetHuman() and GetHuman().WalkSpeed) or 16,
    function(v)
        local hum = GetHuman()
        if hum then hum.WalkSpeed = v end
    end)
AddButton(T2, "跳跃高度", 1, 200, game.Players.LocalPlayer.Character.Humanoid.JumpPower, function(a) 
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
end

------------------------------------------------------------------
-- 6. 立即显示
Window:Show()
print("新窗口已生成，可再次 Execute 继续加载！")
