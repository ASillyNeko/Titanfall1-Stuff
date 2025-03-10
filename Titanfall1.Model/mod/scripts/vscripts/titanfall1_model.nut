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

void function infinitecooldown( entity titan )
{
while( true )
{

if( !IsValid( titan ) )
return

if( !titan.IsTitan() )
return

entity rodeo = titan.GetOffhandWeapon( OFFHAND_ANTIRODEO )
 if ( IsValid( rodeo ) )
 {
 rodeo.SetWeaponPrimaryClipCountAbsolute( 6.9 )
 rodeo.SetWeaponPrimaryAmmoCount( 6.9 )
 }

WaitFrame()
}
}

void function ReplacePlayerPassiveForLoadoutChange( entity player, PilotLoadoutDef loadout )
{
ReplacePlayerPassive( player )
}

void function OnPilotBecomesTitan( entity player, entity titan )
{
player.GiveOffhandWeapon( "mp_titanweapon_stun_laser", OFFHAND_ANTIRODEO ) // Prevents Crashes
thread infinitecooldown( player )
thread LoopTakeInventorySmoke( player )
}

void function OnTitanBecomesPilot( entity player, entity titan )
{
titan.TakeOffhandWeapon(OFFHAND_ANTIRODEO)
thread LoopTakeInventorySmoke( titan )
}

void function LoopTakeInventorySmoke( entity titan )
{
while( true )
{
if( !IsValid( titan ) )
return

if( !titan.IsTitan() )
return

if( titan.IsTitan() )
titan.TakeOffhandWeapon(OFFHAND_INVENTORY)
WaitFrame()
}
}

void function RandomTitanfall1( entity titan )
{
if( !IsValid( GetPetTitanOwner( titan ) ) )
return

TakeWeaponsForArray( titan, titan.GetMainWeapons() )

// No Triple Threat Because It Does 0 Damage

int RandomWeapon = RandomIntRange( 0, 5 )

if( RandomWeapon == 0 )
titan.GiveWeapon("mp_titanweapon_rocketeer_rocketstream")
if( RandomWeapon == 1 )
titan.GiveWeapon("mp_titanweapon_sticky_40mm")
if( RandomWeapon == 2 )
titan.GiveWeapon("mp_titanweapon_xo16_vanguard")
if( RandomWeapon == 3 )
titan.GiveWeapon("mp_titanweapon_sniper")
if( RandomWeapon == 4 )
titan.GiveWeapon("mp_titanweapon_arc_cannon")

int RandomTac = RandomIntRange( 0, 3 )

if( RandomTac == 0 )
titan.GiveOffhandWeapon( "mp_titanweapon_vortex_shield", OFFHAND_SPECIAL )
if( RandomTac == 1 )
titan.GiveOffhandWeapon( "mp_titanability_particle_wall", OFFHAND_SPECIAL )
if( RandomTac == 2 )
{
titan.GiveOffhandWeapon( "mp_titanability_smoke", OFFHAND_SPECIAL )
titan.GetOffhandWeapon(OFFHAND_SPECIAL).AddMod("pas_defensive_core")
}

// No Slaved Warheads Because Its Not In Titanfall 2/Tone's Rockets Won't Work

int RandomOff = RandomIntRange( 0, 3 )

if( RandomOff == 0 )
titan.GiveOffhandWeapon( "mp_titanweapon_salvo_rockets", OFFHAND_ORDNANCE )
if( RandomOff == 1 )
titan.GiveOffhandWeapon( "mp_titanweapon_dumbfire_rockets", OFFHAND_ORDNANCE )
if( RandomOff == 2 )
titan.GiveOffhandWeapon( "mp_titanweapon_shoulder_rockets", OFFHAND_ORDNANCE )
}

void function Titanfall1Model( entity titan )
{
    titan.TakeOffhandWeapon(OFFHAND_EQUIPMENT)
    titan.GiveOffhandWeapon( "mp_titancore_amp_core", OFFHAND_EQUIPMENT )
	titan.TakeOffhandWeapon(OFFHAND_ANTIRODEO)
	titan.TakeOffhandWeapon(OFFHAND_SPECIAL)
	titan.TakeOffhandWeapon(OFFHAND_ORDNANCE)
	thread LoopTakeInventorySmoke( titan )
	thread RandomTitanfall1( titan )

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
