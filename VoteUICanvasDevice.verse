
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

using { /Fortnite.com/UI }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

ImageSize:vector2 = vector2{X := 400.0, Y := 400.0}

VoteUICanvasDevice := class():

    MyAgentObj: agent

    var WinnerMiniGameIs :int = 0

    var VoteButton01 :button_loud = button_loud{}
    var VoteButton02 :button_loud = button_loud{}
    var VoteButton03 :button_loud = button_loud{}

    VoteText01 : text_block = text_block{DefaultTextColor := NamedColors.White}
    VoteText02 : text_block = text_block{DefaultTextColor := NamedColors.White}
    VoteText03 : text_block = text_block{DefaultTextColor := NamedColors.White}
    
    MiniGamesImages : []texture_block = array{        
        MiniGameImage001 : texture_block = texture_block{ DefaultImage := Images.Image001, DefaultDesiredSize := ImageSize}
        MiniGameImage002 : texture_block = texture_block{ DefaultImage := Images.Image002, DefaultDesiredSize := ImageSize}
        MiniGameImage003 : texture_block = texture_block{ DefaultImage := Images.Image003, DefaultDesiredSize := ImageSize}
        MiniGameImage004 : texture_block = texture_block{ DefaultImage := Images.Image004, DefaultDesiredSize := ImageSize}
        MiniGameImage005 : texture_block = texture_block{ DefaultImage := Images.Image005, DefaultDesiredSize := ImageSize}
        MiniGameImage006 : texture_block = texture_block{ DefaultImage := Images.Image006, DefaultDesiredSize := ImageSize}
        MiniGameImage007 : texture_block = texture_block{ DefaultImage := Images.Image007, DefaultDesiredSize := ImageSize}
        MiniGameImage008 : texture_block = texture_block{ DefaultImage := Images.Image008, DefaultDesiredSize := ImageSize}
        MiniGameImage009 : texture_block = texture_block{ DefaultImage := Images.Image009, DefaultDesiredSize := ImageSize}
        MiniGameImage010 : texture_block = texture_block{ DefaultImage := Images.Image010, DefaultDesiredSize := ImageSize}
        MiniGameImage011 : texture_block = texture_block{ DefaultImage := Images.Image011, DefaultDesiredSize := ImageSize}
        MiniGameImage012 : texture_block = texture_block{ DefaultImage := Images.Image012, DefaultDesiredSize := ImageSize}
        MiniGameImage013 : texture_block = texture_block{ DefaultImage := Images.Image013, DefaultDesiredSize := ImageSize}
        MiniGameImage014 : texture_block = texture_block{ DefaultImage := Images.Image014, DefaultDesiredSize := ImageSize}
        MiniGameImage015 : texture_block = texture_block{ DefaultImage := Images.Image015, DefaultDesiredSize := ImageSize}
        MiniGameImage016 : texture_block = texture_block{ DefaultImage := Images.Image016, DefaultDesiredSize := ImageSize}
        MiniGameImage017 : texture_block = texture_block{ DefaultImage := Images.Image017, DefaultDesiredSize := ImageSize}
        MiniGameImage018 : texture_block = texture_block{ DefaultImage := Images.Image018, DefaultDesiredSize := ImageSize}
        MiniGameImage019 : texture_block = texture_block{ DefaultImage := Images.Image019, DefaultDesiredSize := ImageSize}
        MiniGameImage020 : texture_block = texture_block{ DefaultImage := Images.Image020, DefaultDesiredSize := ImageSize}
        MiniGameImage021 : texture_block = texture_block{ DefaultImage := Images.Image021, DefaultDesiredSize := ImageSize}
        MiniGameImage022 : texture_block = texture_block{ DefaultImage := Images.Image022, DefaultDesiredSize := ImageSize}
        MiniGameImage023 : texture_block = texture_block{ DefaultImage := Images.Image023, DefaultDesiredSize := ImageSize}
        MiniGameImage024 : texture_block = texture_block{ DefaultImage := Images.Image024, DefaultDesiredSize := ImageSize}
        MiniGameImage025 : texture_block = texture_block{ DefaultImage := Images.Image025, DefaultDesiredSize := ImageSize}
        MiniGameImage026 : texture_block = texture_block{ DefaultImage := Images.Image026, DefaultDesiredSize := ImageSize}
        MiniGameImage027 : texture_block = texture_block{ DefaultImage := Images.Image027, DefaultDesiredSize := ImageSize}
        MiniGameImage028 : texture_block = texture_block{ DefaultImage := Images.Image028, DefaultDesiredSize := ImageSize}
        MiniGameImage029 : texture_block = texture_block{ DefaultImage := Images.Image029, DefaultDesiredSize := ImageSize}
        MiniGameImage030 : texture_block = texture_block{ DefaultImage := Images.Image030, DefaultDesiredSize := ImageSize}
        MiniGameImage031 : texture_block = texture_block{ DefaultImage := Images.Image031, DefaultDesiredSize := ImageSize}
        MiniGameImage032 : texture_block = texture_block{ DefaultImage := Images.Image032, DefaultDesiredSize := ImageSize}
        MiniGameImage033 : texture_block = texture_block{ DefaultImage := Images.Image033, DefaultDesiredSize := ImageSize}
        MiniGameImage034 : texture_block = texture_block{ DefaultImage := Images.Image034, DefaultDesiredSize := ImageSize}
        MiniGameImage035 : texture_block = texture_block{ DefaultImage := Images.Image035, DefaultDesiredSize := ImageSize}
        MiniGameImage036 : texture_block = texture_block{ DefaultImage := Images.Image036, DefaultDesiredSize := ImageSize}
        MiniGameImage037 : texture_block = texture_block{ DefaultImage := Images.Image037, DefaultDesiredSize := ImageSize}
        MiniGameImage038 : texture_block = texture_block{ DefaultImage := Images.Image038, DefaultDesiredSize := ImageSize}
        MiniGameImage039 : texture_block = texture_block{ DefaultImage := Images.Image039, DefaultDesiredSize := ImageSize}
        MiniGameImage040 : texture_block = texture_block{ DefaultImage := Images.Image040, DefaultDesiredSize := ImageSize}
        MiniGameImage041 : texture_block = texture_block{ DefaultImage := Images.Image041, DefaultDesiredSize := ImageSize}
        MiniGameImage042 : texture_block = texture_block{ DefaultImage := Images.Image042, DefaultDesiredSize := ImageSize}
        MiniGameImage043 : texture_block = texture_block{ DefaultImage := Images.Image043, DefaultDesiredSize := ImageSize}
        MiniGameImage044 : texture_block = texture_block{ DefaultImage := Images.Image044, DefaultDesiredSize := ImageSize}
        MiniGameImage045 : texture_block = texture_block{ DefaultImage := Images.Image045, DefaultDesiredSize := ImageSize}
        MiniGameImage046 : texture_block = texture_block{ DefaultImage := Images.Image046, DefaultDesiredSize := ImageSize}
        MiniGameImage047 : texture_block = texture_block{ DefaultImage := Images.Image047, DefaultDesiredSize := ImageSize}
        MiniGameImage048 : texture_block = texture_block{ DefaultImage := Images.Image048, DefaultDesiredSize := ImageSize}
        MiniGameImage049 : texture_block = texture_block{ DefaultImage := Images.Image049, DefaultDesiredSize := ImageSize}
        MiniGameImage050 : texture_block = texture_block{ DefaultImage := Images.Image050, DefaultDesiredSize := ImageSize}
        MiniGameImage051 : texture_block = texture_block{ DefaultImage := Images.Image051, DefaultDesiredSize := ImageSize}
        MiniGameImage052 : texture_block = texture_block{ DefaultImage := Images.Image052, DefaultDesiredSize := ImageSize}
        MiniGameImage053 : texture_block = texture_block{ DefaultImage := Images.Image053, DefaultDesiredSize := ImageSize}
        MiniGameImage054 : texture_block = texture_block{ DefaultImage := Images.Image054, DefaultDesiredSize := ImageSize}
        MiniGameImage055 : texture_block = texture_block{ DefaultImage := Images.Image055, DefaultDesiredSize := ImageSize}
        MiniGameImage056 : texture_block = texture_block{ DefaultImage := Images.Image056, DefaultDesiredSize := ImageSize}
        MiniGameImage057 : texture_block = texture_block{ DefaultImage := Images.Image057, DefaultDesiredSize := ImageSize}
        MiniGameImage058 : texture_block = texture_block{ DefaultImage := Images.Image058, DefaultDesiredSize := ImageSize}
        MiniGameImage059 : texture_block = texture_block{ DefaultImage := Images.Image059, DefaultDesiredSize := ImageSize}
        MiniGameImage060 : texture_block = texture_block{ DefaultImage := Images.Image060, DefaultDesiredSize := ImageSize}
        MiniGameImage061 : texture_block = texture_block{ DefaultImage := Images.Image061, DefaultDesiredSize := ImageSize}
        MiniGameImage062 : texture_block = texture_block{ DefaultImage := Images.Image062, DefaultDesiredSize := ImageSize}
        }

    var TextureWidget01:texture_block = texture_block{DefaultImage := Images.Image001}
    var TextureWidget02:texture_block = texture_block{DefaultImage := Images.Image002}
    var TextureWidget03:texture_block = texture_block{DefaultImage := Images.Image003}

    var VoteNumber01 :int = 0 
    var VoteNumber02 :int = 0
    var VoteNumber03 :int = 0

    var RandomNumber01 :int = 0
    var RandomNumber02 :int = 0
    var RandomNumber03 :int = 0

    StringToMessage<localizes>(value:string)<computes> : message = "{value}"

    var PlayerVoteWidget : canvas = canvas{}

    InitVotePlayer(): void=         
        set VoteButton01 = button_loud{DefaultText := StringToMessage("VOTE")}
        set VoteButton02 = button_loud{DefaultText := StringToMessage("VOTE")}
        set VoteButton03 = button_loud{DefaultText := StringToMessage("VOTE")}

        set TextureWidget01 = texture_block{DefaultImage := Images.Image001,  DefaultDesiredSize := ImageSize}
        set TextureWidget02 = texture_block{DefaultImage := Images.Image002,  DefaultDesiredSize := ImageSize}
        set TextureWidget03 = texture_block{DefaultImage := Images.Image003,  DefaultDesiredSize := ImageSize}
       
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
                    Anchors := anchors{Minimum := vector2{X := 0.11, Y := 0.15}, Maximum := vector2{X := 0.35, Y := 0.615}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.0, Y := 0.0 }
                    SizeToContent := true
                    Widget := TextureWidget01
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.36, Y := 0.15}, Maximum := vector2{X := 0.6, Y := 0.615}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.0, Y := 0.0 }
                    SizeToContent := true
                    Widget := TextureWidget02
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.62, Y := 0.15}, Maximum := vector2{X := 0.86, Y := 0.615}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X := 0.0, Y := 0.0 }
                    SizeToContent := true
                    Widget := TextureWidget03    
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.158, Y :=0.63}, Maximum := vector2{X := 0.31, Y := 0.7}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := false
                    Widget := VoteButton01
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.41, Y :=0.63}, Maximum := vector2{X := 0.558, Y := 0.7}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := false
                    Widget := VoteButton02
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.66, Y :=0.63}, Maximum := vector2{X := 0.818, Y := 0.7}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := false
                    Widget := VoteButton03
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.2, Y := 0.645}, Maximum := vector2{X := 0.288, Y := 0.688}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := true
                    Widget := VoteText01
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.438, Y := 0.645}, Maximum := vector2{X := 0.532, Y := 0.688}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := true
                    Widget := VoteText02
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.7, Y := 0.645}, Maximum := vector2{X := 0.788, Y := 0.688}}                          
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    Alignment := vector2{X:= 0.0, Y := 0.0}
                    SizeToContent := true
                    Widget := VoteText03
               