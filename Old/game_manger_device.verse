
# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }

# using { /UnrealEngine.com/Temporary/UI }
# using { /UnrealEngine.com/Temporary/SpatialMath }

# game_manger_device := class(creative_device):

#     var WidgetClassPerPlayer: [player]mini_games_ui_device = map{}

#     # Runs when the device is started in a running game
#     OnBegin<override>()<suspends>:void=
#         InitializeUI()
#         Sleep(1.0)
#         MiniGamesTimerEnd()

#     InitializeUI():void=
#         AllPlayers := GetPlayspace().GetPlayers()
#         for(Player : AllPlayers, WClass := set WidgetClassPerPlayer[Player] = mini_games_ui_device{}):
#             WClass.AddUI(Player)

#     MiniGamesTimerEnd()<suspends>:void=
#         AllPlayers := GetPlayspace().GetPlayers()
#         for(Player : AllPlayers, WClass := set WidgetClassPerPlayer[Player] = mini_games_ui_device{}):
#             WClass.RemoveUI(Player)



 