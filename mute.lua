local Player1 = game.Players.LocalPlayer
local PlayerService = game:GetService("Players")

local Data = game:GetService("HttpService"):JSONDecode(readfile("Data.JSON"))

local maxIndex = 0
for i in pairs(Data) do
  maxIndex = i
  print(maxIndex)
end

local UI_Holder = Instance.new("ScreenGui", Player1.PlayerGui)
UI_Holder.Name = "Mut3r"

local MainUI = Instance.new("Frame", UI_Holder)
MainUI.Name = "MainUI"
MainUI.Size = UDim2.new(0.35, 0, 0.5, 0)
MainUI.Position = UDim2.new(0.3, 0, 0.2, 0)
MainUI.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
local Corner1 = Instance.new("UICorner", MainUI)
Corner1.CornerRadius = UDim.new(0.1,2)


local NameEntry = Instance.new("TextBox", MainUI)
NameEntry.Name = "NameEntry"
NameEntry.Size = UDim2.new(0.875, 0, 0.15, 0)
NameEntry.Position = UDim2.new(0.07, 0, 0.09, 0)
NameEntry.BackgroundColor3 =Color3.fromRGB(90,90,90)
NameEntry.TextColor3 = Color3.fromRGB(150, 150, 150)
NameEntry.Text = ""
NameEntry.PlaceholderText = "Name..."
NameEntry.TextScaled = true
local Corner3 = Instance.new("UICorner", NameEntry)
Corner3.CornerRadius = UDim.new(0.2,3)

local TimeEntry = Instance.new("TextBox", MainUI)
TimeEntry.Name = "Entry"
TimeEntry.Size = UDim2.new(0.875, 0, 0.15, 0)
TimeEntry.Position = UDim2.new(0.07, 0, 0.3, 0)
TimeEntry.BackgroundColor3 =Color3.fromRGB(90,90,90)
TimeEntry.TextColor3 = Color3.fromRGB(150, 150, 150)
TimeEntry.Text = ""
TimeEntry.PlaceholderText = "Time (in seconds)"
TimeEntry.TextScaled = true
local Corner4 = Instance.new("UICorner", TimeEntry)
Corner4.CornerRadius = UDim.new(0.2,3)

local ReasonEntry = Instance.new("TextBox", MainUI)
ReasonEntry.Name = "Entry"
ReasonEntry.Size = UDim2.new(0.875, 0, 0.15, 0)
ReasonEntry.Position = UDim2.new(0.07, 0, 0.51, 0)
ReasonEntry.BackgroundColor3 =Color3.fromRGB(90,90,90)
ReasonEntry.TextColor3 = Color3.fromRGB(150, 150, 150)
ReasonEntry.Text = ""
ReasonEntry.PlaceholderText = "Reason..."
ReasonEntry.TextScaled = true
local Corner4 = Instance.new("UICorner", ReasonEntry)
Corner4.CornerRadius = UDim.new(0.2,3)

local Confirm = Instance.new("TextButton", MainUI)
Confirm.Size = UDim2.new(0.35,0,0.2, 0)
Confirm.Position = UDim2.new(0.35, 0, 0.72, 0)
Confirm.BackgroundColor3 = Color3.fromRGB(56,57,61)
Confirm.Text = "Mute"
Confirm.TextScaled = true
Confirm.TextColor3 = Color3.fromRGB(140, 140, 140)
local Corner2 = Instance.new("UICorner", Confirm)
Corner2.CornerRadius = UDim.new(0.2,2)


local MuteHistory = Instance.new("Frame", UI_Holder)
MuteHistory.Name = "MainUI"
MuteHistory.Size = UDim2.new(0.35, 0, 0.5, 0)
MuteHistory.Position = UDim2.new(0.3, 0, 0.2, 0)
MuteHistory.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
MuteHistory.Visible = false
local Corner1 = Instance.new("UICorner", MuteHistory)
Corner1.CornerRadius = UDim.new(0.1,2)

local HistoryScroll = Instance.new("ScrollingFrame", MuteHistory)
HistoryScroll.Size = UDim2.new(0.82, 0, 0.85, 0)
HistoryScroll.Position = UDim2.new(0.1, 0, 0.12, 0)
HistoryScroll.Transparency = 1
HistoryScroll.ScrollingDirection = 2

local Escape = Instance.new("TextButton", UI_Holder)
Escape.Name = "Exit"
Escape.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Escape.Size = UDim2.new(0.035, 0, 0.08, 0)
Escape.Position = UDim2.new(0.95, 0, 0.2, 0)
Escape.RichText = true
Escape.Text = "<b>-</b>"
Escape.TextScaled = true
Escape.TextColor3 = Color3.fromRGB(200, 200, 200)
local Corner5 = Instance.new("UICorner", Escape)
Corner5.CornerRadius = UDim.new(0.2,3)


