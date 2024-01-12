
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

using { /Verse.org/Random }
using { /Verse.org/Simulation/Tags }
using { /UnrealEngine.com/Temporary/UI }

PlayerSpawners := class (tag){}

GameManager := class (creative_device):

    var PlayersMap: [player]VoteUICanvasDevice = map{}

    var VoteTime: float = 15.0

    var RandomNumber01: int = 0
    var RandomNumber02: int = 0
    var RandomNumber03: int = 0

    @editable
    TimerDevice: timer_device = timer_device{}  
    @editable
    EndGame : end_game_device = end_game_device{}
    
    OnBegin<override>()<suspends>:void=
        InitSpawners()
        GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerRemoved)

    InitSpawners():void=
        Spawners := GetCreativeObjectsWithTag(PlayerSpawners{})
        for (Obj: Spawners):
            if (Spawner :=player_spawner_device [Obj]):
                Spawner.SpawnedEvent.Subscribe(OnPlayerSpawned)

    OnTimerEnd():void =         
        TimerDevice.SuccessEvent.Subscribe(EndTheGame)

    EndTheGame(Agent : ?agent):void = 
        for (Player : PlayersMap): 
            Player.RemoveVoteWidget()

    HandleVote01(Widget: widget_message):void=
        for (Player : PlayersMap):
            Player.HandleVote01(Widget)

    HandleVote02(Widget: widget_message):void=
        for (Player : PlayersMap):
            Player.HandleVote02(Widget)

    HandleVote03(Widget: widget_message):void=
        for (Player : PlayersMap):
            Player.HandleVote03(Widget)
            
    UpdateImageUI():void=
        for (Player : PlayersMap):            
            Player.UpdateImageUI(RandomNumber01, RandomNumber02, RandomNumber03)

    GenerateMiniGameNumber():void =       
        for (Player : PlayersMap):
            loop:
                Number01 := GetRandomInt(0, Player.MiniGamesImages.Length - 1)
                set RandomNumber01 = + Number01
                Number02 := GetRandomInt(0, Player.MiniGamesImages.Length - 1)
                set RandomNumber02 = + Number02
                Number03 := GetRandomInt(0, Player.MiniGamesImages.Length - 1)
                set RandomNumber03 = + Number03
                if (Number01 <> Number02 and Number01 <> Number03 and Number02 <> Number03):
                break 
        
    OnPlayerSpawned (Agent: agent):void=
        if:
            PlayerObj:= player [Agent]
        then:
            if(PlayerExists := PlayersMap [PlayerObj]):
            #do nothing, player already exists
            else:        
                NewCustomPlayer: VoteUICanvasDevice = VoteUICanvasDevice {MyAgentObj := Agent}
                if(set PlayersMap [PlayerObj] = NewCustomPlayer):
                    GenerateMiniGameNumber()
                    TimerDevice.SetActiveDuration(VoteTime)
                    TimerDevice.Start() 
                    NewCustomPlayer.InitPlayer() 
                    NewCustomPlayer.VoteButton01.OnClick().Subscribe(HandleVote01)
                    NewCustomPlayer.VoteButton02.OnClick().Subscribe(HandleVote02)
                    NewCustomPlayer.VoteButton03.OnClick().Subscribe(HandleVote03)
                OnTimerEnd()              
                UpdateImageUI()

    OnPlayerRemoved (Player: player):void=
        if (RemoveCustomPlayer: VoteUICanvasDevice = PlayersMap[Player]):
            #remove the player from the players
            var TempAllPlayersMap: [player]VoteUICanvasDevice = map{}
            for (Key -> Value: PlayersMap, Key <> Player):
                set TempAllPlayersMap = ConcatenateMaps(TempAllPlayersMap, map{Key => Value})
            set PlayersMap = TempAllPlayersMap

