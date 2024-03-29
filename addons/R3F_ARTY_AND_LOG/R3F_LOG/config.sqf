/****** TOW WITH VEHICLE  ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 */
R3F_LOG_CFG_remorqueurs =
[
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F"
	//"Wheeled_APC_F",
	//"Tank_F",
	//"Boat_Armed_01_base_F"
];

/**
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables =
[
	"Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"UGV_01_base_F"
//	"SDV_01_base_F"
//	"Boat_Civil_01_base_F",
//	"Boat_Armed_01_base_F",
//	"Helicopter_Base_F",
//	"Plane"
];

/****** LIFT WITH VEHICLE  ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 */
R3F_LOG_CFG_heliporteurs =
[
/* none .. using sling loading.
	"I_Heli_Transport_02_F",
	"B_Heli_Transport_03_F",
	"O_Heli_Transport_04_F",
	"B_Heli_Transport_03_unarmed_F",
	"O_Heli_Transport_04_bench_F",
	"O_Heli_Transport_04_box_F",
	"O_Heli_Transport_04_covered_F"
*/
];

/**
 * List of class names of liftables objects.
 */
R3F_LOG_CFG_objets_heliportables =
[
	"Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Van_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_01_base_F",
	"UGV_01_base_F",
	"SDV_01_base_F",
	"Boat_Civil_01_base_F",
	"Boat_Armed_01_base_F"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/


/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs =
[
	["Quadbike_01_base_F", 5],
	["UGV_01_base_F", 10],
	["Hatchback_01_base_F", 10],
	["SUV_01_base_F", 20],
	["Offroad_01_base_F", 30],
	["Van_01_base_F", 40],
	["MRAP_01_base_F", 30],
	["MRAP_02_base_F", 30],
	["MRAP_03_base_F", 30],
	["B_Truck_01_box_F", 150],
	["Truck_F", 75],
	["Wheeled_APC_F", 30],
	["Tank_F", 30],
	["Rubber_duck_base_F", 10],
	["Boat_Civil_01_base_F", 10],
	["Boat_Armed_01_base_F", 20],
	["O_SDV_01_F", 3000 ],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["I_Heli_light_03_base_F", 20],
	["Heli_Transport_01_base_F", 25],
	["Heli_Transport_02_base_F", 30],
	["B_Heli_Transport_03_base_F", 30],
	["Heli_Transport_04_base_F", 30],
	["Heli_Attack_01_base_F", 10],
	["Heli_Attack_02_base_F", 20]
];


R3F_LOG_CFG_objets_transportables =
[
	["Static_Designator_01_base_F", 2],
	["Static_Designator_02_base_F", 2],
	["StaticWeapon", 5],
	["Box_NATO_AmmoVeh_F", 10],
	["B_supplyCrate_F", 5],
	["ReammoBox_F", 3],
	["Kart_01_Base_F", 5],
	["Quadbike_01_base_F", 10],
	["Rubber_duck_base_F", 10],
	["UAV_01_base_F", 2],
	["Land_BagBunker_Large_F", 10],
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Tower_F", 7],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 3],
	["Land_BagFence_Round_F", 2],
	["Land_BagFence_Short_F", 2],
	["Land_BarGate_F", 3],
	["Land_Canal_WallSmall_10m_F", 4],
	["Land_Canal_Wall_Stairs_F", 3],
	["Land_CargoBox_V1_F", 5],
	["Land_Cargo_Patrol_V1_F", 7],
	["Land_Cargo_Tower_V1_F", 30],
	["Land_CncBarrier_F", 4],
	["Land_CncBarrierMedium_F", 4],
	["Land_CncBarrierMedium4_F", 4],
	["Land_CncShelter_F", 2],
	["Land_CncWall1_F", 3],
	["Land_CncWall4_F", 5],
	["Land_Crash_barrier_F", 5],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrierTower_F", 8],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 6],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 4],
	["Land_HBarrier_5_F", 5],
	["Land_LampHarbour_F", 2],
	["Land_LampShabby_F", 2],
	["MetalBarrel_burning_F", 2],
	["Land_Mil_ConcreteWall_F", 5],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_Obstacle_Ramp_F", 5],
	["Land_Pipes_large_F", 5],
	["Land_RampConcreteHigh_F", 6],
	["Land_RampConcrete_F", 5],
	//["Land_Razorwire_F", 5],
	["Land_Sacks_goods_F", 2],
	["Land_Scaffolding_F", 5],
	["Land_Shoot_House_Wall_F", 3],
	["Land_Stone_8m_F", 5],
	["Land_ToiletBox_F", 2],
	["Land_BarrelWater_F", 2],
	["Land_Pier_F", 75],  
	["Land_TinContainer_F", 150],
	["Land_Cargo40_military_green_F", 30],
	["Land_Cargo40_red_F", 30],
	["Land_Kiosk_gyros_F", 20],
	["Land_Kiosk_redburger_F", 20],
	["Land_TentHangar_V1_F", 30], 
	["Land_Dome_Small_F", 75],
	
	["Land_FieldToilet_F",	2],
	["Land_PierLadder_F", 2],
	["Land_Maroula_F", 2],
	["Land_LampHalogen_F", 2],
	["Land_GH_Stairs_F", 5],
	["Land_HBarrierWall_corner_F", 5],
	["Land_HBarrierWall_corridor_F", 10],
	//["Land_Razorwire_F", 2],
	["Land_Medevac_house_V1_F", 10],
	["Land_Cargo_House_V1_F", 10],
	["Land_Cargo_HQ_V1_F", 10],
	["Land_MilOffices_V1_F", 10],
	["Land_Hangar_F", 75],
	
	["Land_Net_Fence_Gate_F", 5],
	["Land_Mil_WallBig_Gate_F", 10],
	["Land_BC_Court_F", 10],
	["Land_Pier_F", 75],
	
	["Land_Pod_Heli_Transport_04_ammo_F", 150]
	
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

R3F_LOG_CFG_objets_deplacables =
[
	"StaticWeapon",
	"ReammoBox_F",
	"Kart_01_Base_F",
	"Quadbike_01_base_F",
	"Rubber_duck_base_F",
	"SDV_01_base_F",
	"UAV_01_base_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BarGate_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_CargoBox_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_Crash_barrier_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Obstacle_Ramp_F",
	"Land_Pipes_large_F",
	"Land_RampConcreteHigh_F",
	"Land_RampConcrete_F",
	"Land_Razorwire_F",
	"Land_Sacks_goods_F",
	"Land_Scaffolding_F",
	"Land_Shoot_House_Wall_F",
	"Land_Stone_8m_F",
	
	"Land_BarrelWater_F",
	"Land_Pier_F",  
	"Land_TinContainer_F",
	
	"Land_FieldToilet_F",	
	"Land_PierLadder_F",
	"Land_Maroula_F",
	"Land_LampHalogen_F",
	"Land_GH_Stairs_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall_corridor_F",
	"Land_Medevac_house_V1_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_MilOffices_V1_F",
	"Land_Net_Fence_Gate_F",
	"Land_Mil_WallBig_Gate_F",
	"Land_BC_Court_F",
		
	"Land_Cargo40_military_green_F",
	"Land_Cargo40_red_F",
	"Land_Hangar_F",
	"Land_TentHangar_V1_F",
	"Land_Dome_Small_F",
	"Land_Kiosk_gyros_F",
	"Land_Kiosk_redburger_F",
	"MetalBarrel_burning_F",
	"Static_Designator_01_base_F",
	"Static_Designator_02_base_F",
			
	"Land_Pod_Heli_Transport_04_ammo_F"
];
