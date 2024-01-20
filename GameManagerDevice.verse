using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

using { /Verse.org/Random }
using { /Verse.org/Simulation/Tags }
using { /UnrealEngine.com/Temporary/UI }
using { /Fortnite.com/Characters }
using { /UnrealEngine.com/Temporary/SpatialMath }

PlayerSpawners := class (tag){}

GameManagerDevice := class (creative_device):

    @editable
    VoteTimerDevice: timer_device = timer_device{} 
    @editable
    BarriersDevice: []barrier_device = array{}
    @editable
    VoteMutatorDevice: mutator_zone_device = mutator_zone_device{} 

    var VotePlayersMap: [player]VoteUICanvasDevice = map{}
    var LogoPlayersMap: [player]LogoUICanvasDevice = map{}

    var VoteTime: float = 10.0
   
    var MiniGameNumber: int = 0

    var RandomNumber01: int = 0
    var RandomNumber02: int = 0
    var RandomNumber03: int = 0
    
    OnBegin<override>()<suspends>:void=
        InitSpawners()
        GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerRemoved)

    InitSpawners() : void =
        Spawners := GetCreativeObjectsWithTag(PlayerSpawners{})
        for (Obj: Spawners):
            if (Spawner :=player_spawner_device [Obj]):
                Spawner.SpawnedEvent.Subscribe(OnPlayerSpawned)

    OnTimerEnd():void =         
        VoteTimerDevice.SuccessEvent.Subscribe(EndTheGame)

    EndTheGame(Agent : ?agent):void = 
        for (Player : VotePlayersMap):
            Player.RemoveVoteWidget()
        HandleTheVoteCount(RandomNumber01, RandomNumber02, RandomNumber03)
        for (BarrierDevice: BarriersDevice):
            BarrierDevice.Disable()
        VoteMutatorDevice.Disable()
        UpdateLogoUI()

    HandleVote01(Widget: widget_message):void=
        for (Player : VotePlayersMap):
            Player.HandleVote01(Widget)

    HandleVote02(Widget: widget_message):void=
        for (Player : VotePlayersMap):
            Player.HandleVote02(Widget)

    HandleVote03(Widget: widget_message):void=
        for (Player : VotePlayersMap):
            Player.HandleVote03(Widget)
            
    UpdateImageUI() : void =
        for (Player : VotePlayersMap):            
            Player.UpdateImageUI(RandomNumber01, RandomNumber02, RandomNumber03)

    UpdateLogoUI() : void =
        for (Player : LogoPlayersMap):            
            Player.UpdateLogoUI(MiniGameNumber)

    GenerateMiniGameNumber():void =       
        for (Player : VotePlayersMap):
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
            if(PlayerExists := VotePlayersMap [PlayerObj]):
            else:        
                NewCustomPlayer: VoteUICanvasDevice = VoteUICanvasDevice {MyAgentObj := Agent}
                if(set VotePlayersMap [PlayerObj] = NewCustomPlayer):
                    GenerateMiniGameNumber()
                    VoteTimerDevice.SetActiveDuration(VoteTime)
                    VoteTimerDevice.Start() 
                    NewCustomPlayer.InitVotePlayer() 
                    NewCustomPlayer.VoteButton01.OnClick().Subscribe(HandleVote01)
                    NewCustomPlayer.VoteButton02.OnClick().Subscribe(HandleVote02)
                    NewCustomPlayer.VoteButton03.OnClick().Subscribe(HandleVote03)
                UpdateImageUI() 
                OnTimerEnd()
                    NewLogoPlayer: LogoUICanvasDevice = LogoUICanvasDevice {MyAgentObj := Agent}
                    if(set LogoPlayersMap [PlayerObj] = NewLogoPlayer):
                        NewLogoPlayer.InitLogoPlayer()

    OnPlayerRemoved (Player: player):void=
        if (RemoveCustomPlayer: VoteUICanvasDevice = VotePlayersMap[Player]):
            var TempAllVotePlayersMap: [player]VoteUICanvasDevice = map{}
            for (Key -> Value: VotePlayersMap, Key <> Player):
                set TempAllVotePlayersMap = ConcatenateMaps(TempAllVotePlayersMap, map{Key => Value})
            set VotePlayersMap = TempAllVotePlayersMap

    HandleTheVoteCount(INumber01:int, INumber02:int,INumber03:int):void =
        for (Player : VotePlayersMap):
            if :
                Player.VoteNumber01 > Player.VoteNumber02
                Player.VoteNumber01 > Player.VoteNumber03
            then:
                set MiniGameNumber = INumber01
            else:
                if:
                    Player.VoteNumber02 > Player.VoteNumber01
                    Player.VoteNumber02 > Player.VoteNumber03
                then:
                    set MiniGameNumber = INumber02
                else:
                    if:
                        Player.VoteNumber03 > Player.VoteNumber01
                        Player.VoteNumber03 > Player.VoteNumber02
                    then:
                        set MiniGameNumber = INumber03
                    else:
                        set MiniGameNumber = INumber01
        StartMiniGame()
                      
    StartMiniGame() : void =
        # TODO : TEST FROM HERE
        # set MiniGameNumber = 18
        # Mini Games Test Only
        if(MiniGameNumber = 0):
            F000ClassicMode()
        else:
        if(MiniGameNumber = 1):
            F001PickaxeFight()
        else:
        if(MiniGameNumber = 2):
            F002BoogieBomb()
        else:
        if(MiniGameNumber = 3):
            F003DoublePump()
        else:
        if(MiniGameNumber = 4):
            F004InfinityAmmo()
        else:
        if(MiniGameNumber = 5):
            F005InstantReload()
        else:
        if(MiniGameNumber = 6):
            F006HarpoonGun()
        else:
        if(MiniGameNumber = 7):
            F007BodyGuards()
        else:
        if(MiniGameNumber = 8):
            F0082XDamage()
        else:
        if(MiniGameNumber = 9):
            F0092XHealth()
        else:
        if(MiniGameNumber = 10):
            F0102XSpeed()
        else:
        if(MiniGameNumber = 11):
            F0112XFly()
        else:
        if(MiniGameNumber = 12):
            F0122NDLife()
        else:
        if(MiniGameNumber = 13):
            F013HealUp()
        else:
        if(MiniGameNumber = 14):
            F014ShieldUP()
        else:
        if(MiniGameNumber = 15):
            F015NewSeason()
        else:
        if(MiniGameNumber = 16):
            F016Invisible()
        else:
        if(MiniGameNumber = 17):
            F017Invincible()
        else:
        if(MiniGameNumber = 18):
            F018TelePort()
        else:
        if(MiniGameNumber = 19):
            F0194XDamage()
        else:
        if(MiniGameNumber = 20):
            F0204XHealth()
        else:
        if(MiniGameNumber = 21):
            F0214XSpeed()
        else:
        if(MiniGameNumber = 22):
            F0224XFly()
        else:
        if(MiniGameNumber = 23):
            F023DYNAMITEOnly()
        else:
        if(MiniGameNumber = 24):
            F024PistolsOnly()
        else:
        if(MiniGameNumber = 25):
            F025SHADOWBOMB()
        else:
        if(MiniGameNumber = 26):
            F026STINKBOMB()
        else:
        if(MiniGameNumber = 27):
            F027CHILLERGrenade()
        else:
        if(MiniGameNumber = 28):
            F028SHOCKWAVEGRENADE()
        else:
        if(MiniGameNumber = 29):
            F029ImpulseGRENADE()
        else:
        if(MiniGameNumber = 30):
            F030Grenades()
        else:
        if(MiniGameNumber = 31):
            F031CLINGER()
        else:
        if(MiniGameNumber = 32):
            F032FireFlyJar()
        else:
        if(MiniGameNumber = 33):
            F033FlareGun()
        else:
        if(MiniGameNumber = 34):
            F034ExplosiveBow()
        else:
        if(MiniGameNumber = 35):
            F035FlameBow()
        else:
        if(MiniGameNumber = 36):
            F036StinkBow()
        else:
        if(MiniGameNumber = 37):
            F037BoomBow()
        else:
        if(MiniGameNumber = 38):
            F038ShockwaveBow()
        else:
        if(MiniGameNumber = 39):
            F039DualFiendHunters()
        else:
        if(MiniGameNumber = 40):
            F040HunterCrossbow()
        else:
        if(MiniGameNumber = 41):
            F041CupidCrossbow()
        else:
        if(MiniGameNumber = 42):
            F042GrapplerBow()
        else:
        if(MiniGameNumber = 43):
            F043BoltActionSniper()
        else:
        if(MiniGameNumber = 44):
            F044HuntingRifle()
        else:
        if(MiniGameNumber = 45):
            F045BoomSniper()
        else:
        if(MiniGameNumber = 46):
            F046LeverAction()
        else:
        if(MiniGameNumber = 47):
            F047DragonBreathSniper()
        else:
        if(MiniGameNumber = 48):
            F048RailGun()
        else:
        if(MiniGameNumber = 49):
            F049HeavySniper()
        else:
        if(MiniGameNumber = 50):
            F050ExplosiveRepeater()
        else:
        if(MiniGameNumber = 51):
            F051RemoteExplosives()
        else:
        if(MiniGameNumber = 52):
            F052RocketLauncher()
        else:
        if(MiniGameNumber = 53):
            F053GrenadeLauncher()
        else:
        if(MiniGameNumber = 54):
            F054PumpkinLauncher()
        else:
        if(MiniGameNumber = 55):
            F055SnowballLauncher()
        else:
        if(MiniGameNumber = 56):
            F056EggLauncher()
        else:
        if(MiniGameNumber = 57):
            F057QuedLauncher()
        else:
        if(MiniGameNumber = 58):
            F058RipsawLauncher()
        else:
        if(MiniGameNumber = 59):
            F059AnvilRocketLauncher()
        else:
        if(MiniGameNumber = 60):
            F060ExplosiveGooGun()
        else:
        if(MiniGameNumber = 61):
            F061ZygAndChoppyRay()

