function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
  end


--
--STARTING FOREST
--

function forest_start()
  return true
end

function forest_start_to_forest_east_above_spring()
  return forest_start()
end

function forest_east_above_spring()
  return forest_start
  or forest_upper_east_to_forest_east_above_spring()
  or forest_lower_riverbank_exit_to_forest_east_above_spring()
  or forest_upper_riverbank_exit_to_forest_east_above_spring()
  or forest_upper_east_egg_ledge_to_forest_east_above_spring()
end

function forest_start_to_forest_cocoa_room()
  return forest_start()
end

function forest_cocoa_to_forest_start()
  return forest_start()
end

function forest_east_above_spring_to_forest_upper_east()
  return (forest_start_to_forest_east_above_spring() or forest_upper_riverbank_exit_to_forest_east_above_spring() or forest_lower_riverbank_exit_to_forest_east_above_spring() or forest_upper_east_egg_ledge_to_forest_east_above_spring())
    and ((ITM_Hard())
      or (ITM() and has ("speed"))
      or (has ("doublejump")) or (has ("airdash")))
end

function forest_upper_east_to_forest_east_above_spring()
  return forest_light_orb_room_to_forest_upper_east()
  or forest_upper_east_egg_ledge_to_forest_upper_east()
end

function forest_upper_east_to_forest_light_orb_room()
  return (forest_east_above_spring_to_forest_upper_east() or forest_light_orb_room_to_forest_upper_east_egg_ledge())
    and (explosives_enemy()
    and has("slidingPowder"))
    and prologue_trigger()
end

function forest_light_orb_room_to_forest_upper_east()
  return (forest_north_hp_up_room_to_forest_light_orb_room() or forest_upper_east_egg_ledge_to_forest_light_orb_room())
  and darkness()
  and (explosives()
    and ( has ("slidingPowder") or hammer_roll_zip())
  and prologue_trigger()
  or (ADV_VHARD() and explosives_enemy() and slide_zip()))
end

function forest_upper_east_to_forest_upper_east_egg_ledge()
  return (forest_east_above_spring_to_forest_upper_east or forest_light_orb_room_to_forest_upper_east())
  and explosives()
end

function forest_upper_east_egg_ledge_to_forest_upper_east()
  return (forest_east_above_spring_to_forest_upper_east_egg_ledge() or forest_light_orb_room_to_forest_upper_east_egg_ledge())
  and (explosives_enemy() or slide_zip()
    and (ADV_VHARD()
      or (ITM_HARD() and amulet_food()))
    or bunny_strike()
    or whirl_bonk()
  or has ("slippers")
  or has ("airJump"))
  or air_dash()
end

function forest_light_orb_room_to_forest_upper_east_egg_ledge()
  return (forest_upper_east_to_forest_light_orb_room() or forest_north_hp_up_room_to_forest_light_orb_room())
  and (darkness()
    and explosives()
    and prologue_trigger()
    and (has ("slidingPowder") or hammer_roll_zip())
    or (ADV_VHARD() and slide_zip()))
end

function forest_upper_east_egg_ledge_to_forest_light_orb_room()
  return (forest_east_above_spring_to_forest_upper_east_egg_ledge or forest_upper_east_to_forest_upper_east_egg_ledge())
  and  (explosives_enemy()
  and has("slidingPowder")
  and prologue_trigger()
    and (ADV_HARD()
    or (ITM_HARD()
        and amulet_food()
        or has("slippers"))
    or whirl_bonk()
    or bunny_strike()
    or air_dash())
    or has ("airJump"))
end

function forest_east_above_spring_to_forest_upper_east_egg_ledge()
  return (has ("wallJump") and town_main())
    and ( has ("airJump") or whirl_bonk_cancel()
  or ADV_HARD()
    and hammer_roll()
      and has ("airjump")
  or air_dash() and town_main() and has("wallJump"))
end

function forest_upper_east_egg_ledge_to_forest_east_above_spring()
  return forest_upper_east_to_forest_upper_east_egg_ledge()
  or forest_light_orb_room_to_forest_upper_east_egg_ledge()
end

function forest_north_hp_up_room_to_forest_light_orb_room()
  return ( forest_start_to_forest_north_hp_up()
  or forest_night_north_east_to_forest_north_hp_up_room()) 
  and (explosives_enemy()
  and ( has ("slidingPowder") or hammer_roll_zip())
  and prologue_trigger()
  or (ADV_VHARD() and slide_zip()))
