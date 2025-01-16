local Player1 = game.Players.LocalPlayer
local PlayerService = game:GetService("Players")

local Data = game:GetService("HttpService"):JSONDecode(readfile("Data.JSON"))
local RouletteList = {}

local maxIndex = 0
for i in pairs(Data) do
  maxIndex = i
  print(maxIndex)
end

local UI_Holder = Instance.new("ScreenGui", Player1.PlayerGui)
UI_Holder.Name = "Mut3r"


--Define Main System
--------------------------------------------------------------------
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
--------------------------------------------------------------------

--Define History
--------------------------------------------------------------------
local MuteHistory = Instance.new("Frame", UI_Holder)
MuteHistory.Name = "MainUI"
MuteHistory.Size = UDim2.new(0.35, 0, 0.5, 0)
MuteHistory.Position = UDim2.new(0.3, 0, 0.2, 0)
MuteHistory.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
MuteHistory.Visible = false
local Corner1 = Instance.new("UICorner", MuteHistory)
Corner1.CornerRadius = UDim.new(0.1,2)

local HistoryScroll = Instance.new("ScrollingFrame", MuteHistory)
HistoryScroll.Size = UDim2.new(0.872, 0, 0.75, 0)
HistoryScroll.Position = UDim2.new(0.1, 0, 0.221, 0)
HistoryScroll.Transparency = 1
HistoryScroll.ScrollingDirection = 2

local SearchBox = Instance.new("TextBox", MuteHistory)
SearchBox.Name = "Entry"
SearchBox.Size = UDim2.new(0.875, 0, 0.15, 0)
SearchBox.Position = UDim2.new(0.07, 0, 0.05, 0)
SearchBox.BackgroundColor3 =Color3.fromRGB(90,90,90)
SearchBox.TextColor3 = Color3.fromRGB(150, 150, 150)
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search..."
SearchBox.TextScaled = true
local Corner4 = Instance.new("UICorner", SearchBox)
Corner4.CornerRadius = UDim.new(0.2,3)
--------------------------------------------------------------------

--Define Extras
--------------------------------------------------------------------
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

local RouletteSwap = Instance.new("TextButton", UI_Holder)
RouletteSwap.Name = "Swap"
RouletteSwap.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
RouletteSwap.Size = UDim2.new(0.08, 0, 0.08, 0)
RouletteSwap.Position = UDim2.new(0.3, 0, 0.38, 0)
RouletteSwap.RichText = true
RouletteSwap.Text = "Spin"
RouletteSwap.TextScaled = true
RouletteSwap.TextColor3 = Color3.fromRGB(200, 200, 200)
local Corner5 = Instance.new("UICorner", RouletteSwap)
Corner5.CornerRadius = UDim.new(0.2,3)
--------------------------------------------------------------------

--Define Roulette
--------------------------------------------------------------------
local RouletteFrame = Instance.new("Frame", UI_Holder)
RouletteFrame.Name = "MainUI"
RouletteFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
RouletteFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
RouletteFrame.BackgroundColor3 = Color3.fromRGB(41, 42, 46)
RouletteFrame.Visible = false
local Corner1 = Instance.new("UICorner", RouletteFrame)
Corner1.CornerRadius = UDim.new(0.1,2)
--------------------------------------------------------------------
local Visibility = true


--Define Functions
function Refresh()
  HistoryScroll:ClearAllChildren()
  local ListLayout = Instance.new("UIListLayout")
  ListLayout.Parent = HistoryScroll
  ListLayout.FillDirection = 1
  ListLayout.Padding = UDim.new(0.01, 0)
  for _,PlayerMuteData in Data do
    local Holder = Instance.new("Frame", HistoryScroll)
    Holder.Size = UDim2.new(0.94, 0, 0.35, 0)
    Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    local Corner = Instance.new("UICorner", Holder)
    Corner.CornerRadius = UDim.new(0.3, 0)
    
    local DataBox = Instance.new("TextLabel", Holder)
    DataBox.Size = UDim2.new(1, 0, 0.95, 0)
    DataBox.TextScaled = true
    DataBox.RichText = true
    DataBox.BackgroundTransparency = 1
    DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
    DataBox.Text = "Player: " ..PlayerMuteData["PlayerName"] .. "(" .. PlayerMuteData["PlayerID"] .. ")\nDate: " .. PlayerMuteData["Date"] .. "\nLength: " .. PlayerMuteData["Time"] .. "\nReason: " .. PlayerMuteData["Reason"]
    HistoryScroll.AutomaticCanvasSize = 3
  end
