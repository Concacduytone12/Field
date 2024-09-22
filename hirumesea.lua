repeat wait() until game:IsLoaded()
pcall(function()
    repeat
        wait()
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.PlayBackground.Play.Activated)) do
            v.Function()
        end
    until not game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Enabled
end)
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Hiru Hub",
        Text = "Loading",
        Duration = 5
    })
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local player = game.Players.LocalPlayer
local L1 = Instance.new("ScreenGui")
local L2 = Instance.new("TextButton")
local L3 = Instance.new("UICorner")
local L4 = Instance.new("ImageLabel")
local sound = Instance.new("Sound")
L3.Name = "UICorner"
L3.Parent = L2
L4.Name = "ButtonImage"
L4.Parent = L2
L4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L4.BackgroundTransparency = 1.000
L4.BorderSizePixel = 0
L4.Position = UDim2.new(0.1, 0, 0.1, 0) 
L4.Size = UDim2.new(0, 45, 0, 45)
L4.Image = ""
L1.Name = "MainGui"
L1.Parent = player:WaitForChild("PlayerGui")
L1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
L2.Name = "CustomButton"
L2.Parent = L1
L2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
L2.BackgroundTransparency = 0.2
L2.BorderSizePixel = 0
L2.Position = UDim2.new(0.1208, 0, 0.0953, 0)
L2.Size = UDim2.new(0, 50, 0, 50)
L2.Font = Enum.Font.LuckiestGuy
L2.Text = "Hiru Hub"
L2.TextColor3 = Color3.fromRGB(255, 255, 255)
L2.TextSize = 9.000
L2.Draggable = true
sound.Parent = L2
sound.SoundId = "rbxassetid://130785805"
L2.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
    sound:Play()
end)
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.359138072, 0, -0.025062656, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "discord.gg/63Mwy9Sr"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 19.000

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.01, Color3.fromRGB(23, 48, 235)), ColorSequenceKeypoint.new(0.16, Color3.fromRGB(55, 23, 235)), ColorSequenceKeypoint.new(0.35, Color3.fromRGB(219, 13, 30)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(8, 152, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(114, 187, 255))}
UIGradient.Parent = TextLabel
local Window = Fluent:CreateWindow({
    Title = "Hiru Hub Premium",
    SubTitle = "• By เหงียน วู ดุย",
    TabWidth = 140,
    Size = UDim2.fromOffset(590, 320),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
Main = Window:AddTab({ Title = "Tab Main", Icon = "" })
Stats = Window:AddTab({ Title = "Tab Stats Upgrade", Icon = "" })
NPC = Window:AddTab({ Title = "Tab NPC", Icon = "" })
Skill = Window:AddTab({ Title = "Tab Skills", Icon = "" })
MiscTab = Window:AddTab({ Title = "Tab Misc", Icon = "" })
ShopTab = Window:AddTab({ Title = "Tab Shop", Icon = "" })
getgenv().Options = Fluent.Options
function notify(title, content, time)
    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = 5
    })
end

local Config = {
    ["AutoFarm"] = false,
    ["Amount"] = 1,
    ["Stats"] = {
        ["Melee"] = false,
        ["Defense"] = false
    },
    ["Weapon"] = "",
    ["AutoSkillKeyCode"] = {
        ["Z"] = false
    },
    ["Distance"] = 0,
    ["HoldZ"] = 0,
    ["HoldX"] = 0,
    ["HoldC"] = 0,
    ["HoldV"] = 0,
}

function Save(i, v)
    if i ~= nil then
        Config[i] = v
    end
    if not isfolder("Hiru Hub") then
        makefolder("Hiru Hub")
    end
    writefile("Hiru Hub" .. "/" .. "MemeSea-" .. game.Players.LocalPlayer.Name .. ".json",
        game:GetService("HttpService"):JSONEncode(Config))
end

function read()
    if not isfolder("Hiru Hub") then
        makefolder("Hiru Hub")
    end
    if not pcall(function() readfile("Hiru Hub/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json") end) then
        writefile("Hiru Hub/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json",
            game:GetService("HttpService"):JSONEncode(Config))
    end
    for key, value in pairs(game:GetService("HttpService"):JSONDecode(readfile("Hiru Hub/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json"))) do
        Config[key] = value
    end
end

