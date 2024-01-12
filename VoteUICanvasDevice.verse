
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

using { /Fortnite.com/UI }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

ImageSize:vector2 = vector2{X := 250.0, Y := 250.0}

VoteUICanvasDevice := class():

    MyAgentObj: agent

    var VoteButton01 :button_loud = button_loud{}
    var VoteButton02 :button_loud = button_loud{}
    var VoteButton03 :button_loud = button_loud{}

    VoteText01 : text_block = text_block{DefaultTextColor := NamedColors.White}
    VoteText02 : text_block = text_block{DefaultTextColor := NamedColors.White}
    VoteText03 : text_block = text_block{DefaultTextColor := NamedColors.White}
    
    MiniGamesImages : []texture_block = array{        
        MiniGameImage1 : texture_block = texture_block{ DefaultImage := Images.GameMode_1, DefaultDesiredSize := ImageSize}
        MiniGameImage2 : texture_block = texture_block{ DefaultImage := Images.GameMode_2, DefaultDesiredSize := ImageSize}
        MiniGameImage3 : texture_block = texture_block{ DefaultImage := Images.GameMode_3, DefaultDesiredSize := ImageSize}
        MiniGameImage4 : texture_block = texture_block{ DefaultImage := Images.GameMode_4, DefaultDesiredSize := ImageSize}
        MiniGameImage5 : texture_block = texture_block{ DefaultImage := Images.GameMode_5, DefaultDesiredSize := ImageSize}
        MiniGameImage6 : texture_block = texture_block{ DefaultImage := Images.GameMode_6, DefaultDesiredSize := ImageSize}
        MiniGameImage7 : texture_block = texture_block{ DefaultImage := Images.GameMode_7, DefaultDesiredSize := ImageSize}
        MiniGameImage8 : texture_block = texture_block{ DefaultImage := Images.GameMode_8, DefaultDesiredSize := ImageSize}
        MiniGameImage9 : texture_block = texture_block{ DefaultImage := Images.GameMode_9, DefaultDesiredSize := ImageSize}
        }

    var TextureWidget01:texture_block = texture_block{DefaultImage := Images.GameMode_1}
    var TextureWidget02:texture_block = texture_block{DefaultImage := Images.GameMode_2}
    var TextureWidget03:texture_block = texture_block{DefaultImage := Images.GameMode_3}

    var VoteNumber01 :int = 0 
    var VoteNumber02 :int = 0
    var VoteNumber03 :int = 0

    var RandomNumber01 :int = 0
    var RandomNumber02 :int = 0
    var RandomNumber03 :int = 0

    StringToMessage<localizes>(value:string)<computes> : message = "{value}"

    var PlayerVoteWidget : canvas = canvas{}

    InitPlayer(): void=         
        set VoteButton01 = button_loud{DefaultText := StringToMessage("VOTE")}
        set VoteButton02 = button_loud{DefaultText := StringToMessage("VOTE")}
        set VoteButton03 = button_loud{DefaultText := StringToMessage("VOTE")}

        set TextureWidget01 = texture_block{DefaultImage := Images.GameMode_1,  DefaultDesiredSize := ImageSize}
        set TextureWidget02 = texture_block{DefaultImage := Images.GameMode_2,  DefaultDesiredSize := ImageSize}
        set TextureWidget03 = texture_block{DefaultImage := Images.GameMode_3,  DefaultDesiredSize := ImageSize}
       
        set PlayerVoteWidget = CreateUserUI()
            if(PlayerObj:=player [MyAgentObj], PlayerUI := GetPlayerUI[PlayerObj]): 
                PlayerUI.AddWidget(PlayerVoteWidget, player_ui_slot{InputMode:=ui_input_mode.All})

    RemoveVoteWidget():void=
        if(PlayerObj:=player [MyAgentObj], PlayerUI := GetPlayerUI[PlayerObj]): 
            PlayerUI.RemoveWidget(PlayerVoteWidget)
  
    HandleVote01(Widget: widget_message): void =
        set VoteNumber01 += 1
        UpdateButtonUI()
        if(Widget.Player = player [MyAgentObj]):
            VoteButton01.SetEnabled(false)
            VoteButton02.SetEnabled(false)
            VoteButton03.SetEnabled(false)

    HandleVote02(Widget: widget_message): void =
        set VoteNumber02 +=1
        UpdateButtonUI()
        if(Widget.Player = player [MyAgentObj]):
            VoteButton01.SetEnabled(false)
            VoteButton02.SetEnabled(false)
            VoteButton03.SetEnabled(false)

    HandleVote03(Widget: widget_message): void =
        set VoteNumber03 +=1
        UpdateButtonUI()
        if(Widget.Player = player [MyAgentObj]):
            VoteButton01.SetEnabled(false)
            VoteButton02.SetEnabled(false)
            VoteButton03.SetEnabled(false)
    
    UpdateButtonUI (): void=
        VoteText01.SetText(StringToMessage("VOTED : {VoteNumber01}"))
        VoteText02.SetText(StringToMessage("VOTED : {VoteNumber02}"))
        VoteText03.SetText(StringToMessage("VOTED : {VoteNumber03}"))
        VoteButton01.SetText(StringToMessage("VOTED : {VoteNumber01}")) 
        VoteButton02.SetText(StringToMessage("VOTED : {VoteNumber02}"))
        VoteButton03.SetText(StringToMessage("VOTED : {VoteNumber03}"))

    UpdateImageUI (INumber01:int, INumber02:int,INumber03:int): void=
        set RandomNumber01 = INumber01        
        set RandomNumber02 = INumber02
        set RandomNumber03 = INumber03

            for(GameMode01 := 0..MiniGamesImages.Length - 1):
                if (GameModeIs01 := MiniGamesImages[RandomNumber01]):
                    TextureWidget01.SetImage(GameModeIs01.DefaultImage)
                    for(GameMode02 := 0..MiniGamesImages.Length - 1):
                        if (GameModeIs02 := MiniGamesImages[RandomNumber02]):
                            TextureWidget02.SetImage(GameModeIs02.DefaultImage)
                            for(GameMode03 := 0..MiniGamesImages.Length - 1):
                                if (GameModeIs03:= MiniGamesImages[RandomNumber03]): 
                                    TextureWidget03.SetImage(GameModeIs03.DefaultImage)

    CreateUserUI<private>(): canvas=
        UICanvas :canvas = canvas:                
            Slots := array:               
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.3, Y := 0.2}, Maximum := vector2{X := 0.3, Y := 0.5}}
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.5, Y := 0.5 }
                    SizeToContent := true
                    Widget := TextureWidget01
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.2}, Maximum := vector2{X := 0.5, Y := 0.5}}                            
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.5, Y := 0.5 }
                    SizeToContent := true
                    Widget := TextureWidget02
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.7, Y := 0.2}, Maximum := vector2{X := 0.7, Y := 0.5}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.5, Y := 0.5 }
                    SizeToContent := true
                    Widget := TextureWidget03    
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.25, Y := 0.55}, Maximum := vector2{X := 0.36, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteButton01
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.45, Y := 0.55}, Maximum := vector2{X := 0.56, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.5, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteButton02
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.65, Y := 0.55}, Maximum := vector2{X := 0.76, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteButton03
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.25, Y := 0.55}, Maximum := vector2{X := 0.36, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteText01
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.45, Y := 0.55}, Maximum := vector2{X := 0.56, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.5, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteText02
                canvas_slot:
                    Anchors := anchors {Minimum := vector2{X := 0.65, Y := 0.55}, Maximum := vector2{X := 0.76, Y := 0.55}} 
                    Offsets := margin{Top := 0.0, Left:= 0.0, Right := 0.0, Bottom := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.5}
                    SizeToContent := true
                    ZOrder := 30
                    Widget := VoteText03
               