end

function forest_light_orb_room_to_forest_north_hp_up_room()
  return (forest_upper_east_egg_ledge_to_forest_light_orb_room()
  or forest_upper_east_to_forest_light_orb_room())
  and darkness() and explosives() and has ("slidingPowder") and prologue_trigger()
end

function forest_north_hp_up_room_to_forest_start()
  return forest_light_orb_room_to_forest_north_hp_up_room()
  or forest_night_north_east_to_forest_north_hp_up_room()
end

function forest_start_to_forest_north_hp_up()
  return forest_start() and
  ( has ("slippers")
  or bunny_strike()
  or air_dash()
  or whirl_bonk()
    or ( has ("slidingPowder") and ADV_STUPID()))
end

function forest_east_above_spring_to_forest_upper_riverbank_exit()
  return ( forest_start_to_forest_east_above_spring()
  or forest_upper_east_to_forest_east_above_spring()
  or forest_lower_riverbank_exit_to_forest_east_above_spring()
  or forest_upper_east_egg_ledge_to_forest_east_above_spring()) 
  and prologue_trigger()
end

function forest_upper_riverbank_exit_to_forest_east_above_spring()
  return riverbank_to_forest_upper_riverbank_exit()
  and prologue_trigger()
end

function forest_start_to_forest_lower_riverbank_exit()
  return forest_cocoa_to_forest_start()
  or cave_entrance_to_forest_start()
  or forest_north_hp_up_room_to_forest_start()
  or forest_night_atk_up_room_to_forest_start()
  or forest_night_toxic_strike_to_forest_start()
  or slide_zip()
end

function forest_east_above_spring_to_forest_lower_riverbank_exit()
  downdrill_semisolid_clip()
end

function forest_lower_riverbank_exit_to_forest_east_above_spring()
  return riverbank_lower_to_forest_lower() 
end

--
-- NIGHT FOREST
--

function forest_start_to_forest_night_atk_up_room()
  return forest_start()
  and ITM() 
  and ( has ("airJump")
  and (has ("slippers") or (HARD() and has ("wallJump"))))
    or whirl_bonk_cancel()
    or (slide_jump_bunstrike_cancel()
      and (has ("airJump")
      or walljump_3
        and (air_dash()
        or ADV_STUPID())))
  or ADV_HARD()
    and hammer_roll() and ( has ("airJump") or walljump_3())
  or ADV_STUPID() and ( has ("slidingPowder") and has ("amulet") and walljump_3()
    or slide_zip() and ( has ("airJump") or ( has("amulet") and walljump_3()))
    or ( whirl_bonk() and has ("airJump")))
end

function forest_night_atk_up_room_to_forest_start()
  return true
end

function forest_start_to_forest_night_toxic_strike()
  return forst_start() and prologue_trigger()
end

function forest_night_toxic_strike_to_forest_start()
  return true
end

function forest_night_west_to_forest_start()
  return true
end

function forest_night_atk_up_room_to_forest_night_west()
  return forest_start_to_forest_night_atk_up_room() 
  and darkness()
  and has ("shooter")
end

function forest_north_hp_up_room_to_forest_night_north_east()
  return ( forest_start_to_forest_north_hp_up()
  or forest_light_orb_room_to_forest_north_hp_up_room()) 
  and darkness() and prologue_trigger() and has ("slidingPowder")
end

function forest_night_north_east_to_forest_north_hp_up_room()
  return ( forest_night_toxic_strike_to_forest_night_north_east()
  or forest_night_west_to_forest_night_north_east()) 
  and prologue_trigger() and ( has ("slidingPowder") or hammer_roll_zip())
end

function forest_night_toxic_strike_to_forest_night_north_east()
  return ( forest_start_to_forest_night_toxic_strike()
  or forest_night_west_to_forest_night_toxic_strike()) 
  and ITM() and darkness() and (
    has ("airJump")
    or (walljump_3() and (
        has ("slippers")
        or (ITM_HARD() and has ("slidingPowder"))
        or (ADV_HARD() and speed1())
        or air_dash()
        or ADV_VHARD())
    )
    or whirl_bonk_cancel()
    or slide_jump_bunstrike_cancel()
    or (ADV_VHARD() and ( has ("slidingPowder") or whirl_bonk()))
    or (ADV_STUPID() and speed5()))
