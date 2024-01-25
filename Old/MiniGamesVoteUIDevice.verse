
# using { /Fortnite.com/Devices }
# using { /Verse.org/Simulation }
# using { /UnrealEngine.com/Temporary/Diagnostics }

# using { /Fortnite.com/UI }
# using { /Verse.org/Colors }
# using { /Verse.org/Random }
# using { /UnrealEngine.com/Temporary/UI }
# using { /UnrealEngine.com/Temporary/SpatialMath }

#     ImageSize:vector2 = vector2{X := 250.0, Y := 250.0}

#     LeftVoteButtonText<localizes>: message = "VOTE"
#     RightVoteButtonText <localizes>: message = "VOTE"
#     CenterVoteButtonText <localizes>: message = "VOTE"

#     LeftCurrentVoteText<localizes>(LeftCurrentVote : int) : message = "VOTE : {LeftCurrentVote}"
#     RightCurrentVoteText<localizes>(RightCurrentVote : int) : message = "VOTE : {RightCurrentVote}"
#     CenterCurrentVoteText<localizes>(CenterCurrentVote : int) : message = "VOTE : {CenterCurrentVote}"

# MiniGamesVoteDevice := class():

#     var WinnerMiniGameIs : int = 0

#     var LeftCurrentVote:int = 0
#     var RightCurrentVote:int = 0
#     var CenterCurrentVote:int = 0

#     var LeftNumber :int = 0
#     var RightNumber :int = 0
#     var CenterNumber :int = 0

#     # The Game Modes Images
#     MiniGamesImages : []texture_block = array{        
#         MiniGameImage1 : texture_block = texture_block{ DefaultImage := Images.GameMode_1, DefaultDesiredSize := ImageSize}
#         MiniGameImage2 : texture_block = texture_block{ DefaultImage := Images.GameMode_2, DefaultDesiredSize := ImageSize}
#         MiniGameImage3 : texture_block = texture_block{ DefaultImage := Images.GameMode_3, DefaultDesiredSize := ImageSize}
#         MiniGameImage4 : texture_block = texture_block{ DefaultImage := Images.GameMode_4, DefaultDesiredSize := ImageSize}
#         MiniGameImage5 : texture_block = texture_block{ DefaultImage := Images.GameMode_5, DefaultDesiredSize := ImageSize}
#         MiniGameImage6 : texture_block = texture_block{ DefaultImage := Images.GameMode_6, DefaultDesiredSize := ImageSize}
#         MiniGameImage7 : texture_block = texture_block{ DefaultImage := Images.GameMode_7, DefaultDesiredSize := ImageSize}
#         MiniGameImage8 : texture_block = texture_block{ DefaultImage := Images.GameMode_8, DefaultDesiredSize := ImageSize}
#         MiniGameImage9 : texture_block = texture_block{ DefaultImage := Images.GameMode_9, DefaultDesiredSize := ImageSize}
#         }

#     LeftVoteButton : button_loud = button_loud{}   
#     CenterVoteButton : button_loud = button_loud{}
#     RightVoteButton : button_loud = button_loud{}

#     LeftVoteText : text_block = text_block{DefaultTextColor := NamedColors.White}
#     RightVoteText : text_block = text_block{DefaultTextColor := NamedColors.White}
#     CenterVoteText : text_block = text_block{DefaultTextColor := NamedColors.White}

#     var LeftTextureWidget:texture_block = texture_block{DefaultImage := Images.GameMode_1}
#     var RightTextureWidget:texture_block = texture_block{DefaultImage := Images.GameMode_2}
#     var CenterTextureWidget:texture_block = texture_block{DefaultImage := Images.GameMode_3}

#     var MiniGamesUICanvas : canvas = canvas{}

#     # Timer
#     var RemainingTime<internal> : float = 10.00
#     TimerTextBlock<private> : text_block = text_block{ DefaultTextColor := NamedColors.White }
#     TimerText<localizes><private>(CurrentRemainingTime : int) :message = "Remaining Time For Vote 00:{CurrentRemainingTime}"
#     TimerTickPeriod<private> : float = 1.0
#     MaybePlayerUI<internal> : ?player_ui = false
#     CountdownEndedEvent<public> : event(float) = event(float){}
    
#     # GenerateRandomMiniGame():void=
#     #     loop:
#     #         RandomLeftNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #         set LeftNumber = + RandomLeftNumber
    
#     #         RandomRightNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #         set RightNumber = + RandomRightNumber
    
#     #         RandomCenterNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #         set CenterNumber = + RandomCenterNumber
              
