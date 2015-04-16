// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["wariron", "WarIron HELP"];
player createDiarySubject ["infos", "Info and Help"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];

player createDiaryRecord ["changelog",
[
"v1.1a",
"
<br/>WarIron.Com Additions
<br/>[Added] Extra Gun store
<br/>[Added] Gold Mission and Gold Buyer
"
]];

player createDiaryRecord ["changelog",
[
"v1.1b",
"
<br/>[Added] Marksmen DLC content
<br/>[Added] Prevent usage of commander camera
<br/>[Added] Emergency eject hotkey (Ctrl + " + actionKeysNames "GetOut" + ")
<br/>[Added] Restricted UAV connection to owner's group
<br/>[Changed] Improved purchased vehicle setup time
<br/>[Changed] Admins can now use global voice chat
<br/>[Changed] Updated antihack
<br/>[Fixed] Corpses not being ejected from vehicles
<br/>[Fixed] Thermal imaging not working for UAVs
<br/>[Fixed] Various minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.1",
"
<br/>[Added] ATMs
<br/>[Added] Union Jack vehicle color
<br/>[Added] Skins hidden in gamefiles for MH-9, Mohawk, and Taru
<br/>[Added] Improved admin spectate camera by micovery
<br/>[Added] Earplugs (End key)
<br/>[Changed] Full rewrite of vehicle respawning system
<br/>[Fixed] Player moved to position too early during save restore
<br/>[Fixed] Mission timeout not extending on AI kill
<br/>[Fixed] Admin teamkill unlocking
<br/>[Fixed] Improved FPS fix
<br/>[Fixed] Running animation parachute glitch
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.0c",
"
<br/>[Added] MySQL support via extDB extension
<br/>[Added] Town Invasion mission
<br/>[Added] Chain-reaction player kill tracking
<br/>[Added] Force Save action for purchased and captured vehicles
<br/>[Added] Autokick players previously detected by antihack
<br/>[Added] Entity caching script for headless client
<br/>[Added] Tron suits to general store
<br/>[Added] Red lines on map for AIs wandering away from missions
<br/>[Changed] Mission timeout gets extended on AI kill
<br/>[Changed] Transport Heli mission Taru variant to Bench
<br/>[Changed] Spawn beacon item drop to sleeping bag
<br/>[Fixed] More money exploits
<br/>[Fixed] Scoreboard ordering
<br/>[Fixed] Vehicle repair & refuel sometimes not working
<br/>[Fixed] Injured players' corpses being deleted on disconnect
<br/>[Fixed] Static weapon disassembly prevention
<br/>[Fixed] Excess bought rockets ending up in uniform or vest
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"v1.0b",
"
<br/>[Added] Helicopters DLC content
<br/>[Added] Revamped respawn menu
<br/>[Added] 250m altitude limit for territory capture
<br/>[Added] HALO insertion on spawn beacons
<br/>[Added] New vehicle store textures
<br/>[Changed] Increased damage done to planes by 50%
<br/>[Changed] Plane engines shutdown when above 90% damage
<br/>[Changed] Player names can also be toggled with Home key
<br/>[Changed] Increased ATGM UAV price
<br/>[Changed] Increased prices from thermal scopes again
<br/>[Changed] Minor edits to spawn loadouts
<br/>[Fixed] FPS drop that began in v0.9h
<br/>[Fixed] Saved UAVs not being connectable
<br/>[Fixed] Indies unable to get in UGVs
<br/>[Fixed] Blinking fog
<br/>[Fixed] Clipped numbers on scoreboard
<br/>[Fixed] Minor other optimizations and fixes
"
]];

player createDiaryRecord ["changelog",
[
"v1.0",
"
<br/>[Added] Custom scoreboard
<br/>[Added] Mission and store vehicle saving
<br/>[Added] Player markers on GPS and UAV Terminal
<br/>[Added] Holster actions
<br/>[Changed] Full rewrite of side mission system
<br/>[Changed] Windows key toggles player marker names too
<br/>[Changed] New loading picture by Gameaholic.se
<br/>[Fixed] Weapon sometimes disppearing when moving objects
<br/>[Fixed] More money duping exploits
<br/>[Fixed] Store menu sizes on smaller aspect ratios
<br/>[Fixed] Hunger and thirst reset on rejoin
<br/>[Fixed] Other minor optimizations and fixes
"
]];