end

function forest_night_north_east_to_night_forest_toxic_strike()
  return forest_north_hp_up_room_to_forest_night_north_east()
  or forest_night_west_to_forest_night_north_east()
end

function forest_night_toxic_strike_to_forest_night_west()
  return ( forest_start_to_forest_night_toxic_strike()
or forest_night_north_east_to_night_forest_toxic_strike()) 
  and darkness() and prologue_trigger()
end

function forest_night_west_to_forest_night_toxic_strike()
  return (forest_night_atk_up_room_to_forest_night_west()) 
  and prologue_trigger()
end

function forest_night_west_to_forest_night_north_east()
  return forest_night_atk_up_room_to_forest_night_west()
  or forest_night_toxic_strike_to_forest_night_west()
end

--
-- FOTGOTTEN CAVE
--

function forest_start_to_cave_entrance()
  return forest_start()
end

function cave_entrance_to_forest_start()
  return true
end

function cave_entrance_to_cave_cocoa()
  return forest_start_to_cave_entrance() or spectral_upper_to_cave_entrance()
  and (defeatKotri1() and defeatCocoa1() and chapter1())
end

function cave_cocoa_to_cave_entrance()
  return true
end

--
-- SPECTRAL CAVE
--

function cave_entrance_to_spectral_upper()
  return forest_start_to_cave_entrance()
end

function spectral_upper_to_cave_entrance()
return has ("slidingPowder")
  or hammer_roll_zip()
  or whirl_bonk()
    or has ("slippers") and ( has ("airJump") or walljump_3())
  or ( has ("airJump") and has ("wallJump"))
end

function spectral_upper_to_spectral_warp()
  return cave_entrance_to_spectral_upper()
end

function spectral_warp_to_spectral_upper()
  return ( has ("airJump") and ( has ("slippers") or has ("airDash")  or ITM_HARD()))
  or ( bunny_strike() and ITM_HARD())
  or air_dash_3()
  or whirl_bonk()
end

function spectral_warp_to_cicini_ledge()
  return (prologue_trigger() or ADV_HARD())
  and ( has ("slippers") or has ("airJump") or air_dash() or slide_jump_bunstrike()
  or (defeatCocoa1() and defeatKotri1 and chapter1())
  or ADV_VHARD())
end

function spectral_cicini_ledge_to_spectral_cicini_room()
  return prologue_trigger() and spectral_warp_to_cicini_ledge()
end

function spectral_cicini_room_to_spectral_cicini_ledge()
  return true
end

function spectral_upper_to_spectral_mid()
  return (spectral_warp_to_spectral_upper() or cave_entrance_to_spectral_upper())
  and (has("sliding_powder") or hammer_roll_zip())
end

function spectral_mid_to_spectral_upper()
  return has("slidingPowder")
end

function spectral_mid_to_spectral_warp()
  return has("slidingPowder") or hammer_roll_zip()
end

function spectral_west_egg_room_to_spectral_mid()
  return prologue_trigger() and
    ((has ("airJump") and
      (air_dash() or (speed5() and ADV_HARD())
        or (bunny_strike() and ITM_HARD())
        or ADV_STUPID()))
          or (air_dash_3() and ADV_VHARD())
          or (bunny_strike() and has ("slippers") and air_dash() and ADV_HARD())
          or (slide_jump_bunstrike_cancel() and has ("slippers") and air_dash_3())
          or (slide_jump_bunstrike() and has ("amulet") and ADV_STUPID()))
end

function spectral_mid_to_spectral_west_egg_room()
  return prologue_trigger() and
  (has ("airJump") or whirl_bonk_cancel()
    or (slide_jump_bunstrike_cancel() and has ("slippers"))
    or (ADV_STUPID() and has ("slidingPowder")))
end

function spectral_mid_to_spectral_west()
  return prologue_trigger()
end

--
-- BEACH AND PYRAMID
--

function beach_main_to_beach_forest_entrance()
  return true
end

function beach_forest_entrance_to_beach_main()
  return true
end

function beach_main_to_beach_underwater_entrance()
  return downdrill_semisolid_clip() or explosives_enemy()
end

function beach_underwater_entrance_to_beach_main()
  return true
end

