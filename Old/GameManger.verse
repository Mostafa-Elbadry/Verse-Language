# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }
# using { /UnrealEngine.com/Temporary/UI }
# using { /Fortnite.com/Characters }
# using { /Verse.org/Random }
# using { /UnrealEngine.com/Temporary/SpatialMath }
# using { /Verse.org/Simulation/Tags }


# Playerspawner := class(tag){}

# GameManger := class(creative_device):

#     var Players : []player = array{}

#     @editable
#     WeaponGranters : []item_granter_device = array{}
#     @editable
#     MiniGamesTriggers : trigger_device = trigger_device{}

#     @editable
#     EndGame : end_game_device = end_game_device{}

#     # var MiniGamesStartCanvas : canvas = canvas{}
#     MaybePlayerUI<internal> : ?player_ui = false

#     var MiniGamesUIDevice : MiniGamesUI = MiniGamesUI{}  
#     var MiniGamesDevice : MiniGames = MiniGames{}  

#     OnBegin<override>()<suspends> : void =
#         InitializePlayers()
#         # MiniGamesTriggers.TriggeredEvent.Subscribe(GameMode001)
           


#     InitializePlayers()<suspends>: void=
#         AllPlayers := GetPlayspace().GetPlayers()
#         for(Player :AllPlayers, FortCharacter := Player.GetFortCharacter[],PlayerUI := GetPlayerUI[Player]):
#             # MiniGamesUiStart(Player)
#             set MiniGamesUIDevice = MiniGamesUI{MaybePlayerUI := option{PlayerUI}}
#             MiniGamesUIDevice.GenerateRandomGameMode()
#             MiniGamesUIDevice.StartCountdown(Player)

#             MiniGamesUIDevice.CountdownEndedEvent.Await()
#             MiniGamesUIDevice.HandleTheVoteCount()
#             GrantWeapon(MiniGamesUIDevice.WinnerMiniGameIs) 
#             MiniGamesStart(Player)

#             Sleep(15.0)
#             EndGame.Activate(Player)    
  

#     MiniGamesUiStart(Player: player)<suspends>:void=
#         # AllPlayers := GetPlayspace().GetPlayers()
#         # for(Playerx :AllPlayers,PlayerUI := GetPlayerUI[Playerx]):
#         # if:
#         #     FirstPlayer := Self.GetPlayspace().GetPlayers()[0]
#         #     PlayerUI := GetPlayerUI[FirstPlayer]
#         # then:

#         # AllPlayers := GetPlayspace().GetPlayers()
#         # for (Playerx : AllPlayers, FortCharacter := Player.GetFortCharacter[], Agent := FortCharacter.GetAgent[],PlayerUI := GetPlayerUI[Playerx]):
   
    
#         #     set MiniGamesUIDevice = MiniGamesUI{MaybePlayerUI := option{PlayerUI}}
#             MiniGamesUIDevice.GenerateRandomGameMode()
#             MiniGamesUIDevice.StartCountdown(Player)

#             MiniGamesUIDevice.CountdownEndedEvent.Await()
     

#     MiniGamesStart(Player: player)<suspends>:void=
#         if:
#             FirstPlayer := Self.GetPlayspace().GetPlayers()[0]
#             PlayerUI := GetPlayerUI[player[FirstPlayer]]
#         then:
#             set MiniGamesDevice = MiniGames{MaybePlayerUI := option{PlayerUI}}
#             MiniGamesDevice.StartMiniGame()

#     GrantWeapon (WeaponValue: int) : void=
#         AllPlayers := GetPlayspace().GetPlayers() 
#         for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
#             if(ItemGranter := WeaponGranters[WeaponValue]):
#                 ItemGranter.GrantItem(Player)

