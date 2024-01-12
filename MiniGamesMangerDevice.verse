
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

MiniGamesMangerDevice := class(creative_device):

    @editable
    EndGame : end_game_device = end_game_device{}
    @editable
    WeaponGranters : []item_granter_device = array{}

    var MiniGamesVotePerPlayer: [player]MiniGamesVoteDevice = map{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitializeUI()
        # Sleep(1.0)
        # MiniGamesTimerEnd()

    InitializeUI():void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player : AllPlayers, WClass := set MiniGamesVotePerPlayer[Player] = MiniGamesVoteDevice{}):
            WClass.AddUI(Player)

    MiniGamesTimerEnd()<suspends>:void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player : AllPlayers, WClass := set MiniGamesVotePerPlayer[Player] = MiniGamesVoteDevice{}):
            WClass.RemoveUI(Player)