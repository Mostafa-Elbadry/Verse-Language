
# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }

# using { /Verse.org/Colors }
# using { /Fortnite.com/UI }
# using { /UnrealEngine.com/Temporary/UI }
# using { /UnrealEngine.com/Temporary/SpatialMath }


# mini_games_ui_device := class():

#     # Timer
#     var RemainingTime<internal> : float = 10.00
#     TimerTextBlock<private> : text_block = text_block{ DefaultTextColor := NamedColors.White }
#     TimerText<localizes><private>(CurrentRemainingTime : int) :message = "VOTE FOR NEXT GAME  00:{CurrentRemainingTime}"
#     TimerTickPeriod<private> : float = 1.0
#     MaybePlayerUI<internal> : ?player_ui = false
#     CountdownEndedEvent<public> : event(float) = event(float){}
#     GameModelogo1 : texture_block = texture_block{ DefaultImage := Images.example_0, DefaultDesiredSize := vector2{ X := 250.0, Y := 250.0}}

#     AddUI(Agent:agent):void=
#             StartCountdown(Agent)

#     var MiniGamesUICanvas : canvas = canvas{}

#         block:
#             set MiniGamesUICanvas = canvas:
#                 Slots := array:               
#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.4, Y := 0.1}
#                             Maximum := vector2{X := 0.3, Y := 0.3}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         SizeToContent := true
#                         Widget := TimerTextBlock 

#     StartCountdown<public>(Agent:agent): void =
#         if(Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
#             Widget:canvas = MiniGamesUICanvas
#             PlayerUI.AddWidget(Widget)
#         # if (PlayerUI := MaybePlayerUI?):
#         #     PlayerUI.AddWidget(CreateWidget(Agent))
#             UpdateUI()
#             spawn:
#                 RunCountdown(Agent)

#     RunCountdown(Agent:agent)<suspends>: void =
#         loop:
#             Sleep(TimerTickPeriod)
#             set RemainingTime -= TimerTickPeriod
#             UpdateUI()
#             if (RemainingTime <= 0.0):
#                 if(Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
#                     Widget:canvas = MiniGamesUICanvas
#                     PlayerUI.RemoveWidget(Widget)

#                 CountdownEndedEvent.Signal(RemainingTime)
#                 break

#     RemoveUI(Agent:agent):void =
#         if(Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
#             Widget:canvas = MiniGamesUICanvas
#             PlayerUI.RemoveWidget(Widget)

#     UpdateUI<private>(): void =
#         if (IntTime := Int[RemainingTime]):
#             TimerTextBlock.SetText(TimerText(IntTime))