#     #         if:
#     #             (LeftNumber = RightNumber or LeftNumber = CenterNumber or LeftNumber >= MiniGamesImages.Length)
#     #         then:
#     #             NewLeftNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #             set LeftNumber = + NewLeftNumber
#     #         if:
#     #             (RightNumber = LeftNumber or RightNumber = CenterNumber or RightNumber >= MiniGamesImages.Length)
#     #         then:
#     #             NewRightNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #             set RightNumber = + NewRightNumber                    
#     #         if:
#     #             (CenterNumber = LeftNumber or CenterNumber = RightNumber or CenterNumber >= MiniGamesImages.Length)
#     #         then:
#     #             NewCenterNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#     #             set CenterNumber = + NewCenterNumber    
#     #         break

#     #     for(Left := 0..MiniGamesImages.Length - 1):
#     #         if (GameModeIsLeft := MiniGamesImages[LeftNumber]):
#     #             GameModeIsLeft 
#     #             for(Right := 0..MiniGamesImages.Length - 1):
#     #                 if (GameModeIsRight := MiniGamesImages[RightNumber]):
#     #                     GameModeIsRight
#     #                     for(Center := 0..MiniGamesImages.Length - 1):
#     #                         if (GameModeIsCenter:= MiniGamesImages[CenterNumber]): 
#     #                             GameModeIsCenter
    
#     #                                 block:
#     #                                     set MiniGamesUICanvas = canvas:
#     #                                         Slots := array:
#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.4, Y := 0.1}
#     #                                                     Maximum := vector2{X := 0.3, Y := 0.3}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 SizeToContent := true
#     #                                                 Widget := TimerTextBlock                                                     

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.3, Y := 0.2}
#     #                                                     Maximum := vector2{X := 0.3, Y := 0.5}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 SizeToContent := true
#     #                                                 Widget := GameModeIsLeft

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.7, Y := 0.2}
#     #                                                     Maximum := vector2{X := 0.7, Y := 0.5}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 SizeToContent := true
#     #                                                 Widget := GameModeIsRight

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.5, Y := 0.2}
#     #                                                     Maximum := vector2{X := 0.5, Y := 0.5}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 SizeToContent := true
#     #                                                 Widget := GameModeIsCenter

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.25, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.36, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := LeftVoteButton

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.65, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.76, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := RightVoteButton

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.45, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.56, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := CenterVoteButton

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.27, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.36, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := LeftVoteText

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.67, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.76, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := RightVoteText

#     #                                             canvas_slot:
#     #                                                 Anchors := anchors:
#     #                                                     Minimum := vector2{X := 0.47, Y := 0.55}
#     #                                                     Maximum := vector2{X := 0.56, Y := 0.55}
#     #                                                 Alignment := vector2{X := 0.5, Y := 0.5 }
#     #                                                 Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#     #                                                 Widget := CenterVoteText
#     GenerateRandomMiniGame():void=
#         set LeftTextureWidget = texture_block{DefaultImage := Images.GameMode_1,  DefaultDesiredSize := ImageSize}
#         set RightTextureWidget = texture_block{DefaultImage := Images.GameMode_2,  DefaultDesiredSize := ImageSize}
#         set CenterTextureWidget = texture_block{DefaultImage := Images.GameMode_3,  DefaultDesiredSize := ImageSize}

#         loop:
#             RandomLeftNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#             set LeftNumber = + RandomLeftNumber

#             RandomRightNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#             set RightNumber = + RandomRightNumber

#             RandomCenterNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#             set CenterNumber = + RandomCenterNumber
                
#             if:
#                 (LeftNumber = RightNumber or LeftNumber = CenterNumber or LeftNumber >= MiniGamesImages.Length)
#             then:
#                 NewLeftNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#                 set LeftNumber = + NewLeftNumber
#             if:
#                 (RightNumber = LeftNumber or RightNumber = CenterNumber or RightNumber >= MiniGamesImages.Length)
#             then:
#                 NewRightNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#                 set RightNumber = + NewRightNumber                    
#             if:
#                 (CenterNumber = LeftNumber or CenterNumber = RightNumber or CenterNumber >= MiniGamesImages.Length)
#             then:
#                 NewCenterNumber := GetRandomInt(0, MiniGamesImages.Length - 1)
#                 set CenterNumber = + NewCenterNumber    
#             break

#         for(Left := 0..MiniGamesImages.Length - 1):
#             if (GameModeIsLeft := MiniGamesImages[LeftNumber]):
#                 set LeftTextureWidget = GameModeIsLeft
#                 for(Right := 0..MiniGamesImages.Length - 1):
#                     if (GameModeIsRight := MiniGamesImages[RightNumber]):
#                         set RightTextureWidget = GameModeIsRight
#                         for(Center := 0..MiniGamesImages.Length - 1):
#                             if (GameModeIsCenter:= MiniGamesImages[CenterNumber]): 
#                                 set CenterTextureWidget = GameModeIsCenter

