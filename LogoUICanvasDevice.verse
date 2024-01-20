using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

LogoSize:vector2 = vector2{X := 450.0, Y := 60.0}

LogoUICanvasDevice := class():

    MyAgentObj: agent
    var WinnerLogoNumber :int = 0

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

    var TextureLogo:texture_block = texture_block{DefaultImage := Images.Image000}

    var PlayerLogoWidget : canvas = canvas{}

    InitLogoPlayer(): void=         
        set TextureLogo = texture_block{DefaultImage := Images.Image000,  DefaultDesiredSize := LogoSize}
        set PlayerLogoWidget = CreateUserUI()
            if(PlayerObj:=player [MyAgentObj], PlayerUI := GetPlayerUI[PlayerObj]): 
                PlayerUI.AddWidget(PlayerLogoWidget)

    RemoveVoteWidget():void=
        if(PlayerObj:=player [MyAgentObj], PlayerUI := GetPlayerUI[PlayerObj]): 
            PlayerUI.RemoveWidget(PlayerLogoWidget)

    UpdateLogoUI(LNumber:int): void=
        set WinnerLogoNumber = LNumber
            for(GameMode01 := 0..MiniGamesImages.Length - 1):
                if (GameModeIs01 := MiniGamesImages[WinnerLogoNumber]):
                    TextureLogo.SetImage(GameModeIs01.DefaultImage)
                 
    CreateUserUI(): canvas=
        UICanvas :canvas = canvas:                
            Slots := array:               
                   canvas_slot:
                    Anchors := anchors{ Minimum := vector2{X := 0.04, Y := 0.6}, Maximum := vector2{X := 0.213, Y := 0.92}}
                    Alignment := vector2{X := 0.0, Y := 0.0}
                    Offsets := margin{Top := 0.0, Left := 0.0, Bottom := 0.0, Right := 0.0}
                    SizeToContent := true
                    Widget := TextureLogo