end

local function Search()
  HistoryScroll:ClearAllChildren()
  local ListLayout = Instance.new("UIListLayout")
  ListLayout.Parent = HistoryScroll
  ListLayout.FillDirection = 1
  ListLayout.Padding = UDim.new(0.01, 0)

  if SearchBox.Text == "" then
    for _,PlayerMuteData in Data do
      local Holder = Instance.new("Frame", HistoryScroll)
      Holder.Size = UDim2.new(0.94, 0, 0.35, 0)
      Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      local Corner = Instance.new("UICorner", Holder)
      Corner.CornerRadius = UDim.new(0.3, 0)
      
      local DataBox = Instance.new("TextLabel", Holder)
      DataBox.Size = UDim2.new(1, 0, 0.95, 0)
      DataBox.TextScaled = true
      DataBox.RichText = true
      DataBox.BackgroundTransparency = 1
      DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
      DataBox.Text = "Player: " ..PlayerMuteData["PlayerName"] .. "(" .. PlayerMuteData["PlayerID"] .. ")\nDate: " .. PlayerMuteData["Date"] .. "\nLength: " .. PlayerMuteData["Time"] .. "\nReason: " .. PlayerMuteData["Reason"]
      HistoryScroll.AutomaticCanvasSize = 3
    end
  else
    for _,PlayerMuteData in Data do
      
      if PlayerMuteData["PlayerName"]:match(SearchBox.Text) then
        
        local Holder = Instance.new("Frame", HistoryScroll)
        Holder.Size = UDim2.new(0.94, 0, 0.35, 0)
        Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        local Corner = Instance.new("UICorner", Holder)
        Corner.CornerRadius = UDim.new(0.3, 0)
        
        local DataBox = Instance.new("TextLabel", Holder)
        DataBox.Size = UDim2.new(1, 0, 0.95, 0)
        DataBox.TextScaled = true
        DataBox.RichText = true
        DataBox.BackgroundTransparency = 1
        DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
        DataBox.Text = "Player: " ..PlayerMuteData["PlayerName"] .. "(" .. PlayerMuteData["PlayerID"] .. ")\nDate: " .. PlayerMuteData["Date"] .. "\nLength: " .. PlayerMuteData["Time"] .. "\nReason: " .. PlayerMuteData["Reason"]
        HistoryScroll.AutomaticCanvasSize = 3
      end
    end
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
    LengthString = tostring(math.floor(Length/3600)) .. "h " .. (tostring(math.floor(Length/60) - 60*math.floor(Length/3600))) .. "m " .. tostring(Length - 3600*math.floor(Length/3600) - (60*math.floor(Length/60) - 3600*math.floor(Length/3600))) .. "s"
  else
    LengthString = tostring(math.floor(Length/60)) .. "m " .. tostring(Length - 60*math.floor(Length/60)) .. "s"
  end
  
  local MuteData = {
      PlayerName = tostring(Name),
      PlayerID = tostring(ID),
      Time = LengthString,
      Date = tostring(Timestamp),
      Reason = tostring(Reason1)
    }
  
  Data[tostring(maxIndex+1)] = MuteData
  maxIndex += 1
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

game.ReplicatedStorage.Remotes.Messenger.OnClientEvent:Connect(function(test_a, test_b, test_c)
    print(test_a)
    print(test_b)
    print(test_c)
    if table.find(RouletteList, Player) then
      for i,v in RouletteList do
        print(v)
      end
      return 
    else
      table.insert(RouletteList, Player)
      for i,v in RouletteList do
        print(v)
      end
    end
end)

UISwap.Activated:Connect(ChangeUI)
Confirm.Activated:Connect(Execute)
Escape.Activated:Connect(HideUI)
SearchBox.FocusLost:Connect(Search)
