local Player1 = game.Players.LocalPlayer
local PlayerService = game:GetService("Players")

local Data = game:GetService("HttpService"):JSONDecode(readfile("Data.JSON"))
local playerStats = game:GetService("HttpService"):JSONDecode(readfile("playerStats.JSON"))
local RouletteList = {
  Room1 = {},
  Room2 = {},
  Room3 = {}
  
}

local maxIndex = 0
for i in pairs(Data) do
  maxIndex = i
  print(maxIndex)
end

local UI_Holder = Instance.new("ScreenGui", Player1.PlayerGui)
UI_Holder.Name = "Mut3r"

print("v5.1.2")

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

local RouletteScroll = Instance.new("ScrollingFrame", RouletteFrame)
RouletteScroll.Size = UDim2.new(0.872, 0, 0.75, 0)
RouletteScroll.Position = UDim2.new(0.1, 0, 0.221, 0)
RouletteScroll.Transparency = 1
RouletteScroll.ScrollingDirection = 2

local RouletteAccept = Instance.new("TextButton", RouletteFrame)
RouletteAccept.Name = "Entry"
RouletteAccept.Size = UDim2.new(0.875, 0, 0.15, 0)
RouletteAccept.Position = UDim2.new(0.07, 0, 0.05, 0)
RouletteAccept.BackgroundColor3 =Color3.fromRGB(90,90,90)
RouletteAccept.TextColor3 = Color3.fromRGB(150, 150, 150)
RouletteAccept.Text = "Play"
RouletteAccept.TextScaled = true
local Corner4 = Instance.new("UICorner", RouletteAccept)
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
RouletteSwap.Position = UDim2.new(0.39, 0, 0.16, 0)
RouletteSwap.RichText = true
RouletteSwap.Text = "Roulette"
RouletteSwap.TextScaled = true
RouletteSwap.TextColor3 = Color3.fromRGB(200, 200, 200)
local Corner5 = Instance.new("UICorner", RouletteSwap)
Corner5.CornerRadius = UDim.new(0.2,3)
--------------------------------------------------------------------
local Visibility = true
local bjActive = {}
local Hands = {}
local RouletteLength = 1
local betAmounts = {}
local Listening = true


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

function listHandler(method, list)
  print(method)
  if method == "sum" then
    local Sum = 0
    for i,v in pairs(list) do
      Sum = Sum+v
    end
    return Sum
  end

  if method == "strconv" then
    local string = ""
    for i,v in pairs(list) do
      string = string .. v .. " "
    end
    return string
  end
end

function standHandler(Player)
  wait(1)
  print(Player)
  print(Hands[Player]["Dealer"])
  local DealerSum = tonumber(listHandler("sum", Hands[Player]["Dealer"]))
  local PlayerSum = tonumber(listHandler("sum", Hands[Player]["Players"]))

  local DealerHand = listHandler("strconv", Hands[Player]["Dealer"])
  local PlayerHand = listHandler("strconv", Hands[Player]["Players"])

  if DealerSum >= 17 and PlayerSum > DealerSum then
    game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " won blackjack!")
    playerStats[Player]["Seconds"] += 2*betAmounts[Player]

    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStats.JSON",JSON)
    bjActive = false
  end

  if DealerSum >= 17 and PlayerSum < DealerSum then
    game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " lost blackjack...")
    bjActive = false
  end

  if DealerSum >= 17 and PlayerSum == DealerSum then
    game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " didn't lose, but they didnt win.")
  end

  if DealerSum < 17 then
    table.insert(Hands[Player]["Dealer"], math.random(1,11))
    standHandler()
  end
end

