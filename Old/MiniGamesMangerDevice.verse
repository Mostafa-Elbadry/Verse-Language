
# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }

# using { /Fortnite.com/Characters }

# MiniGamesMangerDevice := class(creative_device):

#     @editable
#     EndGame : end_game_device = end_game_device{}
#     @editable
#     WeaponGranters : []item_granter_device = array{}

#     var MiniGamesVotePerPlayer: [player]MiniGamesVoteDevice = map{}
#     var MiniGamesMainPerPlayer: [player]MiniGamesMainUIDevice = map{}
#     var MiniGamesUIDevice : MiniGamesVoteDevice = MiniGamesVoteDevice{} 
#     var MiniGamesVoteUIDevice : MiniGamesVoteDevice = MiniGamesVoteDevice{} 
 


#     # Runs when the device is started in a running game
#     OnBegin<override>()<suspends>:void=
#         # MiniGamesUIDevice.GenerateRandomMiniGame()
#         InitializeMiniGamesVoteUI()

#         # MiniGamesTimerEnd()


#     InitializeMiniGamesVoteUI()<suspends>:void=
#         AllPlayers := GetPlayspace().GetPlayers()
#         for(Player : AllPlayers, MiniGamesVoteUI := set MiniGamesVotePerPlayer[Player] = MiniGamesVoteDevice{},MiniGamesMainUI := set MiniGamesMainPerPlayer[Player] = MiniGamesMainUIDevice{}):
#             MiniGamesVoteUI.GenerateRandomMiniGame()
#             MiniGamesVoteUI.MiniGamesVoteUI(Player)
#             MiniGamesVoteUI.CountdownEndedEvent.Await()
#             MiniGamesVoteUI.HandleTheVoteCount()
#             GrantWeapon(MiniGamesVoteUI.WinnerMiniGameIs)
#             Print("GrantWeapon Number is : {MiniGamesVoteUI.WinnerMiniGameIs}")
#             Print("WinnerNumber Before is : {MiniGamesVoteUI.WinnerMiniGameIs}")
#             MiniGamesMainUI.GetTheMiniGamesLogo(MiniGamesVoteUI.WinnerMiniGameIs)
#             Print("WinnerNumber After is : {MiniGamesVoteUI.WinnerMiniGameIs}")
#             MiniGamesMainUI.StartMiniGame(Player)

#             # InitializeMiniGamesMainUI()
        
#             Sleep(10.0)
#             EndGame.Activate(Player)

#     InitializeMiniGamesMainUI():void=
#         AllPlayers := GetPlayspace().GetPlayers()
#         for(Player : AllPlayers, MiniGamesVoteUI := set MiniGamesVotePerPlayer[Player] = MiniGamesVoteDevice{},MiniGamesMainUI := set MiniGamesMainPerPlayer[Player] = MiniGamesMainUIDevice{}):
#             Print("WinnerNumber Before is : {MiniGamesVoteUI.WinnerMiniGameIs}")
#             MiniGamesMainUI.GetTheMiniGamesLogo(MiniGamesVoteUI.WinnerMiniGameIs)
#             Print("WinnerNumber After is : {MiniGamesVoteUI.WinnerMiniGameIs}")
#             MiniGamesMainUI.StartMiniGame(Player)

#     # MiniGamesTimerEnd()<suspends>:void=
#     #     AllPlayers := GetPlayspace().GetPlayers()
#     #     for(Player : AllPlayers, MiniGamesVoteUI := set MiniGamesVotePerPlayer[Player] = MiniGamesVoteDevice{}):
#     #         MiniGamesVoteUI.CountdownEndedEvent.Await()
#     #         MiniGamesVoteUI.HandleTheVoteCount()
#     #         GrantWeapon(MiniGamesVoteUI.WinnerMiniGameIs) 
#     #         # The Left Logo
#     #         # MiniGamesUIFightLogo.StartMiniGame(Player)

#     #         # MiniGamesStart(Player)
#     #         Sleep(5.0)
#     #         EndGame.Activate(Player)



#     GrantWeapon (WeaponValue: int) : void=
#         AllPlayers := GetPlayspace().GetPlayers() 
#         for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
#             if(ItemGranter := WeaponGranters[WeaponValue]):
#                 ItemGranter.GrantItem(Player)