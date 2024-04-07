function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
  end

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------MACROS------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

function darkness()
  return has ("trickDarkRooms") 
  or has ("lightOrb")
end

function underwater()
  return has ("trickWaterRooms") 
  or has ("waterOrb")
end

function include_post_game()
  return has ("opPostGame")
end

function include_post_irisu()
  return has ("opPostIrisu")
end

function include_halloween()
  return has ("opHalloweenDLC")
end

function include_plurkwood()
  return has ("opPlurkwood")
end

function warp_destination()
  return has ("warpDestinationReachable")
end

function bunny_strike()
  return has ("slidingPowder")
  and has ("bunnyStrike")
  and has ("hammer")
end

function bunny_whirl()
  return has ("bunnyWhirl")
  and has ("hammer")
end

function air_dash()
  return has ("airDash")
  and has ("hammer")  
end

-- function air_dash_3()
--   return air_dash()
--   and ("rabitownfunction")
-- end

function hammer_roll()
  return has ("hammerRoll")
  and bunny_whirl()
end

-- function hammer_roll_3()
--   return hammer_roll()
--   and ("rabitownfunction")
-- end

function ITM()
  return has ("opIntermediate")
end

function ITM_HARD()
  return ITM()
  and has ("opHard")  
end

function ITM_VHARD()
  return ITM()
  and has ("opVHard")
end

function ADV()
  return has ("opAdvanced")
end

function ADV_HARD()
  return ADV()
  and has ("opHard")
end

function ADV_VHARD()
  return ADV()
  and has ("opVHard")
end

function ADV_STUPID()
  return ADV()
  and has ("opStupid")
end

function hammer_roll_zip()
  return has ("trickHRZ")
  and has ("trickZip")
  and hammer_roll_3()
end

function slide_zip()
  return has ("trickZip")
  and has ("slidingPowder")
end

function whirl_bonk()
  return has ("trickWhirlBonk")
  and bunny_whirl()
  and ITM_HARD()
end

function whirl_bonk_cancel()
  return has ("trickWBC")
  and whirl_bonk()
  and ITM_HARD()
  and has ("amulet")
end

function slide_jump_bunstrike()
  return INT()
  and bunny_strike()
  and has ("trickSJBS")
end

function slide_jump_bunstrike_cancel()
  return slide_jump_bunstrike()
  and ITM_HARD()
  and has ("amulet")
end

function downdrill_semisolid_clip()
  return has ("trickSSC")
  and has ("hammer")
end

function eight_tile_walljump()
  return (ITM()
    and (HARD()
    or has("wallJump")))
  or has ("slippers")
  or has ("airJump")
end

function explosives()
  return has ("bombs")
  or (has ("shooter") and has ("boost"))
end

function explosives_enemy()
  return has ("bombs")
  or has ("shooter")
end

function speed1()
  return has ("speedBoost")
  or has ("speedy")
end

-- function speed2()
--   return (has ("speedBoost") and ("rabitownfunction"))
--   or speedy()
-- end

-- function speed3()
--   return (has ("speedBoost") and ("rabitownfunction"))
--   or (has ("speedBoost") and has speedy())
-- end

-- function speed5()
--   return has ("speedBoost")
--   and speedy()
--   and ("rabitownfunction")
-- end

function prologue_trigger()
  return has ("modeOpen")
  or chapter1()
end

function speedy()
  return has ("cicini")
  and town_main()
  and has("townmember:3")
end

function amulet_food()
  return town_main()
end

function walljump_3()
  return has ("wallJump") and town_main()  
end

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------BOSS LOGIC--------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

function defeatCocoa1()
  if has ("cocoa1")
  then
    return 1
  else
    return 0
  end
end

function defeatKotri1()
  if (has ("kotri1") and has ("cocoa1"))
  then
    return 1
  else
    return 0
  end
end

function defeatAshuri1()
  if (has ("ashuri1") and has ("defeatCocoa1") and has ("defeatKotri1"))
  then
    return 1
  else
    return 0
  end
end

function defeatAlius1()
  if has ("alius1")
  then
    return 1
  else
    return 0
  end
end

function defeatPandora()
  if has ("pandora")
  then
    return 1
  else
    return 0
  end
end

function defeatAshuri2()
  if (has ("$ashuri2") and has ("$defeatAshuri1") and has ("$chapter3"))
  then
    return 1
  else
    return 0
  end
end

function defeatRita()
  if has ("rita")
  then
    return 1
  else 
    return 0
  end
end

function defeatNieve()
  if has ("nieve")
  then
    return 1
  else
    return 0
  end
end

function defeatNixie()
  if (has ("nixie") and has ("$defeatNieve")) 
    then
    return 1
  else
    return 0
  end
end

function defeatSeana()
  if has ("seana")
  then
    return 1
  else
    return 0
  end
end

function defeatSeana2()
  if has ("$defeatSeana")
  then
    return 1
  else
    return 0
  end
end


function defeatChocolate()
  if has ("chocolate")
  then
    return 1
  else
    return 0
  end
end

function defeatVanilla()
  if (has ("$defeatChocolate") and has ("vanilla"))
  then
    return 1
  else
    return 0
  end
end

function defeatAruraune()
  if has ("aruraune")
  then
    return 1
  else
    return 0
  end
