local variant = Tracker.ActiveVariantUID

--LOADED SCRIPTS
ScriptHost:LoadScript("scripts/logic.lua")

--LOAD ITEMS
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/bosses.json")
Tracker:AddItems("items/badges.json")

--LOAD MAPS
Tracker:AddMaps("maps/maps.json")

--LOAD LAYOUTS
Tracker:AddLayouts("layouts/map_layout.json")

if Tracker.ActiveVariantUID == "map_tracker" then
    Tracker:AddLayouts("layouts/tracker_standard.json")
    Tracker:AddLayouts("layouts/item_layout.json")
    Tracker:AddLayouts("layouts/boss_layout.json")
    Tracker:AddLayouts("layouts/badge_layout.json")
    Tracker:AddLayouts("layouts/broadcast_standard.json")
elseif Tracker.ActiveVariantUID == "minimal_tracker" then
    Tracker:AddLayouts("layouts/tracker_minimal.json")
    Tracker:AddLayouts("layouts/minimal_item_layout.json")
    Tracker:AddLayouts("layouts/boss_layout.json")
    Tracker:AddLayouts("layouts/broadcast_standard.json")
end

-- LOAD LOCATIONS
Tracker:AddLocations("locations/woods.json")
Tracker:AddLocations("locations/coast.json")
Tracker:AddLocations("locations/highlands.json")
Tracker:AddLocations("locations/island_centre.json")
Tracker:AddLocations("locations/tundra.json")
Tracker:AddLocations("locations/eggs.json")
Tracker:AddLocations("locations/side.json")

-- LOAD POST GAME CONTENT
Tracker:AddLocations("locations/eggspost.json")
Tracker:AddLocations("locations/itemspost.json")