##################################################################################################
    # Work With All MiniGames        
    @editable 
    NoBuildMutatorDevice: mutator_zone_device = mutator_zone_device{}
    @editable 
    DefaultItemGranter: item_granter_device = item_granter_device{}
    @editable                    
    InfinityAmmoClass : class_and_team_selector_device = class_and_team_selector_device{} 
    @editable  
    InfinityConsumableClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    InstantReloadClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    F2XFlyClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    H2XHealthClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    HealUPClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    ShieldUPClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    L2NDLife : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    H4XHealthClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    InvincibleClass : class_and_team_selector_device = class_and_team_selector_device{}
    @editable  
    DefaultClass : class_and_team_selector_device = class_and_team_selector_device{}
##################################################################################################
    @editable 
    IG000ClassicMode : item_granter_device = item_granter_device{}                  
    F000ClassicMode() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG000ClassicMode.GrantItem(Player)
##################################################################################################
    F001PickaxeFight() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]): 
            DAM0082XDamage.Pickup(Player)
            DAM0194XDamage.Pickup(Player)
##################################################################################################
    @editable 
    IG002BoogieBomb : item_granter_device = item_granter_device{} 
    F002BoogieBomb() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG002BoogieBomb.GrantItem(Player)
################################################################################################## 
    @editable 
    IG003DoublePump : item_granter_device = item_granter_device{} 
    @editable 
    PM003DoublePump : player_marker_device = player_marker_device{} 
    F003DoublePump() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG003DoublePump.GrantItem(Player)
            PM003DoublePump.Attach(Player)
            PM003DoublePump.Enable()