#     MiniGameLogo(Agent:agent):canvas=
       
#         MyCanvas: canvas = canvas:
#                 Slots := array:               
#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.4, Y := 0.1}
#                             Maximum := vector2{X := 0.3, Y := 0.3}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         SizeToContent := true
#                         Widget := TimerTextBlock

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.3, Y := 0.2}
#                             Maximum := vector2{X := 0.3, Y := 0.5}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         SizeToContent := true
#                         Widget := LeftTextureWidget

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.7, Y := 0.2}
#                             Maximum := vector2{X := 0.7, Y := 0.5}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         SizeToContent := true
#                         Widget := RightTextureWidget

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.5, Y := 0.2}
#                             Maximum := vector2{X := 0.5, Y := 0.5}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         SizeToContent := true
#                         Widget := CenterTextureWidget

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.25, Y := 0.55}
#                             Maximum := vector2{X := 0.36, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := LeftVoteButton

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.65, Y := 0.55}
#                             Maximum := vector2{X := 0.76, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := RightVoteButton

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.45, Y := 0.55}
#                             Maximum := vector2{X := 0.56, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := CenterVoteButton

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.27, Y := 0.55}
#                             Maximum := vector2{X := 0.36, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := LeftVoteText

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.67, Y := 0.55}
#                             Maximum := vector2{X := 0.76, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := RightVoteText

#                     canvas_slot:
#                         Anchors := anchors:
#                             Minimum := vector2{X := 0.47, Y := 0.55}
#                             Maximum := vector2{X := 0.56, Y := 0.55}
#                         Alignment := vector2{X := 0.5, Y := 0.5 }
#                         Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
#                         Widget := CenterVoteText

#     MiniGamesVoteUI<public>(Agent:agent): void =
#         if(Player := player[Agent], PlayerUI := GetPlayerUI[Player]):
#             Widget:canvas = MiniGameLogo(Agent)
#             PlayerUI.AddWidget(Widget,player_ui_slot{InputMode:=ui_input_mode.All})
#             UpdateUI()
#             spawn:
#                 RunCountdown(Agent)
#             LeftVoteButton.OnClick().Subscribe(HandleLeftVoteButton)
#             CenterVoteButton.OnClick().Subscribe(HandleCenterVoteButton)
#             RightVoteButton.OnClick().Subscribe(HandleRightVoteButton)

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

#     UpdateUI<private>(): void =
#         if (IntTime := Int[RemainingTime]):
#             TimerTextBlock.SetText(TimerText(IntTime))
#             LeftVoteButton.SetText(LeftVoteButtonText)
#             RightVoteButton.SetText(RightVoteButtonText)
#             CenterVoteButton.SetText(CenterVoteButtonText)
#             LeftVoteText.SetText(LeftCurrentVoteText(LeftCurrentVote))
#             RightVoteText.SetText(RightCurrentVoteText(RightCurrentVote))
#             CenterVoteText.SetText(CenterCurrentVoteText(CenterCurrentVote))

#     HandleLeftVoteButton (Widget : widget_message):void =
#             set LeftCurrentVote = + 1
#             Print("{LeftCurrentVote}")
#             LeftVoteButton.SetEnabled(false)
#             RightVoteButton.SetEnabled(false)
#             CenterVoteButton.SetEnabled(false)

#     HandleRightVoteButton (Widget : widget_message):void =
#                 set RightCurrentVote = + 1
#                 Print("{RightCurrentVote}")
#                 LeftVoteButton.SetEnabled(false)
#                 RightVoteButton.SetEnabled(false)
#                 CenterVoteButton.SetEnabled(false)

#     HandleCenterVoteButton (Widget : widget_message):void = 
#                 set CenterCurrentVote = + 1
#                 Print("{CenterCurrentVote}")
#                 LeftVoteButton.SetEnabled(false)
#                 RightVoteButton.SetEnabled(false)
#                 CenterVoteButton.SetEnabled(false)

#     HandleTheVoteCount():void =
#         if :
#             LeftCurrentVote >= RightCurrentVote
#             LeftCurrentVote >= CenterCurrentVote
#         then:
#             set WinnerMiniGameIs = + LeftNumber
#         else:
#             if:
#                 RightCurrentVote >= LeftCurrentVote
#                 RightCurrentVote >= CenterCurrentVote
#             then:
#                 set WinnerMiniGameIs = + RightNumber
#             else:
#                 if:
#                     CenterCurrentVote >= LeftCurrentVote
#                     CenterCurrentVote >= RightCurrentVote
#                 then:
#                     set WinnerMiniGameIs = + CenterNumber
#                 else:
#                     set WinnerMiniGameIs = + LeftNumber

