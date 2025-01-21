local PlayerService = game:GetService("Players")

local Data = game:GetService("HttpService"):JSONDecode(readfile("Data.JSON"))
local playerStats = game:GetService("HttpService"):JSONDecode(readfile("playerStatsAll.JSON"))
local RouletteList = {
  Room1 = {},
  Room2 = {},
  Room3 = {}
  
}

print("v5.1.10")

local bjActive = {}
local Hands = {}
local betAmounts = {}
local Listening = true


function listHandler(method, list)
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

function standHandler(player)
  wait(1)
  print(player)
  print(game:GetService("HttpService"):JSONEncode(Hands))
  local DealerSum = tonumber(listHandler("sum", Hands[player]["Dealer"]))
  local PlayerSum = tonumber(listHandler("sum", Hands[player]["Players"]))

  local DealerHand = listHandler("strconv", Hands[player]["Dealer"])
  local PlayerHand = listHandler("strconv", Hands[player]["Players"])

  if DealerSum >= 17 and PlayerSum > DealerSum and DealerSum <= 21 or DealerSum > 21 then
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player .. " won blackjack!")
    playerStats[player]["Money"] += 2*betAmounts[player]
    playerStats[player]["GamesWon"] += 1

    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStatsAll.JSON",JSON)
    bjActive[player] = false
  end

  if DealerSum >= 17 and PlayerSum < DealerSum and DealerSum <= 21 then
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player .. " lost blackjack...")
    bjActive[player] = false
    playerStats[player]["GamesLost"] += 1
  end

  if DealerSum >= 17 and PlayerSum == DealerSum then
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(player .. " didn't lose, but they didnt win.")
    playerStats[player]["Money"] += betAmounts[player]
    playerStats[player]["GamesDrawn"] += 1
    bjActive[player] = false
  end

  if DealerSum < 17 then
    table.insert(Hands[player]["Dealer"], math.random(1,11))
    standHandler(player)
  end
end

function CommandHandler(Message)

  if not Listening then
    return
  end

  local Player = PlayerService:GetNameFromUserIdAsync(Message.TextSource.UserId)
  
  if Message:match("^/helper") then
    wait(2)
    newMSG = string.gsub(Message, "/helper", "")
    newMSG = string.gsub(newMSG, " ", "")
    
    if not playerStats[Player]then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player ..". Please create a save by using the command /createsave to use any other commands.")
    end
    
    if newMSG == "" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer([[
        Commands are:
        /join: Joins the mute roulette lobby.
        /leave: Exits the mute roulette lobby.
        /get [stat]: Tells you how much [stat] you have
        /reset Money: Brings you back to 100 Money
        /blackjack [Money]: Risks anamount of Money on blackjack.
        /helper (command): Tells you about commands
        (/helper with command specified must have parameters)]])
      return
    end
    
    if newMSG == "get" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/get [stat]: Tells you how much stat you have. Current valid paramaters are: Money (Unusable), wins, losses, draws, played.")
    end

    if newMSG == "blackjack" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/blackjack [Money]: Risks an amount of Money on blackjack. Your Money: " .. playerStats[Player]["Money"] .. ". Subcommands: /hit, /stand.")
    end
  end

  if Message == "/disconnect" and Player == "hax_yo" then
    Listening = false
    wait(1)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Bot no longer listening.")
  end

  if Message:match("^/blackjack") then
    wait(1)
    if not playerStats[Player] then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Couldnt find save for " .. Player .. " Please run /createsave.")
      return
    end

    if bjActive[Player] == true then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You are already playing a round of blackjack")
      return
    end
    
    local bet = string.gsub(Message, "/blackjack ", "")
    betAmounts[Player] = tonumber(bet)
    
    if betAmounts[Player] == nil then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Please enter an amount you would like to bet.")
      return
    end
      
    if betAmounts[Player] > tonumber(playerStats[Player]["Money"]) then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You don't have that many Money")
      return
    end

    bjActive[Player] = true

    playerStats[Player]["Money"] -= betAmounts[Player]

    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStatsAll.JSON",JSON)

    Hands[Player] = {
      Dealer = {math.random(1,11), math.random(1,11)},
      Players = {math.random(1,11), math.random(1,11)},
    }

    local DealerSum = tonumber(listHandler("sum", Hands[Player]["Dealer"]))
    local PlayerSum = tonumber(listHandler("sum", Hands[Player]["Players"]))

    local DealerHand = listHandler("strconv", Hands[Player]["Dealer"])
    local PlayerHand = listHandler("strconv", Hands[Player]["Players"])

    print(Player)

    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Dealer's Hand: " .. DealerHand .. " || " .. Player .. [['s Hand: ]] .. PlayerHand)

    wait(2)

    if PlayerSum == 21 then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You scored blackjack! Insane, " .. Player .. "!")
      playerStats[Player]["Money"] += 2.5*betAmounts[Player]
      playerStats[player]["GamesWon"] += 1

      local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
      writefile("playerStatsAll.JSON",JSON)
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
    
    
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Dealer's Hand: " .. DealerHand .. " || " .. Player .. [['s Hand: ]] .. PlayerHand)

    wait(2)
    if PlayerSum == 21 then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Sigma. You won " .. Player .. ".")
      playerStats[Player]["Money"] += 2*betAmounts[Player]
      playerStats[player]["GamesWon"] += 1

      local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
      writefile("playerStatsAll.JSON",JSON)
      bjActive[Player] = false
      return
    end

    if PlayerSum > 21 then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Common L. Sorry " .. Player .. ".")
      bjActive[Player] = false
      playerStats[player]["GamesLost"] += 1
      return
    end
  end

  if Message == "/stand" and bjActive[Player] then
    standHandler(Player)
  end
  
  if Message:match("^/get") and playerStats[Player] then
    if not playerStats[Player] then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Couldnt find save for " .. Player .. " Please run /createsave.")
      return
    end
    StatToCheck = string.gsub(Message, "/get ", "")
    wait(3)

    if StatToCheck == "draws" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player .. " has " .. playerStats[Player]["Money"] .. " Money.")
    end
    
    if StatToCheck == "Money" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player .. " has " .. playerStats[Player]["Money"] .. " Money.")
    end
    
    if StatToCheck == "wins" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player .. " has " .. playerStats[Player]["GamesWon"] .. " wins.")
    end
    
    if StatToCheck == "losses" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player .. " has " .. playerStats[Player]["GamesLost"] .. " losses.")
    end
    
    if StatToCheck == "played" then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player .. " has " .. playerStats[Player]["GamesPlayed"] .. " games played.")
    end
  end
  
  if Message:match("^/createsave") and not playerStats[Player] then
    local playerSave = {
      Money = 100,
      GamesPlayed = 0,
      GamesWon = 0,
      GamesLost = 0,
    }
    
    playerStats[Player] = playerSave
    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStatsAll.JSON",JSON)
    wait(5)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Created new save for: " .. Player)
  end

  if Message == "/reset money" then
    playerStats[Player]["Money"] = 1000
    local JSON = game:GetService("HttpService"):JSONEncode(playerStats)
    writefile("playerStatsAll.JSON",JSON)
    wait(2)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Reset money for: " .. Player)
  end
end

local chatListener = game.GetService("TextChatService").OnIncomingMessage = CommandHandler()
