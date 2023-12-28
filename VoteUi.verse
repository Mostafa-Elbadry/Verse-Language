using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Verse.org/Assets }
using { /Fortnite.com/UI }
using { /Verse.org/Colors }
using { /Verse.org/Random }

# GameModeVoteUi<constructor><public>(MaxTime : float, InPlayer : agent) := countdown_timer:
#     RemainingTime := MaxTime
#     MaybePlayerUI := option{GetPlayerUI[player[InPlayer]]} 
   
    LeftVoteButtonText <localizes>: message = "VOTE"
    CenterVoteButtonText <localizes>: message = "VOTE"
    RightVoteButtonText <localizes>: message = "VOTE"

GameModeVoteUi := class:       
                  
    TimeTextBlock: text_block = text_block{DefaultTextColor := NamedColors.White}

    GameModeImages : []texture_block = array{
    # The Game Modes Images
    GameModeImage1 : texture_block = texture_block{ DefaultImage := images.GameMode_1, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage2 : texture_block = texture_block{ DefaultImage := images.GameMode_2, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage3 : texture_block = texture_block{ DefaultImage := images.GameMode_3, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage4 : texture_block = texture_block{ DefaultImage := images.GameMode_4, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage5 : texture_block = texture_block{ DefaultImage := images.GameMode_5, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage6 : texture_block = texture_block{ DefaultImage := images.GameMode_6, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage7 : texture_block = texture_block{ DefaultImage := images.GameMode_7, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage8 : texture_block = texture_block{ DefaultImage := images.GameMode_8, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    GameModeImage9 : texture_block = texture_block{ DefaultImage := images.GameMode_9, DefaultDesiredSize := vector2{ X := 350.0, Y := 350.0}}
    }

    LeftVoteButton : button_loud = button_loud{DefaultText:=LeftVoteButtonText}   
    CenterVoteButton : button_loud = button_loud{DefaultText:=CenterVoteButtonText}
    RightVoteButton : button_loud = button_loud{DefaultText:=RightVoteButtonText}

    # Generate The Image
    GenerateRandomGameMode()<suspends>:void=
        LeftRandomNumber :int = GetRandomInt(0,GameModeImages.Length - 1)
        RightRandomNumber :int = GetRandomInt(0,GameModeImages.Length - 1)
        CenterRandomNumber :int = GetRandomInt(0,GameModeImages.Length - 1)

        for(Left := 0..GameModeImages.Length - 1):
            if (GameModeIsLeft := GameModeImages[LeftRandomNumber]):
                GameModeIsLeft 
                for(Right := 0..GameModeImages.Length - 1):
                    if (GameModeIsRight := GameModeImages[RightRandomNumber]): 
                        GameModeIsRight                     
                        for(Center := 0..GameModeImages.Length - 1):
                            if (GameModeIsCenter:= GameModeImages[CenterRandomNumber]): 
                                GameModeIsCenter

                                block:
                                    set Canvas = canvas:
                                        Slots := array:
                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.4, Y := 0.1}
                                                    Maximum := vector2{X := 0.3, Y := 0.3}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                SizeToContent := true
                                                Widget := TimeTextBlock 

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.3, Y := 0.2}
                                                    Maximum := vector2{X := 0.3, Y := 0.5}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := GameModeIsLeft

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.25, Y := 0.55}
                                                    Maximum := vector2{X := 0.36, Y := 0.55}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := LeftVoteButton

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.5, Y := 0.2}
                                                    Maximum := vector2{X := 0.5, Y := 0.5}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := GameModeIsCenter

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.45, Y := 0.55}
                                                    Maximum := vector2{X := 0.56, Y := 0.55}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := CenterVoteButton

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.7, Y := 0.2}
                                                    Maximum := vector2{X := 0.7, Y := 0.5}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := GameModeIsRight

                                            canvas_slot:
                                                Anchors := anchors:
                                                    Minimum := vector2{X := 0.65, Y := 0.55}
                                                    Maximum := vector2{X := 0.76, Y := 0.55}
                                                Alignment := vector2{X := 0.5, Y := 0.5 }
                                                Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                                                Widget := RightVoteButton
    
    MaybePlayerUI<internal> : ?player_ui = false
    var RemainingTime<internal> : float = 0.0    
    RemainingTimeText<localizes><private>(CurrentRemainingTime : int) : message = "VOTE FOR NEXT GAME  00:{CurrentRemainingTime}"
     
    var Canvas<private> : canvas = canvas{}
    var TotalTime<private> : float = 0.0
    # The timer "precision": how often, in seconds, it ticks.
    TimerTickPeriod<private> : float = 1.0

    RunCountdown<private>()<suspends> : void =
        # We loop with the TimerTickPeriod.
        # The UI is also updated each time.
        loop:
            Sleep(TimerTickPeriod)
            set TotalTime += TimerTickPeriod
            set RemainingTime -= TimerTickPeriod
            UpdateVoteTimeUI()

            # Timer End
            if (RemainingTime <= 0.0):
                
                Canvas.RemoveWidget(TimeTextBlock)

                    if (UI := MaybePlayerUI?):
                        UI.RemoveWidget(Canvas)

                CountdownEndedEvent.Signal(TotalTime)
                break
    
    UpdateVoteTimeUI<private>() : void =    
        if (IntTime := Int[RemainingTime]):
            TimeTextBlock.SetText(RemainingTimeText(IntTime))
    
    CountdownEndedEvent<public> : event(float) = event(float){}

    StartVoteTime<public>()<suspends> : void =
        if (PlayerUI := MaybePlayerUI?):
            PlayerUI.AddWidget(Canvas , player_ui_slot{InputMode:=ui_input_mode.All})
             
            # Update the UI when we start the timer to see the initial RemainingTime on screen
            UpdateVoteTimeUI()
            spawn:
                RunCountdown()
            LeftVoteButton.OnClick().Subscribe(HandleLeftVoteButton)
            CenterVoteButton.OnClick().Subscribe(HandleCenterVoteButton)
            RightVoteButton.OnClick().Subscribe(HandleRightVoteButton)

                

    var LeftGameModeVoteIs : int = 0
    var CenterGameModeVoteIs : int = 0
    var RightGameModeVoteIs : int = 0

    HandleLeftVoteButton (Widget : widget_message):void =
        if (Agent := agent[Widget.Player]):
            set LeftGameModeVoteIs =+ 1
            Print("{LeftGameModeVoteIs}")
            
    HandleCenterVoteButton (Widget : widget_message):void =
        if (Agent := agent[Widget.Player]):
            set CenterGameModeVoteIs =+ 1
            Print("{CenterGameModeVoteIs}")

    HandleRightVoteButton (Widget : widget_message):void =
        if (Agent := agent[Widget.Player]):
            set RightGameModeVoteIs =+ 1
            Print("{RightGameModeVoteIs}")
            