read()
function getnamequest()
    local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
    local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

    local closestQuest = nil
    local closestDifference = math.huge

    for i, v in pairs(a) do
        if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
            local difference = level - v.LevelNeed
            if difference <= closestDifference then
                closestQuest = i
                closestDifference = difference
            end
        end
    end
    return closestQuest
end

function getmob()
    local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
    local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

    local mob = nil
    local closestDifference = math.huge

    for i, v in pairs(a) do
        if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
            local difference = level - v.LevelNeed
            if difference <= closestDifference then
                mob = v.Target
                closestDifference = difference
            end
        end
    end
    return mob
end

--[[

]]
local plr = game.Players.LocalPlayer
function DetectQuest()
    if game.workspace.Location.QuestLocaion:FindFirstChild(getnamequest()) then
        for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
            if v.Name == getnamequest() then
                return v.CFrame, v
            end
        end
    else
        for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
            if v.Name == getnamequest() then
                return v.WorldPivot, v
            end
        end
    end
end

function getquest()
    local QuestPos, Quest = DetectQuest()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = QuestPos
    local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(Quest.Name)
    if PromptQuest then
        if plr:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                fireproximityprompt(PromptQuest.Block.QuestPrompt)
            end
            wait(0.5)
        end
    end
end

function noclip()
    if plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
        local BV = Instance.new("BodyVelocity")
        BV.Parent = plr.Character.HumanoidRootPart
        BV.Name = "EffectsSY"
        BV.MaxForce = Vector3.new(100000, 100000, 100000)
        BV.Velocity = Vector3.new(0, 0, 0)
    end
end

function destroynoclip()
    if plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
        plr.Character.HumanoidRootPart.EffectsSY:Destroy()
    end
end

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if Options["Auto Farm Level"].Value or Options["Auto Raid"].Value then
            noclip()
        end
        if not Options["Auto Farm Level"].Value and not Options["Auto Raid"].Value then
            destroynoclip()
        end
    end)
end)
function function0(a)
    if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

function function01(tb)
    tb2 = 0
    for i, v in pairs(tb) do
        if v > tb2 then tb2 = v end
    end
    return tb2
end

function function1()
    local s = {}
    local s3 = false
    for _, t1 in pairs(workspace.Monster:GetChildren()) do
        if function0(t1) then
            for _, t2 in pairs(workspace.Monster:GetChildren()) do
                if function0(t2) and function0(t1) then
                    if (t2.HumanoidRootPart.Position - t1.HumanoidRootPart.Position).Magnitude <= 1000 then
                        if not s[t1.HumanoidRootPart.CFrame] then
                            s[t1.HumanoidRootPart.CFrame] = 1
                        else
                            s[t1.HumanoidRootPart.CFrame] = s[t1.HumanoidRootPart.CFrame] + 1
                        end
                    end
                end
            end
        end
    end
    local s2 = function01(s)
    for i, v in pairs(s) do
        if v == s2 then
            s3 = i
        end
    end
    return s3;
end

function sizepart(v)
    if not v.PrimaryPart:FindFirstChild("vando") and plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 1000 then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v.PrimaryPart
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(0, 10000, 0)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end

local TargetBring
local PositionBring
function ValueMob(a)
    local b = 0
    for i, v in pairs(workspace.Monster:GetChildren()) do
        if v.Name == a.Name then
            b = b + 1
        end
    end
    return b
end

function BringMob(a)
    pcall(function()
        if TargetBring ~= a then
            TargetBring = a
            PositionBring = a.PrimaryPart.CFrame
        end
        if ValueMob(a) > 1 then
            for i, v in pairs(workspace.Monster:GetChildren()) do
                if v.Name == a.Name and a:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    v.PrimaryPart.CFrame = PositionBring
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 1000 then
                        sizepart(v)
                    end
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end
    end)
end

local function equiptool(toolname)
    pcall(function()
        if game:GetService('Players').LocalPlayer:WaitForChild('Backpack'):FindFirstChild(toolname) and game:GetService('Players').LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService('Players').LocalPlayer.Character.Humanoid.Health > 0 then
            game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid'):EquipTool(game:GetService(
                'Players').LocalPlayer:WaitForChild('Backpack'):FindFirstChild(toolname))
        end
    end)
