global function titanfall1_model_init


void function titanfall1_model_init() {
    PrecacheModel($"models/titans/stryder/stryder_titan.mdl")
    PrecacheModel($"models/titans/ogre/ogre_titan.mdl")
    PrecacheModel($"models/titans/atlas/atlas_titan.mdl")
	#if SERVER
	AddSpawnCallback("npc_titan", Titanfall1Model )
    AddCallback_OnPlayerRespawned( ReplacePlayerPassive )
    AddCallback_OnPlayerGetsNewPilotLoadout( ReplacePlayerPassiveForLoadoutChange )
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

void function NoPlayerTitanfall1Model( entity titan )
{
    titan.WaitSignal( "TitanHotDropComplete" )
	if( !IsValid( titan ) )
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
                        break;
		case "tone": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
                        break;
		case "vanguard": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
                        break;
        case "northstar": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
			            break;
	    }
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
                        break;
		case "tone": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
                        break;
		case "vanguard": titan.SetModel($"models/titans/atlas/atlas_titan.mdl")
                        break;
        case "northstar": titan.SetModel($"models/titans/stryder/stryder_titan.mdl")
			            break;
	    }
}
#endif
