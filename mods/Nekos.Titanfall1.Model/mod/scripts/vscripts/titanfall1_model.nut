global function titanfall1_model_init


void function titanfall1_model_init() {
    PrecacheModel($"models/titans/stryder/stryder_titan.mdl")
    PrecacheModel($"models/titans/ogre/ogre_titan.mdl")
    PrecacheModel($"models/titans/atlas/atlas_titan.mdl")
	#if SERVER
	AddSpawnCallback("npc_titan", Titanfall1Model )
    AddCallback_OnPlayerRespawned( ReplacePlayerPassive )
    AddCallback_OnPlayerGetsNewPilotLoadout( ReplacePlayerPassiveForLoadoutChange )
	AddCallback_OnTitanBecomesPilot( OnTitanBecomesPilot )
	AddCallback_OnPilotBecomesTitan( OnPilotBecomesTitan )
	#endif
}
#if SERVER
void function ReplacePlayerPassive( entity player )
{
if( PlayerHasPassive( player, ePassives.PAS_FAST_EMBARK ) )
TakePassive( player, ePassives.PAS_FAST_EMBARK )
}

void function ReplacePlayerPassiveForLoadoutChange( entity player, PilotLoadoutDef loadout )
{
ReplacePlayerPassive( player )
}

void function OnPilotBecomesTitan( entity player, entity titan )
{
thread OnTitanBodyGroupChange( player )
}

void function OnTitanBecomesPilot( entity player, entity titan )
{
thread OnTitanBodyGroupChange( titan )
}

void function OnTitanBodyGroupChange( entity titan )
{
 while( true )
 {
 if( !IsValid( titan ) )
 return
 if( !titan.IsTitan() )
 return
 if ( titan.GetModelName() != $"models/titans/atlas/atlas_titan.mdl" )
 return
 if ( titan.GetBodyGroupState( 4 ) != 1 )
 titan.SetBodygroup( 4, 1 )
 WaitFrame()
 }
}

void function NoPlayerTitanfall1Model( entity titan )
{
    WaitEndFrame()

	if( titan.e.isHotDropping != false )
    titan.WaitSignal( "TitanHotDropComplete" )

    if( !IsValid( titan ) )
	return

	if ( titan.GetModelName() == $"models/titans/stryder/stryder_titan.mdl" || titan.GetModelName() == $"models/titans/ogre/ogre_titan.mdl" || titan.GetModelName() == $"models/titans/atlas/atlas_titan.mdl" )
	return

	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
                        break;
		case "scorch": titan.SetModel($"models/titans/ogre/ogre_titan.mdl")
                        break;
		case "legion": titan.SetModel($"models/titans/ogre/ogre_titan.mdl")
			            break;
		case "ion": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		            titan.SetBodygroup( 4, 1 )
                        break;
		case "tone": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		             titan.SetBodygroup( 4, 1 )
                        break;
		case "vanguard": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		                 titan.SetBodygroup( 4, 1 )
                        break;
        case "northstar": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
			            break;
	    }
thread OnTitanBodyGroupChange( titan )
}

void function Titanfall1Model( entity titan )
{
if( !IsValid( GetPetTitanOwner( titan ) ) )
{
thread NoPlayerTitanfall1Model( titan )
return
}

	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
                        break;
		case "scorch": titan.SetModel($"models/titans/ogre/ogre_titan.mdl")
                        break;
		case "legion": titan.SetModel($"models/titans/ogre/ogre_titan.mdl")
			            break;
		case "ion": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		            titan.SetBodygroup( 4, 1 )
                        break;
		case "tone": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		             titan.SetBodygroup( 4, 1 )
                        break;
		case "vanguard": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
		                 titan.SetBodygroup( 4, 1 )
                        break;
        case "northstar": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
			            break;
	    }
thread OnTitanBodyGroupChange( titan )
}
#endif