function beach_main_to_beach_volcano()
  return prologue_trigger()
end

function beach_volcano_to_beach_main()
  return prologue_trigger() and
  (has ("airJump") or slide_jump_bunstrike_cancel() or walljump_3()
    or has ("slippers") and wall_jump())
end

function beach_main_to_pyramid_main()
  return prologue_trigger() or slide_zip()
end

function pyramid_main_to_beach_main()
  return prologue_trigger() or explosives()
end

function pyramid_main_to_pyramid_warp()
  return true
end

function pyramid_warp_to_pyramid_main()
  return true
end

function pyramid_main_to_pyramid_hourglass()
  return ITM_HARD() or has ("airJump") or wall_jump() or has ("slippers")
end

function pyramid_hourglass_to_pyramid_main()
  return true
end

function pyramid_warp_to_pyramid_hourglass()
  return (has ("airjump") and
    (has ("slippers") or slide_jump_bunstrike_cancel() or walljump_3()))
  or (has ("slippers") and walljump_3() and slide_jump_bunstrike_cancel())
end

function pyramid_main_to_pyramid_lower()
  return has ("airjump")
    or (has ("slippers") and slide_jump_bunstrike())
  or ADV_HARD()
end

function pyramid_lower_to_chaos_rod()
  return has ("slidingPowder") and
  (air_dash() and (has ("slippers") or ITM_HARD())
  or ADV_VHARD())
end

function chaos_rod_to_pyramid_lower()
  return has ("slidingPowder") and
  (explosives() or downdrill_semisolid_clip())
end

function chaos_rod_to_pyramid_southwest()
  return defeatPandora() and slide_zip()
end

function pyramid_southwest_to_chaos_rod()
  return (defeatPandora() and has ("slidingPowder"))
  or slide_zip() or hammer_roll_zip()
end

function pyramid_southwest_to_pyramid_main()
  return true
end

function pyramid_main_to_pyramid_southwest()
  return downdrill_semisolid_clip() or explosives()
end

--
-- GRAVEYARD AND SKY ISLAND
--

function graveyard_main_to_graveyard_upper_1st()
  return has ("airJump") or
  (has ("slippers") and (slide_jump_bunstrike() or (ADV_VHARD() and amulet_food())))
  or whirl_bonk()
  or (air_dash() and (ITM_HARD() or has ("slippers")))
  or (has ("slidingPowder") and ADV_VHARD())
  or ADV_STUPID()
end

function graveyard_main_to_graveyard_upper_2nd()
  return has ("airJump") or has ("slippers")
    or (wall_jump() and ITM_HARD())
    or whirl_bonk_cancel()
    or slide_jump_bunstrike_cancel()
    or (ADV_STUPID() and (has ("slidingPowder") or whirl_bonk()))
end

function graveyard_main_to_graveyard_upper()
  return graveyard_main_to_graveyard_upper_1st() and graveyard_main_to_graveyard_upper_2nd()
end

function graveyard_upper_to_graveyard_main()
  return true
end

function graveyard_upper_to_graveyard_bridge_top()
  return true
end

function graveyard_bride_top_to_graveyard_upper()
  return has ("airJump") and has ("slippers") and (speed1() or air_dash())
end

function graveyard_main_to_graveyard_bridge_top()
  return whirl_bonk() or
  (has ("slippers") and has ("airJump") and (air_dash() or ADV_VHARD()))
end

function graveyard_bridge_top_to_graveyard_main()
  return true
end

function graveyard_main_to_graveyard_kotri()
  return true
end

function graveyard_kotri_to_graveyard_main()
  return true
end

function graveyard_kotri_to_sky_island_main()
  return true
end

function sky_island_main_to_graveyard_kotri()
  return true
end

function sky_island_main_to_sky_island_upper()
  return (bunny_strike() and ITM_HARD())
    or (has ("airJump") and ((has ("slippers") and speed1())
      or air_dash() or wall_jump() or ITM_HARD()))
    or (air_dash_3() and (wall_jump() or ADV_HARD()))
end

function sky_island_upper_to_sky_island_main()
  return true
end

function sky_island_main_to_beach_main()
  return explosives()
end

--
-- HALLOWEEN
--