##################################################################################################
    @editable 
    IG004InfinityAmmo : item_granter_device = item_granter_device{}  
    F004InfinityAmmo() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG004InfinityAmmo.GrantItem(Player)
##################################################################################################
    @editable 
    IG005InstantReload : item_granter_device = item_granter_device{} 
    F005InstantReload() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            InstantReloadClass.Enable()
            InstantReloadClass.ChangeTeamAndClass(Player)
            IG005InstantReload.GrantItem(Player)
##################################################################################################
    @editable 
    IG006HarpoonGun : item_granter_device = item_granter_device{} 
    F006HarpoonGun() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG006HarpoonGun.GrantItem(Player)
##################################################################################################
    # TODO: 007BodyGuards Respawn In Same Time
    @editable 
    IG007BodyGuards : item_granter_device = item_granter_device{}
    @editable 
    SP007BodyGuards : []guard_spawner_device = array{} 
    F007BodyGuards() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (PlayerIndex -> Player : AllPlayers ,FortCharacter := Player.GetFortCharacter[]): 
            IG007BodyGuards.GrantItem(Player)
            for (SpawnersBody: SP007BodyGuards):
                if (SpawnersBodys := SP007BodyGuards[PlayerIndex]):
                    SpawnersBodys.Hire(Player)
                    SpawnersBodys.Spawn(Player)
                    SpawnersBodys.Enable()
##################################################################################################
    @editable 
    IG0082XDamage : item_granter_device = item_granter_device{}
    @editable 
    DAM0082XDamage : damage_amplifier_powerup_device = damage_amplifier_powerup_device{} 
    F0082XDamage() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]): 
            DAM0082XDamage.Pickup(Player)
            IG0082XDamage.GrantItem(Player)
