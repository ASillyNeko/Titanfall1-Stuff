global function titanfall1_rodeo_init


void function titanfall1_rodeo_init() {
AddOnRodeoStartedCallback( PilotStartRodeoOnTitan )
AddCallback_OnTitanBecomesPilot( OnTitanBecomesPilot )
AddCallback_OnPlayerRespawned( TakeLowProfilePassive )
AddCallback_OnPlayerGetsNewPilotLoadout( TakeLowProfilePassiveForLoadoutChange )
}

void function TakeLowProfilePassive( entity player )
{
if( PlayerHasPassive( player, ePassives.PAS_STEALTH_MOVEMENT ) )
TakePassive( player, ePassives.PAS_STEALTH_MOVEMENT )
}

void function TakeLowProfilePassiveForLoadoutChange( entity player, PilotLoadoutDef loadout )
{
TakeLowProfilePassive( player )
}

void function OnTitanBecomesPilot( entity player, entity titan )
{
thread OnTitanBecomesPilotThread( player, titan )
}

void function OnTitanBecomesPilotThread( entity player, entity titan )
{
wait 1
if ( IsValid( GetEnemyRodeoPilot( titan ) ) )
thread PilotStartRodeoOnTitan( player, titan )
}

void function TitanStandUpModded( entity titan )
{
if ( titan.GetTitanSoul().GetStance() == STANCE_KNEEL )
return
if ( titan.GetTitanSoul().GetStance() == STANCE_KNEELING )
return
if( !IsValid( GetPetTitanOwner( titan ) ) )
return
if ( IsPlayerEmbarking( GetPetTitanOwner( titan ) ) )
return
	//entity soul = titan.GetTitanSoul()
	// stand up
	ShowMainTitanWeapons( titan )
	titan.Anim_Stop()
	thread PlayAnimGravity( titan, "at_hotdrop_quickstand" )
	//Assert( soul == titan.GetTitanSoul() )
	SetStanceStand( titan.GetTitanSoul() )
}


void function TitanKneelModded( entity titan )
{
	titan.EndSignal( "TitanStopsThinking" )
	titan.EndSignal( "OnDeath" )
	Assert( IsAlive( titan ) )
	//entity soul = titan.GetTitanSoul()

	if ( titan.GetTitanSoul().GetStance() == STANCE_STAND )
	waitthread KneelToShowRiderModded( titan )
	if ( !IsValid( titan ) )
	return

	if( !IsValid( GetPetTitanOwner( titan ) ) )
    return

    if ( IsPlayerEmbarking( GetPetTitanOwner( titan ) ) )
	return

	thread PlayAnimGravity( titan, "at_MP_embark_idle_blended" )
	SetStanceKneel( titan.GetTitanSoul() )
	WaitFrame()
}

void function KneelToShowRiderModded( entity titan )
{
	vector startPos = titan.GetOrigin()

	// reworked think, still make titan unable to stand sometimes
	/*
	thread PlayAnim( titan, "at_mortar_stand2knee" )
	titan.Anim_DisableUpdatePosition()
	WaittillAnimDone( titan )
	
	// just set titan to start position...
	titan.SetOrigin( startPos )

	return
	*/

	// adding position fix at the end of function
	entity soul = titan.GetTitanSoul()
	entity player = GetPetTitanOwner( titan )
	string animation
	int yawDif

	// unfortunately "hide weapon" isn't featured in titanfall 2
	// modified to remove it
	//thread HideOgreMainWeaponFromEnemies( titan )
		// try to fix titan getting stuck
		//waitthread PlayAnimGravity( titan, animation )
		thread PlayAnimGravity( titan, "at_MP_stand2knee_straight" )
		titan.Anim_DisableUpdatePosition()
		WaittillAnimDone( titan )
		if( !IsValid( titan ) )
		return

	if ( !TitanCanStand( titan ) )// sets the var
	{
		// try to put the titan on the navmesh
		vector ornull clampedPos = NavMesh_ClampPointForAIWithExtents( titan.GetOrigin(), titan, < 100, 100, 100 > )
		if ( clampedPos != null )
		{
			expect vector( clampedPos )
			titan.SetOrigin( clampedPos )
			TitanCanStand( titan )
		}
	}

	PutEntityInSafeSpot( titan, null, null, startPos, titan.GetOrigin() )
}

void function PilotStartRodeoOnTitan( entity pilot, entity titan )
{
if( IsValid( GetPetTitanOwner( titan ) ) )
{
if ( !IsPlayerEmbarking( GetPetTitanOwner( titan ) ) )
{
	if ( IsValid( GetEnemyRodeoPilot( titan ) ) )
	{
    thread RodeoKneel( titan )
	thread TitanElectricSmoke( titan )
	}
}
}
}

void function RodeoKneel( entity titan )
{
if ( IsValid( GetEnemyRodeoPilot( titan ) ) )
{
waitthread TitanKneelModded( titan )
thread StopRodeoKneel( titan )
}
}

void function StopRodeoKneel( entity titan )
{
while( true )
{
 if( IsValid( titan ) )
 {
 if ( !IsValid( GetEnemyRodeoPilot( titan ) ) )
 {
 TitanStandUpModded( titan )
 WaitForever()
 }
 }
WaitFrame()
}
}

