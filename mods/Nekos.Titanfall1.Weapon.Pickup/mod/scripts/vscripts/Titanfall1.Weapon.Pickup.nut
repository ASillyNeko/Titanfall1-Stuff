untyped

global function titanfall1_weapon_pickup_init


//Init func
void function titanfall1_weapon_pickup_init() {
    #if SERVER
    AddCallback_OnPlayerKilled(DropPlayerTitanWeapon)
    AddCallback_OnNPCKilled(DropPlayerTitanWeapon)
    #endif
}

#if SERVER
void function DropPlayerTitanWeapon(entity victim, entity attacker,var damageInfo) {
    thread DropPlayerTitanWeapon_threaded(victim, attacker, damageInfo)
}

void function Rep1aceWeapon(entity player, string weapon, array < string > mods, entity weaponmodel) {
    array < entity > weapons = player.GetMainWeapons()
    player.TakeWeaponNow(weapons[0].GetWeaponClassName())
    player.GiveWeapon(weapon, mods)
    player.SetActiveWeaponByName(weapon)
    if (weapon != "mp_titanweapon_arc_cannon" )
    player.GetActiveWeapon().SetWeaponPrimaryClipCount( 0 )
    weaponmodel.Destroy()
}

void function DropPlayerTitanWeapon_threaded(entity victim, entity attacker, var damageInfo) {
    array < entity > weapons = victim.GetMainWeapons()
    vector droppoint = victim.GetOrigin() + Vector(0, 0, 15)
    if (IsValid(victim) && weapons.len() != 0) {
        if (IsValid(weapons[0] && victim.IsTitan() ))
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_particle_accelerator" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_particle_accelerator/w_titan_particle_accelerator.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP SPLITTER RILFE", "PRESS %use% TO PICK UP SPLITTER RILFE")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_meteor" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_thermite_launcher/w_titan_thermite_launcher.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP THERMITE LAUNCHER", "PRESS %use% TO PICK UP THERMITE LAUNCHER")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_arc_cannon" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_arc_rifle/w_titan_arc_rifle.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARC CANNON", "PRESS %use% TO PICK UP ARC CANNON")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_sniper" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_sniper_rifle/w_titan_sniper_rifle.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP PLASMA RAILGUN", "PRESS %use% TO PICK UP PLASMA RAILGUN")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_leadwall" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_triple_threat/w_titan_triple_threat.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% PICK UP LEADWALL", "PRESS %use% PICK UP LEADWALL")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_sticky_40mm" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/thr_40mm/w_thr_40mm.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP 40MM CANNON", "PRESS %use% TO PICK UP 40MM CANNON")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if ( weapons[0].GetMods().len() == 0 && weapons[0].GetWeaponClassName() == "mp_titanweapon_predator_cannon" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_predator/w_titan_predator.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP PREDATOR CANNON", "PRESS %use% TO PICK UP PREDATOR CANNON")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if ( weapons[0].GetMods().len() == 0 && weapons[0].GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP XO16", "PRESS %use% TO PICK UP XO16")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )
            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_rocketeer_rocketstream" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_rocket_launcher/titan_rocket_launcher.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP QUAD ROCKET", "PRESS %use% TO PICK UP QUAD ROCKET")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )
            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && victim.IsTitan())
        {
            if (weapons[0].GetWeaponClassName() == "mp_titanweapon_triplethreat" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_triple_threat_og/w_titan_triple_threat_og.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP TRIPLETHREAT", "PRESS %use% TO PICK UP TRIPLETHREAT")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }


    // WEAPON WITH MODS


    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && weapons[0].GetMods().len() != 0 && victim.IsTitan() )
        {
            if (weapons[0].GetMods()[0] == "arc_rounds_with_battle_rifle" && weapons[0].GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARC-RIFLE XO16", "PRESS %use% TO PICK UP ARC-RIFLE XO16")
                AddCallback_OnUseEntity(weaponmodel, FUCKXO16)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && weapons[0].GetMods().len() != 0 && victim.IsTitan() )
        {
            if (weapons[0].GetMods()[0] == "battle_rifle" && weapons[0].GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP RIFLE XO16", "PRESS %use% TO PICK UP RIFLE XO16")
                AddCallback_OnUseEntity(weaponmodel, ExtraXO16)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (weapons[0].GetMods().len() != 0 && IsValid(weapons[0]) && victim.IsTitan() )
        {
            if (weapons[0].GetMods()[0] == "pas_legion_weapon" && weapons[0].GetWeaponClassName() == "mp_titanweapon_predator_cannon" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_predator/w_titan_predator.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP EXTEND-MAG PREDATOR CANNON", "PRESS %use% TO PICK UP EXTEND-MAG PREDATOR CANNON")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeaponWithMods)
                thread DestroyDroppedWeapon( weaponmodel )


            }
        }
    }
    if (IsValid(victim) && weapons.len() != 0 && IsValid(weapons[0])) {
        if (IsValid(weapons[0]) && weapons[0].GetMods().len() != 0 && victim.IsTitan())
        {
            if (weapons[0].GetMods()[0] == "arc_rounds" && weapons[0].GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
                entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", droppoint, < 0, 0, 90 > , SOLID_VPHYSICS)
                weaponmodel.SetUsable()
                weaponmodel.SetUsableByGroup("titan")
                weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARCROUND XO16", "PRESS %use% TO PICK UP ARCROUND XO16")
                AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeaponWithMods)
                thread DestroyDroppedWeapon( weaponmodel )
            }
        }
    }


}

void function ReplaceDroppedWeapon( entity player , entity weapon , vector origin ,vector angle )
{
    if (IsValid(weapon) && player.IsTitan() )
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_particle_accelerator" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_particle_accelerator/w_titan_particle_accelerator.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP SPLITTER RILFE", "PRESS %use% TO PICK UP SPLITTER RILFE")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_meteor" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_thermite_launcher/w_titan_thermite_launcher.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP THERMITE LAUNCHER ", "PRESS %use% TO PICK UP THERMITE LAUNCHER ")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )

        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_arc_cannon" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_arc_rifle/w_titan_arc_rifle.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARC CANNON ", "PRESS %use% TO PICK UP ARC CANNON ")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )

        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_sniper" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_sniper_rifle/w_titan_sniper_rifle.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP PLASMA RAILGUN", "PRESS %use% TO PICK UP PLASMA RAILGUN")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_leadwall" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_triple_threat/w_titan_triple_threat.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP LEADWALL", "PRESS %use% TO PICK UP LEADWALL")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_sticky_40mm" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/thr_40mm/w_thr_40mm.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP 40MM CANNON", "PRESS %use% TO PICK UP 40MM CANNON")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
   if (IsValid(weapon) && player.IsTitan())
    {
        if ( weapon.GetMods().len() == 0 && weapon.GetWeaponClassName() == "mp_titanweapon_predator_cannon" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_predator/w_titan_predator.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP PREDATOR CANNON", "PRESS %use% TO PICK UP PREDATOR CANNON")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if ( weapon.GetMods().len() == 0 && weapon.GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP XO16", "PRESS %use% TO PICK UP XO16")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_rocketeer_rocketstream" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_rocket_launcher/titan_rocket_launcher.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ROCKTEER", "PRESS %use% TO PICK UP ROCKTEER")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && player.IsTitan())
    {
        if (weapon.GetWeaponClassName() == "mp_titanweapon_triplethreat" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_triple_threat_og/w_titan_triple_threat_og.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP TRIPLETHREAT", "PRESS %use% TO PICK UP TRIPLETHREAT")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeapon)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }


    // WEAPON WITH MODS

    if (IsValid(weapon) && weapon.GetMods().len() != 0 && player.IsTitan())
    {
        if (weapon.GetMods()[0] == "arc_rounds_with_battle_rifle" && weapon.GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARC-RIFLE XO16", "PRESS %use% TO PICK UP ARC-RIFLE XO16")
            AddCallback_OnUseEntity(weaponmodel, FUCKXO16)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && weapon.GetMods().len() != 0 && player.IsTitan())
    {
        if (weapon.GetMods()[0] == "battle_rifle" && weapon.GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP RIFLE XO16", "PRESS %use% TO PICK UP RIFLE XO16")
            AddCallback_OnUseEntity(weaponmodel, ExtraXO16)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon) && weapon.GetMods().len() != 0 && player.IsTitan())
    {
        if (weapon.GetMods()[0] == "arc_rounds" && weapon.GetWeaponClassName() == "mp_titanweapon_xo16_vanguard" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP ARCROUND XO16", "PRESS %use% TO PICK UP ARCROUND XO16")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeaponWithMods)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
    if (IsValid(weapon)&& weapon.GetMods().len() != 0 && player.IsTitan())
    {
        if (weapon.GetMods()[0] == "pas_legion_weapon" && weapon.GetWeaponClassName() == "mp_titanweapon_predator_cannon" ) {
            entity weaponmodel = CreatePropDynamic($"models/weapons/titan_predator/w_titan_predator.mdl", origin, < 0, 0, 90 > , SOLID_VPHYSICS)
            weaponmodel.SetUsable()
            weaponmodel.SetUsableByGroup("titan")
            weaponmodel.SetUsePrompts("HOLD %use% TO PICK UP EXTEND-MAG PREDATOR CANNON", "PRESS %use% TO PICK UP EXTEND-MAG PREDATOR CANNON")
            AddCallback_OnUseEntity(weaponmodel, GiveDroppedTitanWeaponWithMods)
            thread DestroyDroppedWeapon( weaponmodel )
        }
    }
}

function GiveDroppedTitanWeaponWithMods( weaponmodel , player )
{
    expect entity(player)
    expect entity(weaponmodel)
    vector origin = weaponmodel.GetOrigin()
    vector ang = weaponmodel.GetAngles()
    entity weapon = player.GetActiveWeapon()
        thread ReplaceDroppedWeapon( player , weapon , origin , ang )
        if (weaponmodel.GetModelName() == $"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_xo16_vanguard", ["arc_rounds"], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_predator/w_titan_predator.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_predator_cannon", ["pas_legion_weapon"], weaponmodel)
        }
}



function GiveDroppedTitanWeapon( weaponmodel, player ) {
    expect entity(player)
    expect entity(weaponmodel)
    vector origin = weaponmodel.GetOrigin()
    vector ang = weaponmodel.GetAngles()
    entity weapon = player.GetActiveWeapon()
        thread ReplaceDroppedWeapon( player , weapon , origin , ang )
        if (weaponmodel.GetModelName() == $"models/weapons/titan_particle_accelerator/w_titan_particle_accelerator.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_particle_accelerator", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_thermite_launcher/w_titan_thermite_launcher.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_meteor", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_arc_rifle/w_titan_arc_rifle.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_arc_cannon", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_sniper_rifle/w_titan_sniper_rifle.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_sniper", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_triple_threat/w_titan_triple_threat.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_leadwall", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/thr_40mm/w_thr_40mm.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_sticky_40mm", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_predator/w_titan_predator.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_predator_cannon", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_xo16_vanguard", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_rocket_launcher/titan_rocket_launcher.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_rocketeer_rocketstream", [], weaponmodel)
        }
        if (weaponmodel.GetModelName() == $"models/weapons/titan_triple_threat_og/w_titan_triple_threat_og.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_triplethreat", [], weaponmodel)
        }
}

function FUCKXO16( weaponmodel , player )
{
    expect entity(player)
    expect entity(weaponmodel)
    vector origin = weaponmodel.GetOrigin()
    vector ang = weaponmodel.GetAngles()
    entity weapon = player.GetActiveWeapon()
        thread ReplaceDroppedWeapon( player , weapon , origin , ang )
        if (weaponmodel.GetModelName() == $"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_xo16_vanguard", ["arc_rounds_with_battle_rifle"], weaponmodel)
        }
}

function ExtraXO16( weaponmodel , player )
{
    expect entity(player)
    expect entity(weaponmodel)
    vector origin = weaponmodel.GetOrigin()
    vector ang = weaponmodel.GetAngles()
    entity weapon = player.GetActiveWeapon()
        thread ReplaceDroppedWeapon( player , weapon , origin , ang )
        if (weaponmodel.GetModelName() == $"models/weapons/titan_xo16_shorty/w_xo16shorty.mdl") {
            Rep1aceWeapon(player, "mp_titanweapon_xo16_vanguard", ["battle_rifle"], weaponmodel)
        }
}

void function DestroyDroppedWeapon( entity weaponmodel )
{
    wait(30)
    if ( IsValid( weaponmodel ) )
        weaponmodel.Destroy()
}

#endif