##################################################################################################
    @editable 
    IG0092XHealth : item_granter_device = item_granter_device{} 
    F0092XHealth() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            H2XHealthClass.Enable()
            H2XHealthClass.ChangeTeamAndClass(Player)
            IG0092XHealth.GrantItem(Player)
##################################################################################################
    @editable 
    IG0102XSpeed : item_granter_device = item_granter_device{} 
    @editable 
    MM0102XSpeed : movement_modulator_device = movement_modulator_device{} 
    F0102XSpeed() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            MM0102XSpeed.Activate(Player)
            IG0102XSpeed.GrantItem(Player)
##################################################################################################
    @editable 
    IG0112XFly : item_granter_device = item_granter_device{} 
    F0112XFly() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            F2XFlyClass.Enable()
            F2XFlyClass.ChangeTeamAndClass(Player)
            IG0112XFly.GrantItem(Player)
##################################################################################################
    @editable
    IG0122NDLife : item_granter_device = item_granter_device{} 
    F0122NDLife() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            L2NDLife.Enable()
            L2NDLife.ChangeTeamAndClass(Player)
            IG0122NDLife.GrantItem(Player)
##################################################################################################
    @editable 
    IG013HealUp : item_granter_device = item_granter_device{} 
    F013HealUp() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            HealUPClass.Enable()
            HealUPClass.ChangeTeamAndClass(Player)
            IG013HealUp.GrantItem(Player)
##################################################################################################
    @editable 
    IG014ShieldUP : item_granter_device = item_granter_device{} 
    F014ShieldUP() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            ShieldUPClass.Enable()
            ShieldUPClass.ChangeTeamAndClass(Player)
            IG014ShieldUP.GrantItem(Player)
##################################################################################################
    @editable 
    IG015NewSeason : item_granter_device = item_granter_device{} 
    F015NewSeason() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            IG015NewSeason.GrantItem(Player)
##################################################################################################        
    @editable 
    IG016Invisible : item_granter_device = item_granter_device{} 
    @editable
    CardDetector: conditional_button_device = conditional_button_device{}
    F016Invisible() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            IG016Invisible.GrantItem(Player)
        spawn:
            CheckForCard()

    CheckForCard()<suspends>:void=
        loop:
            Sleep (1.0)
            AllPlayers:=GetPlayspace().GetPlayers()
            for (Player: AllPlayers):
                if(IsAgent: agent = agent [Player]):
                    if(CardDetector.IsHoldingItem[IsAgent]):
                        HidePlayer(IsAgent)
                    else:
                        ShowPlayer(IsAgent)

    ShowPlayer (Agent: agent) : void =
        if(FC:=Agent.GetFortCharacter[]):
            FC.Show()
    HidePlayer (Agent: agent) : void =
        if(FC:=Agent.GetFortCharacter[]):
            FC.Hide()        
##################################################################################################            
    @editable 
    IG017Invincible : item_granter_device = item_granter_device{}
    @editable 
    SRM017Invincible : signal_remote_manager_device = signal_remote_manager_device{}
    F017Invincible() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]): 
            IG017Invincible.GrantItem(Player)
            SRM017Invincible.PrimarySignalEvent.Subscribe(MakeInvincible)
            SRM017Invincible.SecondarySignalEvent.Subscribe(MakeInvincible)

    MakeInvincible(Agent : agent):void =
            InvincibleClass.Enable()
            InvincibleClass.ChangeTeamAndClass(Agent)         
            spawn:
                InvincibleCoolDawn(Agent)
                
    InvincibleCoolDawn(Agent : agent)<suspends> : void=
        Sleep(25.0)
        InvincibleClass.Disable()
        DefaultClass.Enable()
        DefaultClass.ChangeTeamAndClass(Agent)
################################################################################################## 
    # TODO: TelePort018
    @editable 
    IG018TelePort : item_granter_device = item_granter_device{}
    @editable 
    SRM018TelePort : signal_remote_manager_device = signal_remote_manager_device{}
    @editable
    T018TelePort: []teleporter_device = array{}

    F018TelePort() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]): 
            IG018TelePort.GrantItem(Player)
            SRM018TelePort.PrimarySignalEvent.Subscribe(StartTelePort)
            SRM018TelePort.SecondarySignalEvent.Subscribe(StartTelePort)

    StartTelePort(Agent : agent):void =
        var LastIndex: int = 0
        for (TTelePort: T018TelePort):
            loop:
                RandomTeleport := GetRandomInt(0, T018TelePort.Length - 1)
                if (RandomTeleport <> LastIndex):
                    set LastIndex = + RandomTeleport
                    break
            if (RandomTelePort := T018TelePort[LastIndex]):
                RandomTelePort.Teleport(Agent)