end

function defeatLilith()
  if has ("lilith")
  then
    return 1
  else 
    return 0
  end
end

function defeatKotri1()
  if has ("kotri1")
  then
    return 1
  else
    return 0
  end
end

function defeatKotri2()
  if ( has ("$defeatKorti1") and has ("$kotri1"))
  then
    return 1
  else
    return 0
  end
end

function defeatKotri3()
  if (has ("defeatKotri2") and has ("kotri2"))
  then
    return 1
  else
    return 0
  end
end

function defeatAlius2()
  if (has ("alius2") and has ("$defeatAlius1"))
  then
    return 1
  else
    return 0
  end
end

function defeatCicini()
  if has ("cicini")
  then
    return 1
  else
    return 0
  end
end

function defeatSyaro()
  if (has ("syaro") and has ("$defeatCicini") and has ("$ciciniTM"))
  then
    return 1
  else
    return 0
  end
end

function defeatSaya()
  if has ("saya")
  then
    return 1
  else
    return 0
  end
end

function defeatRainbowCrystal()
  if (has ("$defeatAshuri1") and has ("$defeatAShuri2") and has ("rainbowcrystal") and has ("$chapter3"))
  then
    return 1
  else
    return 0
  end
end

function defeatKeke()
  if has ("keke")
  then
    return 1
  else
    return 0
  end
end

function defeatRumi()
  if (has ("rumi") and has ("$forgottencave2"))
  then
    return 1
  else
    return 0
  end
end

function defeatMiriam()
  if (has ("$chapter 6") and has ("miriam"))
  then
    return 1
  else
    return 0
  end
end

function defeatNoah()
  if (has ("$chapter5") and has ("noah"))
  then
    return 1
  else
    return 0
  end
end


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------EVENT LOGIC-------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

function chapter1()
  return has ("chapter:1")
  and town_main()
end

function chapter2()
  return (chapter1()
  and has ("townmembers, 2")
  and has ("chapter:2"))
end

function chapter3()
  return (chapter2()
  and has ("townmembers, 4")
  and has ("chapter:3"))
end

function chapter4()
  return (chapter3()
  and has ("townmembers, 7")
  and has ("chapter:4"))
end

function chapter5()
  return (chapter4()
  and has ("townmemebers, 10")
  and has ("chapter:5"))
end

function chapter6()
  return (chapter5()
  and has ("townmemebers, 10")
  and has ("opPostGame")
  and has ("$defeatNoah")
  and has ("chapter, 6"))
end

function chapter7()
  retrun (chapter6()
  and has ("$defeatRumi")
  and has ("chapter, 7"))
 end

 function chapter8()
  return (chapter7()
  and has ("$sysInt2")
  and has ("chapter, 7"))
end

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------CONSTRAINTS-------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


function labAccess()
  if ("$chapter3")
  then
    return 1
  else return 0
  end
end

function sysInt2()
  if (has ("$chapter7") and has ("defeatRumi"))
  then
    return 1
  else
    return 0
  end
end

function forgottenCave2()
  if (has ("$defeatMiriam") and has ("chapter6") and has ("miriam"))
  then
    return 1
  else
    return 0
  end
end

function hallMemeories()
  if (has ("$post_game_allowed") and has ("chapter6"))
  then
    return 1
  else
    return 0
  end
end


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------TOWN MEMEBERS-------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

function cocoaTM()
  if (has ("defeatcocoa1") and has ("defeatCocoa2") and has ("defeatKotri1"))
  then
    return 1
  else
    return 0
  end
end


function ashuriTM()
  if (has ("$defeatAshuri1") and has ("$defeatAshuri2") and has ("$defeatRainbowCrystal"))
  then
    return 1
  else
    return 0
  end
end

function ritaTM()
  if has ("$defeatRita")
  then
    return 1
  else
    return 0
  end
end

function sayaTM()
  if has ("$defeatSaya")
  then
    return 1
  else
    return 0
  end
end

function syaroTM()
  if has ("$defeatSyaro")
  then
    return 1
  else
    return 0
  end
end

function pandoraTM()
  if has ("$defeatPandora")
  then
    return 1
  else
    return 0
  end
end

function nieveTM()
  if has ("$defeatNieve")
  then
    return 1
  else
    return 0
  end
end

function nixieTM()
  if has ("$defeatNixie")
  then
    return 1
  else
    return 0
  end
end

function arurauneTM()
  if has ("$defeatAruraune")
  then
    return 1
  else
    return 0
  end
end

function seanaTM()
  if (has ("$defeatSeana2") and has ("$chocolateTM") and has ("$vanillaTM") and has ("$ciciniTM") and has ("$syaroTM") and has ("$nieveTM") and has ("$nixieTM"))
  then
    return 1
  else
    return 0
  end
end

function lilithTM()
  if has ("$defeatLilith")
  then
    return 1
  else
    return 0
  end
end

function chocolateTM()
  if has ("$defeatChocolate")
  then
    return 1
  else
    return 0
  end
end

function vanillaTM()
  if has ("$defeatVanilla")
  then
    return 1
  else
    return 0
  end
end

function kekeTM()
  if has ("$defeatKeke")
  then
    return 1
  else
    return 0
  end
end






