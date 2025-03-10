global function titanfall1_execution_init


void function titanfall1_execution_init() {
	#if SERVER
	AddSpawnCallback("npc_titan", Titanfall1_Execution )
	#endif
}
#if SERVER
void function Titanfall1_Execution( entity titan )
{
    entity soul = titan.GetTitanSoul()
	string attackerType = GetTitanCharacterName( titan )
	switch ( attackerType )
	    {
		case "ronin":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_stryder"
                        break;
		case "scorch":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_ogre"
                        break;
		case "legion":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_ogre"
			            break;
		case "ion":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_atlas"
                        break;
		case "tone":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_atlas"
                        break;
		case "vanguard":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_atlas"
						if(IsValid(soul))
						TakePassive( soul, ePassives.PAS_VANGUARD_COREMETER )
                        break;
        case "northstar":
		                if(IsValid(soul))
                        soul.soul.titanLoadout.titanExecution = "execution_stryder"
			            break;
	    }
}
#endif