################################################################################################## 
    @editable 
    IG0194XDamage : item_granter_device = item_granter_device{}
    @editable 
    DAM0194XDamage : damage_amplifier_powerup_device = damage_amplifier_powerup_device{} 
    F0194XDamage() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]): 
            DAM0082XDamage.Pickup(Player)
            DAM0194XDamage.Pickup(Player)
            IG0194XDamage.GrantItem(Player)
##################################################################################################
    @editable 
    IG0204XHealth : item_granter_device = item_granter_device{} 
    F0204XHealth() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            H4XHealthClass.Enable()
            H4XHealthClass.ChangeTeamAndClass(Player)
            IG0204XHealth.GrantItem(Player)
##################################################################################################
    @editable 
    IG0214XSpeed : item_granter_device = item_granter_device{} 
    @editable 
    MM0214XSpeed : movement_modulator_device = movement_modulator_device{} 
    F0214XSpeed() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            MM0102XSpeed.Activate(Player)
            MM0214XSpeed.Activate(Player)
            IG0102XSpeed.GrantItem(Player)
##################################################################################################
    @editable 
    IG0224XFly : item_granter_device = item_granter_device{} 
    F0224XFly() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):         
            F2XFlyClass.Enable()
            F2XFlyClass.ChangeTeamAndClass(Player)
            IG0224XFly.GrantItem(Player)
##################################################################################################
    @editable 
    IG023DYNAMITEOnly : item_granter_device = item_granter_device{} 
    F023DYNAMITEOnly() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG023DYNAMITEOnly.GrantItem(Player)
##################################################################################################
    @editable 
    IG024PistolsOnly : item_granter_device = item_granter_device{} 
    F024PistolsOnly() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG024PistolsOnly.GrantItem(Player)
##################################################################################################
    @editable 
    IG025SHADOWBOMB : item_granter_device = item_granter_device{} 
    F025SHADOWBOMB() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG025SHADOWBOMB.GrantItem(Player)
##################################################################################################
    @editable 
    IG026STINKBOMB : item_granter_device = item_granter_device{} 
    F026STINKBOMB() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG026STINKBOMB.GrantItem(Player)
##################################################################################################
    @editable 
    IG027CHILLERGrenade : item_granter_device = item_granter_device{} 
    F027CHILLERGrenade() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG027CHILLERGrenade.GrantItem(Player)
##################################################################################################
    @editable 
    IG028SHOCKWAVEGRENADE : item_granter_device = item_granter_device{} 
    F028SHOCKWAVEGRENADE() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG028SHOCKWAVEGRENADE.GrantItem(Player)
##################################################################################################
    @editable 
    IG029ImpulseGRENADE : item_granter_device = item_granter_device{} 
    F029ImpulseGRENADE() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG029ImpulseGRENADE.GrantItem(Player)
##################################################################################################
    @editable 
    IG030Grenades : item_granter_device = item_granter_device{} 
    F030Grenades() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            IG030Grenades.GrantItem(Player)
##################################################################################################
    @editable 
    IG031CLINGER : item_granter_device = item_granter_device{} 
    F031CLINGER() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG031CLINGER.GrantItem(Player)
##################################################################################################
    @editable 
    IG032FireFlyJar : item_granter_device = item_granter_device{} 
    F032FireFlyJar() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG032FireFlyJar.GrantItem(Player)
##################################################################################################
    @editable 
    IG033FlareGun : item_granter_device = item_granter_device{} 
    F033FlareGun() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG033FlareGun.GrantItem(Player)
##################################################################################################
    @editable 
    IG034ExplosiveBow : item_granter_device = item_granter_device{} 
    F034ExplosiveBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG034ExplosiveBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG035FlameBow : item_granter_device = item_granter_device{} 
    F035FlameBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG035FlameBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG036StinkBow : item_granter_device = item_granter_device{} 
    F036StinkBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG036StinkBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG037BoomBow : item_granter_device = item_granter_device{} 
    F037BoomBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG037BoomBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG038ShockwaveBow : item_granter_device = item_granter_device{} 
    F038ShockwaveBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG038ShockwaveBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG039DualFiendHunters : item_granter_device = item_granter_device{} 
    F039DualFiendHunters() : void = 
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG039DualFiendHunters.GrantItem(Player)
##################################################################################################
    @editable 
    IG040HunterCrossbow : item_granter_device = item_granter_device{} 
    F040HunterCrossbow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG040HunterCrossbow.GrantItem(Player)