player createDiaryRecord ["changelog",
[
"0.9h",
"
<br/>[Added] Custom revive system based on Farooq's Revive
<br/>[Added] Territory payroll at regular intervals
<br/>[Added] Emergency eject and free parachutes (jump key)
<br/>[Added] Player names toggled with Windows key
<br/>[Added] Increased missile damage against tanks and helis
<br/>[Added] Ability to stash money in weapon crates
<br/>[Added] Ability to sell vehicle inventory at stores
<br/>[Added] More money shipment mission variants
<br/>[Added] Reduced wheel damage from collisions
<br/>[Added] Wreck salvaging
<br/>[Added] Selling bin in stores
<br/>[Added] Karts DLC content in stores
<br/>[Added] Camo sniper rifles in gunstore
<br/>[Added] Repair Offroad in vehicle store
<br/>[Added] Team players on map as server option
<br/>[Added] Unlimited stamina server option
<br/>[Added] Static weapon saving server option
<br/>[Added] More push vehicle actions
<br/>[Added] Paradrop option for airlifted vehicles
<br/>[Added] Preload checkbox on respawn menu
<br/>[Added] Remote explosives store distance restriction
<br/>[Added] Server time multipliers for day and night
<br/>[Added] Addon-less profileNamespace server persistence
<br/>[Added] Linux server compatibility
<br/>[Added] Basic support for headless client
<br/>[Changed] Independent territory capture is now group-based
<br/>[Changed] Towns blocked if more enemies than friendlies
<br/>[Changed] Increased ammo/fuel/repair cargo for resupply trucks
<br/>[Changed] Increased territory capture rewards for Altis
<br/>[Changed] Increased money mission rewards
<br/>[Changed] Weapon loot in buildings now disabled by default
<br/>[Changed] Mission crates loot was made more random
<br/>[Changed] Thermal imaging is now available on UAVs
<br/>[Changed] Increased vehicle store prices
<br/>[Changed] Increased prices for thermal optics
<br/>[Changed] Increased player icons up to 2000m
<br/>[Changed] Improved antihack
<br/>[Changed] Improved FPS
<br/>[Fixed] Vehicle store purchase errors due to server lag
<br/>[Fixed] Corpse created when leaving with player saving
<br/>[Fixed] Custom vehicle damage handling not working
<br/>[Fixed] Indie-indie spawn beacon stealing
<br/>[Fixed] Repair kit and jerrycan distance limit
<br/>[Fixed] Spawn beacon packing and stealing restrictions
<br/>[Fixed] Not able to lock static weapons
<br/>[Fixed] Unbreakable store windows
<br/>[Fixed] Stratis airbase gunstore desk glitches
<br/>[Fixed] Missions sometimes completing instantaneously
<br/>[Fixed] Object ammo/fuel/repair cargo not saving
<br/>[Fixed] Respawn menu aspect ratio on some resolutions
<br/>[Fixed] Minor bugs with group system
<br/>[Fixed] Minor bugs with player items
<br/>[Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"0.9g",
"
<br/>[Added] - Vehicle stores
<br/>[Added] - New lootspawner by Na_Palm, stuff in ALL buildings
<br/>[Added] - New jets and truck added in A3 v1.14
<br/>[Added] - New AAF vehicles added in A3 v1.08
<br/>[Added] - New camos for Mk20 and MX in gunstores
<br/>[Added] - Ability to push plane backwards
<br/>[Added] - Ability to sell quadbike contents like crates
<br/>[Added] - Abort delay during combat when player saving on
<br/>[Changed] - Improved respawn menu
<br/>[Changed] - Respawn now longer to preload destination
<br/>[Changed] - Optimized player icons
<br/>[Changed] - Optimized FPS fix
<br/>[Changed] - Improved server persistence (requires iniDBI v1.4+)
<br/>[Changed] - Improved player saving (server-specific)
<br/>[Changed] - Improved base saving (server-specific)
<br/>[Changed] - Reduced starting gear
<br/>[Changed] - Modified some store prices
<br/>[Changed] - Reduced initial fuel in cars and helis
<br/>[Changed] - Removed Buzzard jet from too short runways
<br/>[Changed] - Removed Kavala castle territory for use as base
<br/>[Changed] - Increased vehicle repair time to 20 sec.
<br/>[Changed] - Increased owner unlocking time to 10 sec.
<br/>[Changed] - Toggling spawn beacon perms is now instant
<br/>[Changed] - Improved Take option for player items
<br/>[Changed] - Added option to cancel towing selection
<br/>[Changed] - Added machine gunner to main mission NPCs
<br/>[Changed] - Added grenadier to side mission NPCs
<br/>[Fixed] - Error messages in various menus
<br/>[Fixed] - Crash when toggling spawn beacon perms
<br/>[Fixed] - Error when hacking warchests
<br/>[Fixed] - Vehicle towing and lifting positions
<br/>[Fixed] - Repair Vehicle option showing for brand new vehicles
<br/>[Fixed] - Vest purchase price
<br/>[Fixed] - Vest and helmet armor value
<br/>[Fixed] - NPC leader now has launcher ammo
"
]];

player createDiaryRecord ["changelog",
[
"0.9f",
"
<br/>[Added] - Money missions
<br/>[Added] - Sell Crate Items option at stores when moving crate
<br/>[Changed] - Reorganized loots for crates and trucks
<br/>[Fixed] - Broken Warchest menu
<br/>[Fixed] - Spawn beacons not working for Independent groups
<br/>[Fixed] - Player icons position inside buildings
<br/>[Fixed] - MRAPs and quadbikes not spawning
<br/>[Fixed] - Broken money rewards for territories
"
]];

player createDiaryRecord ["changelog",
[
"0.9e",
"
<br/>[Added] - Territory system
<br/>[Added] - Jumping option (step over while running)
<br/>[Added] - New weapons from v1.04 update
<br/>[Changed] - Water and food now use water bottles and baked beans
<br/>[Fixed] - Store object purchases not operating as intended
<br/>[Fixed] - Objects purchased from stores not saving properly
<br/>[Fixed] - Minor server-side memory leak
"
]];

player createDiaryRecord ["changelog",
[
"0.9d",
"
<br/>[Added] - Store object purchases
<br/>[Changed] - New UI by KoS
"
]];

player createDiaryRecord ["changelog",
[
"0.9c",
"
<br/>[Changed] - Instant money pickup and drop
<br/>[Changed] - Increased plane and heli spawning odds
<br/>[Fixed] - FPS fix improvements
<br/>[Fixed] - Vehicles disappearing when untowed or airdropped
"
]];

player createDiaryRecord ["changelog",
[
"0.9b",
"
<br/>[Initial release] - Welcome to Altis!
"
]];


player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16' color='#BBBBBB'>Developed by A3Wasteland.com:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Krunch (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* micovery (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>	* Zenophon (BIS Forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["infos",
[
"About Wasteland",
"
<br/>Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to http://forums.a3wasteland.com/
<br/>
<br/>FAQ:
<br/>
<br/>Q. What am I supposed to do here?
<br/>A. See the above description
<br/>
<br/>Q. Where can I get a gun?
<br/>A. Weapons are found in one of two places, first in ammo crates that come as rewards from missions, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players and AI whose bodies have not yet been looted.
<br/>
<br/>Q. What are the blue circles on the map?
<br/>A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/>
<br/>Q. Is it ok for me to shoot my team mates?
<br/>A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steal items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/>
<br/>Q. Whats with the canisters, baskets and big bags?
<br/>A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from food sacks and wells, or baskets and plastic canisters dropped by dead players. Food and water will also randomly spawn around the map.
<br/>
<br/>Only vehicles have guns and other loot. Buildings have none.
<br/>
"
]];

