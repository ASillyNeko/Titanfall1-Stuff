global function Campaign_CarouselMode_Init

global const string GAMEMODE_CAMPAIGN_CAROUSEL = "campaign_carousel"

void function Campaign_CarouselMode_Init()
{
    AddCallback_OnCustomGamemodesInit( CreateGamemodeCampaign )
}

void function CreateGamemodeCampaign()
{
    GameMode_Create( GAMEMODE_CAMPAIGN_CAROUSEL )
    GameMode_SetName( GAMEMODE_CAMPAIGN_CAROUSEL, "Campaign" )
    GameMode_SetDesc( GAMEMODE_CAMPAIGN_CAROUSEL, "Titanfall 1 Campaign" )
    GameMode_SetGameModeAnnouncement( GAMEMODE_CAMPAIGN_CAROUSEL, "grnc_modeDesc" )
    GameMode_SetDefaultTimeLimits( GAMEMODE_CAMPAIGN_CAROUSEL, 12, 0 )
    GameMode_SetDefaultScoreLimits( GAMEMODE_CAMPAIGN_CAROUSEL, 500, 0 )
    GameMode_AddScoreboardColumnData( GAMEMODE_CAMPAIGN_CAROUSEL, "#SCOREBOARD_SCORE", PGS_SCORE, 2 )
    GameMode_AddScoreboardColumnData( GAMEMODE_CAMPAIGN_CAROUSEL, "#SCOREBOARD_TITAN_KILLS", PGS_TITAN_KILLS, 2 )
    GameMode_AddScoreboardColumnData( GAMEMODE_CAMPAIGN_CAROUSEL, "#SCOREBOARD_PILOT_KILLS", PGS_PILOT_KILLS, 2 )
    GameMode_AddScoreboardColumnData( GAMEMODE_CAMPAIGN_CAROUSEL, "#SCOREBOARD_GRUNT_KILLS", PGS_NPC_KILLS, 2 )
    //GameMode_AddScoreboardColumnData( GAMEMODE_CAMPAIGN_CAROUSEL, "#SCOREBOARD_DEATHS", PGS_DEATHS, 2 )
    GameMode_SetColor( GAMEMODE_CAMPAIGN_CAROUSEL, [147, 204, 57, 255] )

    AddPrivateMatchMode( GAMEMODE_CAMPAIGN_CAROUSEL ) // add to private lobby modes

    #if SERVER
        GameMode_AddServerInit( GAMEMODE_CAMPAIGN_CAROUSEL, GamemodeCampaign_Int )
        GameMode_SetPilotSpawnpointsRatingFunc( GAMEMODE_CAMPAIGN_CAROUSEL, RateSpawnpoints_Generic )
        GameMode_SetTitanSpawnpointsRatingFunc( GAMEMODE_CAMPAIGN_CAROUSEL, RateSpawnpoints_Generic )
    #endif
    #if !UI
        GameMode_SetScoreCompareFunc( GAMEMODE_CAMPAIGN_CAROUSEL, CompareAssaultScore )
    #endif
}