##################################################################################################
    @editable 
    IG041CupidCrossbow : item_granter_device = item_granter_device{} 
    F041CupidCrossbow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG041CupidCrossbow.GrantItem(Player)
##################################################################################################
    @editable 
    IG042GrapplerBow : item_granter_device = item_granter_device{} 
    F042GrapplerBow() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG042GrapplerBow.GrantItem(Player)
##################################################################################################
    @editable 
    IG043BoltActionSniper : item_granter_device = item_granter_device{} 
    F043BoltActionSniper() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG043BoltActionSniper.GrantItem(Player)
##################################################################################################
    @editable 
    IG044HuntingRifle : item_granter_device = item_granter_device{} 
    F044HuntingRifle() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG044HuntingRifle.GrantItem(Player)
##################################################################################################
    @editable 
    IG045BoomSniper : item_granter_device = item_granter_device{} 
    F045BoomSniper() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG045BoomSniper.GrantItem(Player)
##################################################################################################
    @editable 
    IG046LeverAction : item_granter_device = item_granter_device{} 
    F046LeverAction() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG046LeverAction.GrantItem(Player)
##################################################################################################
    @editable 
    IG047DragonBreathSniper : item_granter_device = item_granter_device{} 
    F047DragonBreathSniper() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG047DragonBreathSniper.GrantItem(Player)
##################################################################################################
    @editable 
    IG048RailGun : item_granter_device = item_granter_device{} 
    F048RailGun() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG048RailGun.GrantItem(Player)
################################################################################################## 
    @editable 
    IG049HeavySniper : item_granter_device = item_granter_device{} 
    F049HeavySniper() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG049HeavySniper.GrantItem(Player)
################################################################################################## 
    @editable 
    IG050ExplosiveRepeater : item_granter_device = item_granter_device{} 
    F050ExplosiveRepeater() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG050ExplosiveRepeater.GrantItem(Player)
##################################################################################################
    @editable 
    IG051RemoteExplosives : item_granter_device = item_granter_device{} 
    F051RemoteExplosives() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG051RemoteExplosives.GrantItem(Player)
##################################################################################################
    @editable 
    IG052RocketLauncher : item_granter_device = item_granter_device{} 
    F052RocketLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG052RocketLauncher.GrantItem(Player)
################################################################################################## 
    @editable 
    IG053GrenadeLauncher : item_granter_device = item_granter_device{} 
    F053GrenadeLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG053GrenadeLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG054PumpkinLauncher : item_granter_device = item_granter_device{} 
    F054PumpkinLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG054PumpkinLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG055SnowballLauncher : item_granter_device = item_granter_device{} 
    F055SnowballLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG055SnowballLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG056EggLauncher : item_granter_device = item_granter_device{} 
    F056EggLauncher() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG056EggLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG057QuedLauncher : item_granter_device = item_granter_device{} 
    F057QuedLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG057QuedLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG058RipsawLauncher : item_granter_device = item_granter_device{} 
    F058RipsawLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityConsumableClass.Enable()
            InfinityConsumableClass.ChangeTeamAndClass(Player)
            IG058RipsawLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG059AnvilRocketLauncher : item_granter_device = item_granter_device{} 
    F059AnvilRocketLauncher() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)           
            IG059AnvilRocketLauncher.GrantItem(Player)
##################################################################################################
    @editable 
    IG060ExplosiveGooGun : item_granter_device = item_granter_device{} 
    F060ExplosiveGooGun() : void =
        NoBuildMutatorDevice.Disable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG060ExplosiveGooGun.GrantItem(Player)
##################################################################################################
    @editable 
    IG061ZygAndChoppyRay : item_granter_device = item_granter_device{} 
    F061ZygAndChoppyRay() : void =
        NoBuildMutatorDevice.Enable()
        AllPlayers := GetPlayspace().GetPlayers() 
        for (Player: AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            InfinityAmmoClass.Enable()
            InfinityAmmoClass.ChangeTeamAndClass(Player)
            IG061ZygAndChoppyRay.GrantItem(Player)
##################################################################################################