end
function DetectMob()
    for i, v in pairs(workspace.Monster:GetChildren()) do
        if v.Name == getmob() and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

function useskill(weapon, skill)
    if getgenv().posaim then
        local args = {
            [1] = workspace:WaitForChild("Character"):WaitForChild(plr.Name),
            [2] = weapon,
            [3] = skill,
            [4] = "Hold",
            [5] = {
                ["Mouse_Position"] = getgenv().posaim,
                ["Hit_Position"] = getgenv().posaim
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild(
            "Server_Skills"):FireServer(unpack(args))
        local args = {
            [1] = workspace:WaitForChild("Character"):WaitForChild(plr.Name),
            [2] = weapon,
            [3] = skill,
            [4] = "Release",
            [5] = {
                ["Mouse_Position"] = getgenv().posaim,
                ["Hit_Position"] = getgenv().posaim
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild(
            "Server_Skills"):FireServer(unpack(args))
    end
end

local VirtualUser = game:GetService("VirtualUser")
function spamskillautofarm()
    if Config["AutoSkill"] then
        spawn(function()
            if Config["AutoSkillKeyCode"]["Z"] then
                spawn(function()
                    useskill(Config.Weapon, "Z")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["X"] then
                spawn(function()
                    useskill(Config.Weapon, "X")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["C"] then
                spawn(function()
                    useskill(Config.Weapon, "C")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["V"] then
                spawn(function()
                    useskill(Config.Weapon, "V")
                end)
            end
        end)
    end
end

function honglampromax()
    if not Config["AutoSkill"] then
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
    else
        spamskillautofarm()
    end
end

local click = false
spawn(function()
    while wait() do
        if click then
            VirtualUser:CaptureController()
            VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
        end
    end
end)
function Tp(v)
    if v:FindFirstChild("Humanoid") then
        if v.Humanoid.Health > 0 then
            plr.Character:SetPrimaryPartCFrame(v.PrimaryPart.CFrame *
                CFrame.new(0, Config.Distance, 0) *
                CFrame.Angles(math.rad(-90), 0, 0))
        end
    end
end

spawn(function()
    pcall(function()
        while wait() do
            local a, b = pcall(function()
                if Config["AutoFarm"] then
                    if plr.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                        getquest()
                    else
                        if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= getnamequest() then
                            for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
                                v.Function()
                            end
                        end
                        local v = DetectMob()
                        if v then
                            click = true
                            repeat
                                task.wait()
                                spawn(function()
                                    equiptool(Config["Weapon"])
                                end)
                                BringMob(v)
                                Tp(v)
                                spawn(function()
                                    honglampromax()
                                end)
                                getgenv().posaim = v.PrimaryPart.CFrame.Position
                            until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false or not Options["Auto Farm Level"].Value or not Config["AutoFarm"]
                            click = false
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    while wait() do
        if Config["Auto Upgrade Stats"] then
            spawn(function()
                if Config["Stats"]["Defense"] then
                    local args = {
                        [1] = {
                            ["Target"] = "DefenseLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Sword"] then
                    local args = {
                        [1] = {
                            ["Target"] = "SwordLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Melee"] then
                    local args = {
                        [1] = {
                            ["Target"] = "MeleeLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Power"] then
                    local args = {
                        [1] = {
                            ["Target"] = "MemePowerLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
function weapon()
    local save = {}
    for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if not table.find(save, v.Name) then
            table.insert(save, v.Name)
        end
    end
    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if not table.find(save, v.Name) and v:IsA("Tool") then
            table.insert(save, v.Name)
        end
    end
    return save
end

do
    local Toggle = Main:AddToggle("Auto Farm Level",
        {
            Title = "Auto Farm Level",
            Default = Config["AutoFarm"],
            Callback = function(v)
                Config["AutoFarm"] = v
                Save()
            end
        })
    local Dropdown = Main:AddDropdown("Select Weapon", {
        Title = "Select Weapon",
        Description = "Select Weapon",
        Values = weapon(),
        Multi = false,
        Default = Config.Weapon,
        Callback = function(v)
            Config["Weapon"] = v;
            Save()
        end
    })
    local Toggle = Main:AddToggle("Auto Refresh Weapon When Not Detect In Bag",
        {
            Title = "Auto Refresh Weapon When Not Detect In Bag",
            Description = "Auto Refresh Weapon When Not Detect In Bag",
            Default = Config["Refresh"],
            Callback = function(v)
                Config["Refresh"] = v
                Save()
            end
        })
    local Toggle = Main:AddToggle("Auto Turn On Aura", {
        Title = "Auto Turn On Aura",
        Description = "Auto Turn On Aura",
        Default = Config["EnableAura"],
        Callback = function(v)
            Config["EnableAura"] = v
            Save()
        end
    })
    spawn(function()
        pcall(function()
            while wait() do
                if Config["EnableAura"] then
                    if #game.Players.LocalPlayer.Character.AuraColor_Folder:GetChildren() < 1 then
                        game.ReplicatedStorage:WaitForChild("OtherEvent").MainEvents.Ability:InvokeServer("Aura")
                    end
                end
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if Config["Refresh"] then
                    if table.find(weapon(), Config.Weapon) then
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                    else
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                    end
                    wait(math.random(30, 60))
                end
            end
        end)
    end)
    Main:AddButton({
        Title = "Refresh Weapon",
        Description = "Refresh Weapon",
        Callback = function()
            Dropdown:SetValues(weapon())
        end
    })
    local Input = Main:AddInput("Distance", {
        Title = "Input Distance",
        Description = "Input Distance",
        Default = Config.Distance,
        Placeholder = "Input Distance",
        Numeric = true,   -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            Config.Distance = Value
            Save()
        end
    })
    Skill:AddDropdown("Key", {
        Title = "Select Auto Skill",
        Description = "Select Auto Skill",
        Values = { "Z", "X", "C", "V" },
        Multi = true,
        Default = Config.AutoSkillKeyCode,
        Callback = function(v)
            Config["AutoSkillKeyCode"][v] = not v
            Save()
        end
    })
    Skill:AddToggle("Auto Skill",
        {
            Title = "Auto Skill",
            Default = Config["AutoSkill"],
            Callback = function(v)
                Config["AutoSkill"] = v
                Save()
            end
        })
    Skill:AddInput("Hold Z", {
        Title = "Hold Z",
        Description = "Hold Z",
        Default = Config.HoldZ,
        Placeholder = "Hold Z",
        Numeric = true,   -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            Config.HoldZ = Value
            Save()
        end
    })
    Skill:AddInput("Hold X", {
        Title = "Hold X",
        Description = "Hold X",
        Default = Config.HoldX,
        Placeholder = "Hold X",
        Numeric = true,   -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            Config.HoldX = Value
            Save()
        end
    })
    Skill:AddInput("Hold C", {
        Title = "Hold C",
        Description = "Hold C",
        Default = Config.HoldC,
        Placeholder = "Hold C",
        Numeric = true,   -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            Config.HoldC = Value
            Save()
        end
    })
    Skill:AddInput("Hold V", {
        Title = "Hold V",
        Description = "Hold V",
        Default = Config.HoldV,
        Placeholder = "Hold V",
        Numeric = true,   -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            Config.HoldV = Value
            Save()
        end
    })
    Main:AddButton({
        Title = "Redeem Code",
        Description = "Redeem All Code",
        Callback = function()
            local a = require(game:GetService("ReplicatedStorage").ModuleScript.CodeList)
            for i, v in pairs(a) do
                if not game:GetService("Players").LocalPlayer.Code:FindFirstChild(i) then
                    local args = {
                        [1] = i
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild("Code")
                        :InvokeServer(unpack(args))
                else
                    notify("Hiru Hub Notifcation", "Code: " .. i .. " Used", 10)
                end
            end
        end
    })
    local Toggle = Stats:AddToggle("Auto Upgrade Stats",
        {
            Title = "Auto Upgrade Stats",
            Default = Config["Auto Upgrade Stats"],
            Callback = function(v)
                Config["Auto Upgrade Stats"] = v
                Save()
            end
        })
    Stats:AddDropdown("Stats", {
        Title = "Select Auto Stats",
        Description = "Select Auto Stats",
        Values = { "Melee", "Defense", "Sword", "Power" },
        Multi = true,
        Default = Config.Stats,
        Callback = function(v)
            Config["Stats"][v] = not v
            Save()
        end
    })
    Stats:AddSlider("Amount",
        {
            Title = "Amount",
            Description = "Amount to upgrade",
            Default = Config.Amount,
            Min = 1,
            Max = 100,
            Rounding = 0,
            Callback = function(Value)
                Config.Amount = Value
                Save()
            end
        })
    function alibitynpc()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.AbilityTrainer_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "AbilityTrainer_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPC:AddDropdown("Select NPC", {
        Title = "Ability NPC",
        Description = "Teleport Ability NPC",
        Values = alibitynpc(),
        Multi = false,
        Callback = function(v)
            if workspace.NPCs.AbilityTrainer_Npc:FindFirstChild(v) then
                if workspace.NPCs.AbilityTrainer_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.AbilityTrainer_Npc[v]
                        .WorldPivot
                elseif workspace.NPCs.AbilityTrainer_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.AbilityTrainer_Npc[v]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(v) then
                if game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .CFrame
                end
            end
        end
    })
    function Misc()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.Misc_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "Misc_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    local miscnpc
    NPC:AddDropdown("Select NPC", {
        Title = "Misc NPC",
        Description = "Teleport Misc NPC",
        Values = Misc(),
        Multi = false,
        Callback = function(v)
            if workspace.NPCs.Misc_Npc:FindFirstChild(v) then
                if workspace.NPCs.Misc_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc[v]
                        .WorldPivot
                elseif workspace.NPCs.Misc_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc[v]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(v) then
                if game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .CFrame
                end
            end
        end
    })
    function FightingStyle()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.FightingStyle_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "FightingStyle_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPC:AddDropdown("Select NPC", {
        Title = "FightingStyle NPC",
        Description = "Teleport FightingStyle NPC",
        Values = FightingStyle(),
        Multi = false,
        Callback = function(v)
            if workspace.NPCs.FightingStyle_Npc:FindFirstChild(v) then
                if workspace.NPCs.FightingStyle_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.FightingStyle_Npc[v]
                        .WorldPivot
                elseif workspace.NPCs.FightingStyle_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.FightingStyle_Npc[v]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(v) then
                if game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .CFrame
                end
            end
        end
    })
    function Shop()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.Shop_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "Shop_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPC:AddDropdown("Select NPC", {
        Title = "Shop NPC",
        Description = "Teleport Shop NPC",
        Values = Shop(),
        Multi = false,
        Callback = function(v)
            if workspace.NPCs.Shop_Npc:FindFirstChild(v) then
                if workspace.NPCs.Shop_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Shop_Npc[v]
                        .WorldPivot
                elseif workspace.NPCs.Shop_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Shop_Npc[v]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(v) then
                if game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[v]
                        .CFrame
                end
            end
        end
    })
    MiscTab:AddToggle("Auto Roll Aura", {
        Title = "Auto Roll Aura",
        Description = "Auto Roll Aura",
        Default = Config.RollAura,
        Callback = function(v)
            Config.RollAura = v
            Save()
        end
    })
    function getaura()
        local aura = {}
        for i, v in next, game:GetService("Players").LocalPlayer.Items.AuraColor:GetChildren() do
            if not table.find(aura, v.Name) then
                table.insert(aura, v.Name)
            end
        end
        return aura
    end

    MiscTab:AddDropdown("Select Aura", {
        Title = "Select Aura",
        Description = "Select Aura",
        Values = getaura(),
        Multi = false,
        Default = Config.Aura,
        Callback = function(v)
            Config["Aura"] = v
            Save()
        end
    })
    function DetectQuestMisc(name)
        if game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest") then
            return game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest").WorldPivot
                .Position, "Cool Floppa Quest"
        end
        if workspace.NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest") then
            return workspace.NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest").WorldPivot.Position, "Cool Floppa Quest"
        end
    end

    local plr = game.Players.LocalPlayer
    function getquestmisc(name)
        local QuestPos, Quest = DetectQuestMisc(name)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(QuestPos)
        local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(name)
        if PromptQuest then
            if plr:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                    fireproximityprompt(PromptQuest.Block.QuestPrompt)
                end
                wait(0.5)
            end
        end
        if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= name and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == true then
            for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
                v.Function()
            end
        end
    end

    spawn(function()
        while wait() do
            if game:GetService("Players").LocalPlayer.PlayerData.AuraColor.Value ~= Config["Aura"] and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= 10 and Config.RollAura then
                local args = {
                    [1] = "Reroll_Color",
                    [2] = "Halfed Sorcerer"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                    "Modules"):FireServer(unpack(args))
            end
        end
    end)
    MiscTab:AddToggle("Cool Floppa Quest", {
        Title = "Cool Floppa Quest",
        Description = "Cool Floppa Quest",
        Default = Config.CoolQuest,
        Callback = function(v)
            Config.CoolQuest = v
            Save()
        end
    })
    MiscTab:AddToggle("Auto Get Pop Cat Weapon", {
        Title = "Auto Get Pop Cat Weapon",
        Description = "Auto Get Pop Cat Weapon",
        Default = Config.PopCat,
        Callback = function(v)
            Config.PopCat = v
            Save()
        end
    })
    spawn(function()
        while wait() do
            if Config.PopCat then
                if game:GetService("Players").LocalPlayer.Items.Weapon.Popcat.Value == 0 then
                    if plr:DistanceFromCharacter(workspace.Island.FloppaIsland.Popcat_Clickable.Part.Position) < 8 then
                        if workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text == "Popcat" then
                            repeat
                                wait()
                                fireclickdetector(workspace.Island.FloppaIsland.Popcat_Clickable.Part.ClickDetector)
                            until workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text ~= "Popcat"
                        end
                        numpop = workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text:gsub(
                            ",", "")
                        repeat
                            task.wait()
                            fireclickdetector(workspace.Island.FloppaIsland.Popcat_Clickable.Part.ClickDetector)
                            numpop = workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text
                                :gsub(
                                    ",", "")
                        until tonumber(numpop) > 10000 or not Config.PopCat
                        if workspace.NPCs.Misc_Npc:FindFirstChild("Ohio Popcat") then
                            if workspace.NPCs.Misc_Npc["Ohio Popcat"]:IsA("Model") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc
                                    ["Ohio Popcat"]
                                    .WorldPivot
                            elseif workspace.NPCs.Misc_Npc:IsA("Part") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc
                                    ["Ohio Popcat"]
                                    .CFrame
                            end
                        elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Ohio Popcat") then
                            if game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Model") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                        "ReplicatedStorage")
                                    .NPC_Storage["Ohio Popcat"]
                                    .WorldPivot
                            elseif game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Part") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                        "ReplicatedStorage")
                                    .NPC_Storage["Ohio Popcat"]
                                    .CFrame
                            end
                        end
                        local args = {
                            [1] = "Weapon_Seller",
                            [2] = "Ohio Popcat"
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    else
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Island.FloppaIsland
                            .Popcat_Clickable
                            .Part.Position)
                    end
                else
                    notify("Hiru Hub Notification", "You Have PopCat Sword", 10)
                    Options["Auto Get Pop Cat Weapon"]:SetValue(false)
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if Config.CoolQuest then
                if game:GetService("Players").LocalPlayer.Items.Weapon.Floppa.Value == 0 then
                    if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                        getquestmisc("Cool Floppa Quest")
                    else
                        if workspace.Island.FloppaIsland:FindFirstChild("Lava Floppa") then
                            plr.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Island.FloppaIsland
                                :FindFirstChild(
                                    "Lava Floppa").WorldPivot.Position)
                            local MobMisc = workspace.Island.FloppaIsland:FindFirstChild("Lava Floppa")
                            if MobMisc then
                                if plr:DistanceFromCharacter(MobMisc.ClickPart.Position) < 8 then
                                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == true then
                                        fireproximityprompt(MobMisc.ClickPart.ProximityPrompt)
                                    end
                                end
                            end
                        end
                    end
                else
                    notify("Hiru Hub Notification", "You Have Floppa Sword", 10)
                    Options["Cool Floppa Quest"]:SetValue(false)
                end
            end
        end
    end)

    spawn(function()
        while wait() do
            if Config.Store then
                for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                    if v:FindFirstChild("Script") then
                        equiptool(v.Name)
                        local args = {
                            [1] = "Eatable_Power",
                            [2] = {
                                ["Action"] = "Store",
                                ["Tool"] = workspace.Character[game.Players.LocalPlayer.Name][tostring(v.Name)]
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild(
                                "Modules")
                            :FireServer(unpack(args))
                    end
                end
            end
        end
    end)
    MiscTab:AddToggle("Auto Store", {
        Title = "Auto Store",
        Description = "Auto Store",
        Default = Config.Store,
        Callback = function(v)
            Config.Store = v
            Save()
        end
    })
    MiscTab:AddToggle("Random Fruit", {
        Title = "Random Fruit",
        Description = "Random Fruit",
        Default = Config.RandomFruit,
        Callback = function(v)
            Config.RandomFruit = v
            Save()
        end
    })
    MiscTab:AddToggle("Bring Power Fruit", {
        Title = "Bring Power Fruit",
        Description = "Bring Power Fruit",
        Default = Config.Bringpf,
        Callback = function(v)
            Config.Bringpf = v
            Save()
        end
    })
    spawn(function()
        while wait() do
            if Config.Bringpf then
                for i, v in next, workspace.Dropped_Items:GetChildren() do
                    if v and v.ToolTip == "Power" then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Handle, 0)
                    end
                end
            end
        end
    end)
    local ahihi
    local gemneed
    local belineed
    spawn(function()
        while wait() do
            if Config.Quantity == "x1" then
                ahihi = "Once"
                gemneed = 25
                belineed = 25000
            elseif Config.Quantity == "x3" then
                ahihi = "Triple"
                gemneed = 25 * 3
                belineed = 25000 * 3
            else
                ahihi = "Decuple"
                gemneed = 25 * 10
                belineed = 25000 * 10
            end
        end
    end)
    spawn(function()
        while wait() do
            if Config.RandomFruit then
                if Config["MethodGacha"] == "Gem" then
                    local args = {
                        [1] = "Random_Power",
                        [2] = {
                            ["Type"] = ahihi,
                            ["NPCName"] = "Doge Gacha",
                            ["GachaType"] = "Gem"
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "Modules"):FireServer(unpack(args))
                elseif Config["MethodGacha"] == "Money" then
                    local args = {
                        [1] = "Random_Power",
                        [2] = {
                            ["Type"] = ahihi,
                            ["NPCName"] = "Floppa Gacha",
                            ["GachaType"] = "Money"
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild("Modules"):FireServer(unpack(args))
                else
                    if game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value < gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Doge Gacha",
                                ["GachaType"] = "Gem"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild(
                                "Modules"):FireServer(unpack(args))
                    elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value < belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Floppa Gacha",
                                ["GachaType"] = "Gem"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Floppa Gacha",
                                ["GachaType"] = "Money"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    end
                end
            end
        end
    end)
    MiscTab:AddDropdown("Select Method Gacha", {
        Title = "Select Method Gacha",
        Description = "Select Method Gacha",
        Values = { "Money", "Gem", "Both" },
        Multi = false,
        Default = Config.MethodGacha,
        Callback = function(v)
            Config["MethodGacha"] = v
            Save()
        end
    })
    MiscTab:AddDropdown("Select Quantity (x1, x3, x10)", {
        Title = "Select Quantity (x1, x3, x10)",
        Description = "Select Quantity (x1, x3, x10)",
        Values = { "x1", "x3", "x10" },
        Multi = false,
        Default = Config.Quantity,
        Callback = function(v)
            Config["Quantity"] = v
            Save()
        end
    })
    MiscTab:AddToggle("Auto Raid", {
        Title = "Auto Raid",
        Description = "Auto Raid",
        Default = Config.Raid,
        Callback = function(v)
            Config.Raid = v
            Save()
        end
    })
    function getnameraid()
        local distance = math.huge
        local name
        for i, v in next, workspace.Raids:GetChildren() do
            if (v.WorldPivot.Position - plr.Character.HumanoidRootPart.CFrame.Position).Magnitude < distance then
                distance = (v.WorldPivot.Position - plr.Character.HumanoidRootPart.CFrame.Position).Magnitude
                name = v
            end
        end
        return name
    end

    function getmobraid()
        local wave = game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Wave.Text:gsub(" ", "")
        if getnameraid() then
            for i, v in next, workspace.Raids[tostring(getnameraid())].Enemy_Location[tostring(wave)]:GetChildren() do
                return v.Name
            end
        end
    end

    function getweaponraid(type)
        local name = ""
        for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.ToolTip == type then
                return v.Name
            end
        end
        for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == type then
                return v.Name
            end
        end
    end

    function spamskill()
        pcall(function()
            spawn(function()
                useskill(getweaponraid("Power"), "Z")
                useskill(getweaponraid("Power"), "X")
                useskill(getweaponraid("Power"), "C")
                useskill(getweaponraid("Power"), "V")
            end)
            spawn(function()
                useskill(getweaponraid("Weapon"), "Z")
                useskill(getweaponraid("Weapon"), "X")
                useskill(getweaponraid("Weapon"), "C")
                useskill(getweaponraid("Weapon"), "V")
            end)
        end)
    end

    spawn(function()
        pcall(function()
            while wait() do
                local a, b = pcall(function()
                    if Config.Raid then
                        if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Visible == false or not getnameraid() then
                            if plr:DistanceFromCharacter(workspace.Region.RaidArea.CFrame.Position) > 50 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Region.RaidArea
                                    .CFrame
                            end
                        else
                            pcall(function()
                                repeat
                                    wait()
                                    for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Activated)) do
                                        v.Function()
                                    end
                                until game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Visible == false
                            end)
                            if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.TimeLeft.Visible == true then
                                for i, v in pairs(workspace.Monster:GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 350
                                        and v:FindFirstChild("Humanoid") then
                                        click = true
                                        repeat
                                            task.wait()
                                            BringMob(v)
                                            Tp(v)
                                            spawn(function()
                                                equiptool(Config.Weapon)
                                            end)
                                            spawn(function()
                                                spamskill()
                                            end)
                                            spawn(function()
                                                if v:FindFirstChild("HumanoidRootPart") then
                                                    getgenv().posaim = v.HumanoidRootPart.CFrame.Position
                                                end
                                            end)
                                        until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false or not Options["Auto Raid"].Value or not Config["Raid"]
                                        click = false
                                    end
                                end
                            end
                        end
                    end
                end)
                if b then
                    error(b)
                end
            end
        end)
    end)
    MiscTab:AddToggle("Auto Meme Beast", {
        Title = "Auto Meme Beast",
        Description = "Auto Meme Beast",
        Default = Config.MemeBeast,
        Callback = function(v)
            Config.MemeBeast = v
            Save()
        end
    })
    spawn(function()
        while wait() do
            if Config.MemeBeast then
                local MemeBeast = workspace.Monster:FindFirstChild("Meme Beast") or
                    game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Meme Beast")
                if MemeBeast and not getnameraid() and  game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.TimeLeft.Visible == false then
                    notify("Hiru Hub Notifcation", "Meme Beast Spawned", 10)
                    Tp(MemeBeast)
                    click = true
                    repeat
                        task.wait()
                        Tp(MemeBeast)
                        spawn(function()
                            equiptool(Config.Weapon)
                        end)
                        spawn(function()
                            spamskill()
                        end)
                        spawn(function()
                            if MemeBeast:FindFirstChild("HumanoidRootPart") then
                                getgenv().posaim = MemeBeast.HumanoidRootPart.CFrame.Position
                            end
                        end)
                    until not MemeBeast or not MemeBeast.Humanoid or MemeBeast.Humanoid.Health <= 0 or not Options["Auto Meme Beast"].Value or not Config["MemeBeast"]
                    click = false
                end
            end
        end
    end)
    ShopTab:AddButton({
        Title = "Instinct",
        Callback = function()
            local args = {
                [1] = "Ability_Teacher",
                [2] = "Nugget Man"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Aura",
        Callback = function()
            local args = {
                [1] = "Ability_Teacher",
                [2] = "Aura Master"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Flash Step",
        Callback = function()
            local args = {
                [1] = "Ability_Teacher",
                [2] = "Giga Chad"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Pumpkin Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Gravestone"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Katana Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Doge"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Hiru Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Smiling Cat"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Bonk Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Meme Man"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Flame Katana Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Meme Man"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
    ShopTab:AddButton({
        Title = "Hanger Weapon",
        Callback = function()
            local args = {
                [1] = "Weapon_Seller",
                [2] = "Hanger"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                "Modules"):FireServer(unpack(args))
        end
    })
end
game.StarterGui:SetCore("SendNotification", {
Title = "Hiru Hub",
Text = "Successfully",
Duration = 5,
})