void function RemoveAmmoPerSecond( entity titan )
{
entity smoketac = titan.GetOffhandWeapon( OFFHAND_SPECIAL )
if( !IsValid( smoketac ) )
return
if( !IsValid( titan ) )
return
while( smoketac.GetWeaponPrimaryAmmoCount() > 0 )
{
if( !IsValid( smoketac ) )
return
if( !IsValid( titan ) )
return
smoketac.SetWeaponPrimaryAmmoCount( smoketac.GetWeaponPrimaryAmmoCount() - 1 )
if ( smoketac.GetWeaponPrimaryAmmoCount() == 0 )
return
wait 1
if( !IsValid( smoketac ) )
return
if( !IsValid( titan ) )
return
}
}

void function TitanElectricSmokeLoop( entity titan )
{
while ( true )
{
    if( !IsValid( titan ) )
	return

	if ( !IsValid( GetEnemyRodeoPilot( titan ) ) )
	return

    entity soul = titan.GetTitanSoul()
	soul.EndSignal( "OnDestroy" )
	soul.EndSignal( "OnDeath" )
	if( IsValid( titan ) && IsValid( soul ) && !titan.ContextAction_IsMeleeExecution() )
	{
		entity smokeinventory = titan.GetOffhandWeapon( OFFHAND_INVENTORY )
		entity smoketac = titan.GetOffhandWeapon( OFFHAND_SPECIAL )
		if ( smoketac != null )
		{
		if ( smoketac.HasMod( "pas_defensive_core" ) )
		{
		if ( smoketac.GetWeaponPrimaryAmmoCount() == 0 )
		{
		smoketac.SetWeaponPrimaryAmmoCount( 20 )
		smoketac.SetWeaponPrimaryClipCountAbsolute( 20 )
		TitanSmokescreen( titan, smoketac )
		thread RemoveAmmoPerSecond( titan )
		WaitForever()
		}
		}
		}
		if ( smokeinventory != null )
		{
		    if ( smokeinventory.GetWeaponPrimaryAmmoCount() != 0 )
			{
		    smokeinventory.SetWeaponPrimaryAmmoCount( smokeinventory.GetWeaponPrimaryAmmoCount() - 1 )
			TitanSmokescreen( titan, smokeinventory )
			WaitForever()
			}
			if ( smokeinventory.GetWeaponPrimaryAmmoCount() == 0 )
			{
			titan.TakeOffhandWeapon( OFFHAND_INVENTORY )
			TitanSmokescreen( titan, smokeinventory )
			WaitForever()
			}
		}
	}
WaitFrame()
}
}

void function TitanElectricSmoke( entity titan )
{
	Assert( IsValid( titan ) && titan.IsTitan(), "Entity is not a Titan: " + titan )
	
	wait 1
	thread TitanElectricSmokeLoop( titan )
}

void function TitanSmokescreen( entity ent, entity weapon )
{
	SmokescreenStruct smokescreen
	array<entity> primaryWeapons = ent.GetMainWeapons()
	
	if( !primaryWeapons.len() )
		return
		
	entity maingun = primaryWeapons[0]
	if ( IsValid( maingun ) && maingun.HasMod( "fd_vanguard_utility_1" ) )
		smokescreen.smokescreenFX = FX_ELECTRIC_SMOKESCREEN_HEAL
	smokescreen.isElectric = true
	smokescreen.ownerTeam = ent.GetTeam()
	smokescreen.attacker = ent
	smokescreen.inflictor = ent
	smokescreen.weaponOrProjectile = weapon
	smokescreen.damageInnerRadius = 320.0
	smokescreen.damageOuterRadius = 375.0
	smokescreen.dangerousAreaRadius = 1.0
	if ( weapon.HasMod( "maelstrom" ) )
	{
		smokescreen.dpsPilot = 90
		smokescreen.dpsTitan = 1350
		smokescreen.deploySound1p = SFX_SMOKE_DEPLOY_BURN_1P
		smokescreen.deploySound3p = SFX_SMOKE_DEPLOY_BURN_3P
	}
	else
	{
		smokescreen.dpsPilot = 45
		smokescreen.dpsTitan = 450
	}
	smokescreen.damageDelay = 1.0
	smokescreen.blockLOS = false

	vector eyeAngles = <0.0, ent.EyeAngles().y, 0.0>
	smokescreen.angles = eyeAngles

	vector forward = AnglesToForward( eyeAngles )
	vector testPos = ent.GetOrigin() + forward * 240.0
	vector basePos = testPos

	float trace = TraceLineSimple( ent.EyePosition(), testPos, ent )
	if ( trace != 1.0 )
		basePos = ent.GetOrigin()

	float fxOffset = 200.0
	float fxHeightOffset = 148.0

	smokescreen.origin = basePos

	smokescreen.fxOffsets = [ < -fxOffset, 0.0, 20.0>,
							  <0.0, fxOffset, 20.0>,
							  <0.0, -fxOffset, 20.0>,
							  <0.0, 0.0, fxHeightOffset>,
							  < -fxOffset, 0.0, fxHeightOffset> ]

	Smokescreen( smokescreen )
}
