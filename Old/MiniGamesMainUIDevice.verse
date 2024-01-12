
# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }


# using { /UnrealEngine.com/Temporary/UI }
# using { /UnrealEngine.com/Temporary/SpatialMath }
# using { /Fortnite.com/UI }


# MiniGamesMainUIDevice := class():
    
     
#     var MiniGamesMainUICanvas : canvas = canvas{}

#     GameModelogo1 : texture_block = texture_block{ DefaultImage := Images.example_0, DefaultDesiredSize := vector2{ X := 250.0, Y := 250.0}}

#     GetTheMiniGamesLogo(WinnerMiniGame : int):void =
#         var MiniGamesVoteUI : MiniGamesVoteDevice = MiniGamesVoteDevice{} 
#         for(TheMiniGamesLogo := 0..MiniGamesVoteUI.MiniGamesImages.Length - 1):
#             if(MiniGamesLogoUI := MiniGamesVoteUI.MiniGamesImages[WinnerMiniGame]):                          
#                 MiniGamesLogoUI

#                     block:
#                         set MiniGamesMainUICanvas = canvas:
#                             Slots := array:
#                                 canvas_slot:
#                                     Anchors := anchors:
#                                         Minimum := vector2{X := 0.1, Y := 0.7}
#                                         Maximum := vector2{X := 0.1, Y := 0.9}
#                                     Alignment := vector2{X := 0.5, Y := 0.5 }
#                                     Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                                     SizeToContent := true
#                                     Widget := MiniGamesLogoUI

#     # MiniGameLogo(Agent:agent):canvas=
       
#     #     MyCanvas: canvas = canvas:
#     #         Slots := array:
#     #             canvas_slot:
#     #                 Anchors := anchors:
#     #                     Minimum := vector2{X := 0.1, Y := 0.7}
#     #                     Maximum := vector2{X := 0.1, Y := 0.9}
#     #                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                 SizeToContent := true
#     #                 Widget := GameModelogo1
#     #     return MyCanvas
                    
#     StartMiniGame(Agent:agent): void =
#         if(Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
#             Widget:canvas = MiniGamesMainUICanvas
#             PlayerUI.AddWidget(Widget) 



                




#     # MiniGamesStart():void=

#     #     for(MiniGameLogoLeftScreen := 0..GameModeImages.Length - 1):
#     #     if (MiniGameLogo := GameModeImages[WinnerMiniGameIs]):
#     #         block:
#     #             set MiniGamesStarts = canvas:
#     #                 Slots := array:
#     #                     canvas_slot:
#     #                         Anchors := anchors:
#     #                             Minimum := vector2{X := 0.3, Y := 0.2}
#     #                             Maximum := vector2{X := 0.3, Y := 0.5}
#     #                         Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                         SizeToContent := true
#     #                         Widget := MiniGameLogo