player createDiaryRecord ["wariron",
[
"WarIron Mission Timeouts ",
"
<br/>Mission Timeouts.
<br/>
<br/>Main Missions timeout after 1.5 Hours.
<br/>
<br/>Side Misisons timeout after 1.5 Hours
<br/>
<br/>Money Missions timeout after 45 Mins
<br/>
<br/>Gold Missons timeout after 2 Hours
<br/>
<br/>Missions are set to HARD
"
]];

player createDiaryRecord ["wariron",
[
"ATM's",
"
<br/>The Maximum Money you can have in your account is
<br/>$5 Million
<br/>
<br/>Money can be transferred between any players.
<br/>
<br/>Transfer Fee Tax is %5.
<br/>
<br/>All ATM's have a flag on the building as have the General Stores
<br/>
"
]];

player createDiaryRecord ["wariron",
[
"Territory Settings",
"
<br/>Territories pay $8000/$7000 for each territory captured.
<br/>
<br/>You and/or your team/group will be paid $5000 for every territory held every 1/2 Hour.
<br/>
<br/>You have to be within 8km's of the territory to get paid.
<br/>
"
]];

player createDiaryRecord ["wariron",
[
"Equipment Saving and Timeouts ",
"
<br/>Unused parked vehicles will be deleted from the server after
<br/>5 days.
<br/>
<br/>Player saved vehicles will be deleted every
<br/>14 days. Based on when the player saved it.
<br/>
<br/>Base Parts, Static Weapons and Crates will be deleted every
<br/>14 days unless relocked, which will extend the timer for another 14 days.
<br/>
<br/>Player loadouts and carried money are never deleted.
<br/>Unless they die of course :)
<br/>
<br/>Spawn beacons are saved after a restart.
"
]];

