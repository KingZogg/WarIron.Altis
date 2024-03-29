//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_coolDownTime = 120; //Expressed in sec

APOC_AA_VehOptions =
[ // ["Menu Text",		ItemClassname,				Price,	"Drop Type"]
["Quadbike (Civilian)", "C_Quadbike_01_F", 10000, 	"vehicle"],
["Boat (Police)", "C_Boat_Civil_01_police_F", 10000, 	"vehicle"],
["Hunter", "B_MRAP_01_F", 30000, 	"vehicle"],
["MH9 Hummingbird", "B_Heli_Light_01_F", 	40000, 	"vehicle"]
];

APOC_AA_SupOptions =
[// ["stringItemName", 	"Crate Type for fn_refillBox 	,Price," drop type"]
//["Launchers", 			"mission_USLaunchers", 			35000, "supply"],
//["Assault Rifle", 		"mission_USSpecial", 			35000, "supply"],
//["Sniper Rifles", 		"airdrop_Snipers", 				50000, "supply"],
//["DLC Rifles", 			"airdrop_DLC_Rifles", 			45000, "supply"],
//["DLC LMGs", 			"airdrop_DLC_LMGs", 			45000, "supply"],

//"Menu Text",			"Crate Type", 			"Cost", "drop type"
["Food",	"Land_Sacks_goods_F",	10000, 	"picnic"],
["Water", "Land_BarrelWater_F",	 10000, 	"picnic"]
];