local function RouletteCommandHandler(_, Player, Message)

  if not Listening then
    return
  end
  
  if Message:match("^/helper") then
    wait(2)
    newMSG = string.gsub(Message, "/helper", "")
    newMSG = string.gsub(newMSG, " ", "")
    
    if not playerStats[Player]then
      game.ReplicatedStorage.Remotes.Messenger:FireServer(Player ..". Please create a save by using the command /createsave to use any other commands.")
    end
    
    if newMSG == "" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer([[
        Commands are:
        /join: Joins the mute roulette lobby.
        /leave: Exits the mute roulette lobby.
        /get [stat]: Tells you how much [stat] you have
        /blackjack [seconds]: Risks anamount of seconds on blackjack.
        /helper (command): Tells you about commands
        (/helper with command specified must have parameters)]])
      return
    end
    
    if newMSG == "get" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("/get [stat]: Tells you how much stat you have. Current valid paramaters are: Seconds (Unusable), wins, losses, played.")
    end

    if newMSG == "blackjack" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("/blackjack [seconds]: Risks an amount of seconds on blackjack. Your seconds: " .. playerStats[Player]["Seconds"] .. ". Subcommands: /hit, /stand.")
    end
  end

  if Message == "/disconnect" and Player == "hax_yo" then
    Listening = false
    game.ReplicatedStorage.Remotes.Messenger:FireServer("Bot no longer listening.")
  end

  if Message:match("^/blackjack") then
    bjActive[Player] = false
    print(bjActive[Player])
    wait(1)
    if not playerStats[Player] then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Couldnt find save for " .. Player .. " Please run /createsave.")
      return
    end

    if bjActive[Player] == true then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("You are already playing a round of blackjack")
      return
    end
    
    local bet = string.gsub(Message, "/blackjack ", "")
    betAmounts[Player] = tonumber(bet)
    
    if betAmounts[Player] == nil then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Please enter an amount you would like to bet.")
      return
    end
      
    if betAmounts[Player] > tonumber(playerStats[Player]["Seconds"]) then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("You don't have that many seconds")
      return
    end

    bjActive[Player] = true

    playerStats[Player]["Seconds"] -= betAmounts[Player]

    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStats.JSON",JSON)

    Hands[Player] = {
      Dealer = {math.random(1,11), math.random(1,11)},
      Players = {math.random(1,11), math.random(1,11)},
    }

    local DealerSum = tonumber(listHandler("sum", Hands[Player]["Dealer"]))
    local PlayerSum = tonumber(listHandler("sum", Hands[Player]["Players"]))

    local DealerHand = listHandler("strconv", Hands[Player]["Dealer"])
    local PlayerHand = listHandler("strconv", Hands[Player]["Players"])

    game.ReplicatedStorage.Remotes.Messenger:FireServer("Dealer's Hand: " .. DealerHand .. " || " .. Player .. [['s Hand: ]] .. PlayerHand)

    wait(2)

    if DealerSum == 21 and not PlayerSum == 21 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Dealer scored blackjack. Sorry " .. Player .. ".")
      playerStats[Player]["Seconds"] -= betAmounts[Player]

      local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
      writefile("playerStats.JSON",JSON)
      bjActive[Player] = false
    end

    if DealerSum == 21 and PlayerSum == 21 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("You both scored blackjack. At least you didn't lose, " .. Player .. ".")
      bjActive[Player] = false
    end

    if not DealerSum == 21 and PlayerSum == 21 or DealerSum > 21 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("You scored blackjack! Insane, " .. Player .. "!")
      playerStats[Player]["Seconds"] += 2.5*betAmounts[Player]

      local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
      writefile("playerStats.JSON",JSON)
      bjActive[Player] = false
    end
  end

  if Message == "/hit" and bjActive[Player] then
    wait(1)
    table.insert(Hands[Player]["Players"], math.random(1,11))

    local DealerSum = tonumber(listHandler("sum", Hands[Player]["Dealer"]))
    local PlayerSum = tonumber(listHandler("sum", Hands[Player]["Players"]))
    print(PlayerSum .. " " .. DealerSum)

    local DealerHand = listHandler("strconv", Hands[Player]["Dealer"])
    local PlayerHand = listHandler("strconv", Hands[Player]["Players"])
    
    
    game.ReplicatedStorage.Remotes.Messenger:FireServer("Dealer's Hand: " .. DealerHand .. " || " .. Player .. [['s Hand: ]] .. PlayerHand)

    wait(2)
    if PlayerSum == 21 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Sigma. You won " .. Player .. ".")
      playerStats[Player]["Seconds"] += 2*betAmounts[Player]

      local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
      writefile("playerStats.JSON",JSON)
      bjActive[Player] = false
      return
    end

    if PlayerSum > 21 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Common L. Sorry " .. Player .. ".")
      bjActive[Player] = false
      return
    end
  end

  if Message == "/stand" and bjActive[Player] then
    standHandler(Player)
  end
    
  if Message == "/join" and not table.find(RouletteList["Room1"], Player) then
    if not playerStats[Player] then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Couldnt find save for " .. Player .. " Please run /createsave.")
      return
    end
    
    table.insert(RouletteList["Room1"], Player)
    
    RouletteScroll:ClearAllChildren()
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = RouletteScroll
    ListLayout.FillDirection = 1
    ListLayout.Padding = UDim.new(0.01, 0)
    
    for _, Participant in RouletteList["Room1"] do
      local Holder = Instance.new("Frame", RouletteScroll)
      Holder.Size = UDim2.new(0.94, 0, 0.17, 0)
      Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      local Corner = Instance.new("UICorner", Holder)
      Corner.CornerRadius = UDim.new(0.3, 0)
      
      local DataBox = Instance.new("TextLabel", Holder)
      DataBox.Size = UDim2.new(1, 0, 0.8, 0)
      DataBox.TextScaled = true
      DataBox.RichText = true
      DataBox.BackgroundTransparency = 1
      DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
      DataBox.Text = Participant
      RouletteScroll.AutomaticCanvasSize = 3
    end
  end
  
  if Message == "/leave" and table.find(RouletteList["Room1"], Player) then
    local playerIndex = table.find(RouletteList["Room1"], Player)
    table.remove(RouletteList["Room1"], tonumber(playerIndex))
    
    RouletteScroll:ClearAllChildren()
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = RouletteScroll
    ListLayout.FillDirection = 1
    ListLayout.Padding = UDim.new(0.01, 0)
    
    for _, Participant in RouletteList do
      local Holder = Instance.new("Frame", RouletteScroll)
      Holder.Size = UDim2.new(0.94, 0, 0.17, 0)
      Holder.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      local Corner = Instance.new("UICorner", Holder)
      Corner.CornerRadius = UDim.new(0.3, 0)
      
      local DataBox = Instance.new("TextLabel", Holder)
      DataBox.Size = UDim2.new(1, 0, 0.95, 0)
      DataBox.TextScaled = true
      DataBox.RichText = true
      DataBox.BackgroundTransparency = 1
      DataBox.TextColor3 = Color3.fromRGB(150, 150, 150)
      DataBox.Text = Participant
      RouletteScroll.AutomaticCanvasSize = 3
    end
  end
  
  if Message:match("^/get") and playerStats[Player] then
    if not playerStats[Player] then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Couldnt find save for " .. Player .. " Please run /createsave.")
      return
    end
    StatToCheck = string.gsub(Message, "/get ", "")
    wait(3)
    if StatToCheck == "seconds" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " has " .. playerStats[Player]["Seconds"] .. " seconds.")
    end
    
    if StatToCheck == "wins" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " has " .. playerStats[Player]["GamesWon"] .. " wins.")
    end
    
    if StatToCheck == "losses" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " has " .. playerStats[Player]["GamesLost"] .. " losses.")
    end
    
    if StatToCheck == "played" then
      game.ReplicatedStorage.Remotes.Messenger:FireServer(Player .. " has " .. playerStats[Player]["GamesPlayed"] .. " games played.")
    end
  end

  if Message:match("^/set time") and Player == "hax_yo" then
    RouletteLength = tonumber(string.gsub(Message, "/set time", ""))
    if RouletteLength <= 3600 then
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Length set to: " .. RouletteLength .. "s")
    else
      game.ReplicatedStorage.Remotes.Messenger:FireServer("Invalid Length")
    end
  end
  
  if Message:match("^/createsave") and not playerStats[Player] then
    local playerSave = {
      Seconds = 100,
      GamesPlayed = 0,
      GamesWon = 0,
      GamesLost = 0,
    }
    
    playerStats[Player] = playerSave
    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStats.JSON",JSON)
    wait(5)
    game.ReplicatedStorage.Remotes.Messenger:FireServer("Created new save for: " .. Player)
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
  
  maxIndex += 1
  Data[tostring(maxIndex)] = MuteData
  local JSON = game:GetService("HttpService"):JSONEncode(Data)
  print(JSON)
  writefile("data.JSON", JSON)
  Refresh()
  game.ReplicatedStorage.Remotes.Messenger:FireServer("/cmd mute " .. ID .. " " .. Length)
end

local function HideUI()
  if Visibility == true then
    Visibility = false
    MainUI.Visible = false
    MuteHistory.Visible = false
    RouletteFrame.Visible = false
    Escape.Text = "<b>+</b>"
    UISwap.Text = "History"
    UISwap.Visible = false
    RouletteSwap.Visible = false
  else
    Visibility = true
    MainUI.Visible = true
    Escape.Text = "<b>-</b>"
    UISwap.Visible = true
    RouletteSwap.Visible = true
  end
end

local function HistoryChangeUI()
  if MainUI.Visible == true then
    MainUI.Visible = false
    MuteHistory.Visible = true
    RouletteFrame.Visible = false
    UISwap.Text = "Mute"
    return
  end
  
  if MuteHistory.Visible == true then
    MainUI.Visible = true
    MuteHistory.Visible = false
    RouletteFrame.Visible = false
    UISwap.Text = "History"
    return
  end
  
  if UISwap.Text == "History" then
    MainUI.Visible = false
    MuteHistory.Visible = true
    RouletteFrame.Visible = false
    UISwap.Text = "Mute"
    return
  end
  
  if UISwap.Text == "Mute" then
    MainUI.Visible = true
    MuteHistory.Visible = false
    RouletteFrame.Visible = false
    UISwap.Text = "History"
    return
  end
end

local function RouletteChangeUI()
  if RouletteFrame.Visible == false then
    MainUI.Visible = false
    MuteHistory.Visible = false
    RouletteFrame.Visible = true
    RouletteSwap.Text = "Back"
    return
  end

  if UISwap.Text == "History" and RouletteFrame.Visible == true then
    MainUI.Visible = true
    MuteHistory.Visible = false
    RouletteFrame.Visible = false
    RouletteSwap.Text = "Roulette"
    return
  end
  
  if UISwap.Text == "Mute" and RouletteFrame.Visible == true then
    MainUI.Visible = true
    MuteHistory.Visible = false
    RouletteFrame.Visible = false
    RouletteSwap.Text = "Roulette"
    return
  end
end

local function PlayRoulette()
  local totalIndex = 0
  for i,PlayerName in RouletteList["Room1"] do
    totalIndex +=1
    playerStats[PlayerName]["GamesPlayed"] += 1
    playerStats[PlayerName]["GamesWon"] += 1
  end
  
  if totalIndex <= 1 then
    return
  end
  
  local MutedPersonIndex = math.random(1, totalIndex)
  
  local Name = RouletteList["Room1"][MutedPersonIndex]
  local ID = tostring(PlayerService:GetUserIdFromNameAsync(Name))
  local Length = RouletteLength
  local Timestamp = os.date("%c")
  local Reason1 = "Lost the game..."

  game.ReplicatedStorage.Remotes.Messenger:FireServer(Name .. " has lost the game...")
  
  playerStats[Name]["GamesWon"] -= 1
  playerStats[Name]["GamesLost"] += 1
  
  wait(5)
  
  print(Name .. " " .. ID .. " " .. Length .. " " .. Timestamp .. " " .. Reason1)
  
  LengthString = tostring(math.floor(Length/60)) .. "m " .. tostring(Length - 60*math.floor(Length/60)) .. "s"
  
  local MuteData = {
      PlayerName = tostring(Name),
      PlayerID = tostring(ID),
      Time = LengthString,
      Date = tostring(Timestamp),
      Reason = tostring(Reason1)
    }
  
  maxIndex = maxIndex+1
  print(maxIndex)
  Data[tostring(maxIndex)] = MuteData
  local JSON = game:GetService("HttpService"):JSONEncode(Data)
  local PlayerJSONData = game:GetService("HttpService"):JSONEncode(playerStats)
  writefile("playerStats.JSON", PlayerJSONData)
  writefile("data.JSON", JSON)
  Refresh()
  game.ReplicatedStorage.Remotes.Messenger:FireServer("/cmd mute " .. ID .. " " .. Length)
  RouletteList["Room1"] = {}
  RouletteScroll:ClearAllChildren()
end

Refresh()

local chatListener = game.ReplicatedStorage.Remotes.Messenger.OnClientEvent:Connect(RouletteCommandHandler)

UISwap.Activated:Connect(HistoryChangeUI)
RouletteSwap.Activated:Connect(RouletteChangeUI)
Confirm.Activated:Connect(Execute)
Escape.Activated:Connect(HideUI)
RouletteAccept.Activated:Connect(PlayRoulette)
SearchBox.FocusLost:Connect(Search)