local UISwap = Instance.new("TextButton", UI_Holder)
UISwap.Name = "Swap"
UISwap.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
UISwap.Size = UDim2.new(0.08, 0, 0.08, 0)
UISwap.Position = UDim2.new(0.3, 0, 0.16, 0)
UISwap.RichText = true
UISwap.Text = "History"
UISwap.TextScaled = true
UISwap.TextColor3 = Color3.fromRGB(200, 200, 200)
local Corner5 = Instance.new("UICorner", UISwap)
Corner5.CornerRadius = UDim.new(0.2,3)

local Visibility = true

function Refresh()
  HistoryScroll:ClearAllChildren()
  local ListLayout = Instance.new("UIListLayout")
  ListLayout.Parent = HistoryScroll
  ListLayout.FillDirection = 1
  ListLayout.Padding = UDim.new(0.01, 0)
  for _,PlayerMuteData in Data do
    local Holder = Instance.new("Frame", HistoryScroll)
    Holder.Size = UDim2.new(0.9, 0, 0.14, 0)
    Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    local Corner = Instance.new("UICorner", Holder)
    Corner.CornerRadius = UDim.new(0.3, 0)
    
    local DataBox = Instance.new("TextLabel", Holder)
    DataBox.Size = UDim2.new(1, 0, 0.8, 0)
    DataBox.TextScaled = true
    DataBox.RichText = true
    DataBox.BackgroundTransparency = 1
    DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
    print(game:GetService("HttpService"):JSONEncode(PlayerMuteData))
    DataBox.Text = "Player: " ..PlayerMuteData["PlayerName"] .. "(" .. PlayerMuteData["PlayerID"] .. ")\nDate: " .. PlayerMuteData["Date"] .. "\nLength: " .. PlayerMuteData["Time"] .. "\nReason: " .. PlayerMuteData["Reason"]
    --HistoryScroll.AutomaticSize = 2
  end
end


local function Execute()
  local Name = NameEntry.Text
  local ID = tostring(PlayerService:GetUserIdFromNameAsync(Name))
  local Length = tonumber(TimeEntry.Text)
  local Timestamp = os.date("%c")
  local Reason1 = ReasonEntry.Text
  
  print(Name .. " " .. ID .. " " .. Length .. " " .. Timestamp .. " " .. Reason1)
  game.ReplicatedStorage.Remotes.Messenger:FireServer("/cmd mute " .. ID .. " " .. Length)

  if math.floor(Length/3600) >= 1 then
    LengthString = tostring(math.floor(Length/3600)) .. "h " .. (tostring(math.floor(Length/60) - 60*math.floor(Length/3600))) .. "m " .. tostring(Length - (60*math.floor(Length/60) - 3600*math.floor(Length/3600))) .. "s"
  else
    LengthString = tostring(math.floor(Length/60)) .. "m " .. tostring(Length - 60*math.floor(Length/60))
  end
  
  local MuteData = {
      PlayerName = tostring(Name),
      PlayerID = tostring(ID),
      Time = LengthString,
      Date = tostring(Timestamp),
      Reason = tostring(Reason1)
    }
  
  local JSONCode = game:GetService("HttpService"):JSONEncode(MuteData)
  
  print(JSONCode)
  
  Data[tostring(maxIndex+1)] = MuteData
  maxIndex += 1
  print(game:GetService("HttpService"):JSONEncode(Data))
  local JSON = game:GetService("HttpService"):JSONEncode(Data)
  writefile("data.JSON", JSON)
  Refresh()
end

local function HideUI()
  if Visibility == true then
    Visibility = false
    MainUI.Visible = false
    MuteHistory.Visible = false
    Escape.Text = "<b>+</b>"
    UISwap.Text = "History"
    UISwap.Visible = false
  else
    Visibility = true
    MainUI.Visible = true
    MuteHistory.Visible = false
    Escape.Text = "<b>-</b>"
    UISwap.Visible = true
  end
end

local function ChangeUI()
  MainUI.Visible = not MainUI.Visible
  MuteHistory.Visible = not MuteHistory.Visible
  UISwap.Text = "History"
  if not MainUI.Visible then
    UISwap.Text = "Mute"
  end
end

Refresh()
UISwap.Activated:Connect(ChangeUI)
Confirm.Activated:Connect(Execute)
Escape.Activated:Connect(HideUI)