player createDiaryRecord ["wariron",
[
"Heli Lifting",
"
<br/>Heli's can only lift using sling loading. 
<br/>
<br/>This is much more realistic and harder !
<br/>
<br/>The R3F system is disabled for Heli lifting.
<br/>
"
]];

player createDiaryRecord ["wariron",
[
"Missions and Timeouts",
"
<br/>There are gold missions.
<br/>Gold sub which you will need diving gear for.
<br/>The sub could be carrying upto $1 Million in gold (Random).
<br/>
<br/>Snipers Nest side mission which does not have as much gold. It is also a random amount.
<br/>
<br/>Money Missions carry money and a random amount of gold.
<br/>
<br/>Timeouts. 
<br/>The Gold Sub Mission time out is 2 hours. 
<br/>Main Missions are 2 hours. 
<br/>Money Missions are 1.5 hours
<br/>Side Missions are 1 hour.
<br/>All other Missions vary.
<br/>
"
]];


player createDiaryRecord ["wariron",
[
"WarIron Gold Mission",
"
<br/>The Gold Sub Mission is a sub that has been damaged and is in a minefield. 
<br/>The Sub Mission times out after 2 Hours. Gold and the sub will stay if the divers are killed.
<br/>It can be repaired and refuelled. 
<br/>
<br/>The Sub and the divers guarding it, could be anywhere in the red mine field area marked on the map. 
<br/>The divers are usually at the surface. They dive if attacked.
<br/>
<br/>The sub and the divers are NOT at the same place ... (usually).
<br/>
<br/>Once all the divers are killed, the gold is in tin boxes that are found under and around the sub. (The boxes can be very hard to see.)
<br/>Use your mouse wheel to pick one up when you are over one.
<br/>
<br/>A player can only carry 10 tins of gold at any one time.
<br/>
<br/>You can load some of the gold tins into the sub and move it, if you have refuelled and repaired it.
<br/>
<br/>You can't load the gold into land vehicles.
<br/>
<br/>Gold can only be sold to a Gold buyer at the gold buyer shop.
<br/>
<br/>Summary.
<br/>Step 1. Find the divers at the surface. (usually)
<br/>Step 2. Find the sub at the bottom and take the gold that spawns under it once the divers are dead.
<br/>Step 3. (Optional) Fix and refuel the sub. It can hold 10 Boxes of gold.
<br/>
"
]];

player createDiaryRecord ["wariron",
[
"General Info and Additions ",
"
<br/>The server is has only this mission running on it for full optimisation.
<br/>
<br/>Teamspeak is ts3.wariron.com. If you need an admin wait in the waiting for admin channel. 
<br/>Feel free to poke admins.
<br/>
<br/>The game play is designed to be brutal and very hard.
<br/>Hard work does have it's rewards.
<br/>
<br/>The database is external.
<br/>The headless client is running.
<br/>
<br/>Lot's of missions running at the same time are not much fun so there is only one type of mission running at a time.
<br/>
<br/>Everyone starts off equally. There are no sniper medic or engineer slots.
<br/>If you want to play as a diver etc please go and buy the gear.
<br/>
<br/>Thermal Vehicle weapons are enabled.
<br/>
<br/>The beacon detector needs a mine detector to work and the range is limited.
<br/>
<br/>TeamKill Autokick is in place. 
<br/>The Tk's are not reset after a restart so anyone who keeps doing it will be autobanned.
<br/>
<br/>Repack your magazines with CTRL-R (can be changed when you open it). 
<br/>
<br/>Use the earplugs to hear when you are in a vehicle and on teamspeak. Use the END key (Can't be changed). 
<br/>
<br/>View distance settings can be finely adjusted depending on which mode you are in. 
<br/>ie: Walking, Driving or Flying.
<br/>
<br/>We hate fog and it will never be in the game. Rain is also off (it might come back).
<br/>
<br/>A player can only carry 10 tins of gold at any one time.
<br/>You can load the gold tins into the sub and move it, if you have refuelled and repaired it.
<br/>You can't load the gold into any other vehicle.
<br/>
<br/>Vehicles are locked and untowable or liftable after a restart. Only the owner can unlock them.
<br/>
<br/>You can break into vehicles using a Toolkit. It has a random chance of failing.
<br/>
<br/>Vehicle actions are pretty self explanatory see in game for what you can do.
<br/>Lock, UnLock, Unflip, or Pull a driver from a vehicle.
<br/>
<br/>Baseparts take a LONG time to unlock if you are not the owner.
<br/>
<br/>This is a new server so any suggestions on improvements are welcome.
<br/>
<br/>New secret spiced up missions are always in development.

"
]];