function graveyard_upper_to_halloween_upper()
  return include_halloween() and explosives_enemy() and
  (whirl_bonk()
  or (has ("slidingPowder") and ADV_STUPID())
  or has ("airJump") and (ITM_HARD() or has ("slippers") or slide_jump_bunstrike_cancel() or bunny_whirl() or air_dash()))
end

function sky_island_upper_to_halloween_upper()
  return include_halloween() and has ("slippers") and has ("airjump") and walljump_3() and bunny_strike() and has ("amulet") and air_dash() and ADV_STUPID()
end

function halloween_upper_to_graveyard_upper()
  return true
end

function graveyard_main_to_halloweeen_dark_1st()
  return bunny_whirl() or (has ("carrotShooter") and beach_forest_entrance_to_beach_main()) 
end

function graveyard_main_to_halloween_dark_2nd()
  return bunny_whirl() or (has ("slidingPowder") and ADV_HARD())
    or (air_dash() and (has ("slippers") or slide_jump_bunstrike_cancel()))
    or (has ("slippers") and slide_jump_bunstrike())
    or (ADV_STUPID())
  and explosives()
end

function graveyard_main_to_halloween_dark()
  return graveyard_main_to_halloweeen_dark_1st() and graveyard_main_to_halloween_dark_2nd()
end

function halloween_darK_to_graveyard_main()
  return darkness() and explosives() and
  (has ("airJump") or walljump_3()
    or (bunny_whirl() and (has ("slippers") or slide_jump_bunstrike_cancel()))
  and (bunny_whirl() or (has ("slidingPowder") and ADV_HARD()))
  or (air_dash() and (has ("slipeprs") or slide_jump_bunstrike_cancel()))
  or (has ("slippers") and slide_jump_bunstrike())
  or ADV_STUPID())
end

function halloween_dark_to_halloween_main()
  return darkness() and
  ((has ("airJump") and walljump_3())
  or (has ("airJump") and bunny_whirl() and has ("slippers"))
  or (has ("airJump") and bunny_whirl() and slide_jump_bunstrike_cancel())
  or (has ("airJump") and has ("slippers") and slide_jump_bunstrike_cancel())
  or (whirl_bonk_cancel() and (walljump_3() or ADV_VHARD())))
end

function halloween_center_to_halloween_dark()
  return darkness()
end

function graveyard_main_to_halloween_center()
  return include_halloween() and slide_zip()
end

function halloween_center_to_halloween_flood()
  return has ("slidingPowder") and bunny_whirl() and (has ("bombs") or (has ("carrotShooter") and beach_forest_entrance_to_beach_main()))
end

function halloween_flood_to_halloween_center()
  return (has ("carrotShooter") and beach_forest_entrance_to_beach_main())
  and slide_zip() and hammer_roll_zip() and ADV_STUPID() and amulet_food()
end

function halloween_flood_to_pumpkin_hall()
  return (explosives() and has ("slidingPowder") and bunny_whirl())
  or (explosives() and slide_zip() and ADV_STUPID())
end

function halloween_flood_to_beach_main()
  return has ("waterOrb") and hammer_roll_zip()
end

function halloween_center_to_pumpkin_hall()
  return (has ("slidingPowder") and downdrill_semisolid_clip() and explosives())
  or (hammer_roll_zip() and explosives())
  or (slide_zip() and (has ("bombs") or (has ("carrotShooter") and beach_forest_entrance_to_beach_main) and ADV_STUPID()))
end

function pumpkin_hall_to_halloween_exit()
  return (has ("bombs") or (has ("carrotShooter") and beach_forest_entrance_to_beach_main() and ADV()))
  and (whirl_bonk() or slide_jump_bunstrike()
    or (has ("airJump") and (ADV_HARD() or has ("slippers"))
    or (has ("slippers") and air_dash_3())))
    and (slide_zip() or bunny_whirl())
end

function halloween_exit_to_kotri()
  return true
end

function graveyard_kotri_to_halloween_exit()
  return include_halloween() and downdrill_semisolid_clip()
end

function halloween_exit_to_halloween_pliiars()
  return prologue_trigger()
    and has("airJump")
    or (air_dash())
    or has ("slippers")
    or slide_jump_bunstrike()
    or bunny_whirl()
    or (ADV_VHARD() and amulet_food())
    or wall_jump()
end

function halloween_pillars_to_halloween_exit()
  return true
end

--
-- RAVINE
--

function ravine_beach_entrance_to_ravine_lower()
  return
end