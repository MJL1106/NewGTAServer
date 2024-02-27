--FiveM's list of Ped Models can be found here: https://docs.fivem.net/docs/game-references/ped-models/
--A list of all the animations can be found here: https://alexguirre.github.io/animations-list/

Config = {}
Config.Invincible = true --Do you want the peds to be invincible?
Config.Frozen = true --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
Config.Stoic = true --Do you want the peds to react to what is happening in their surroundings?
Config.Fade = true-- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
Config.Distance = 15.0 --The distance you want peds to spawn at


--Does the system you use for grabbing coordinates require subracting from the z axis?
--If so, set this to true. You'll have to adjust the coordinates for defaults down - 1 if you set false.
Config.MinusOne = true

Config.PedList = {
	----------------------------------------
	---          USB TRADE IN LOCATIONS            ---
	----------------------------------------
	{ --Green usb
		model = "a_m_y_acult_01", --The model name. See above for the URL of the list.
		coords = vector3(1444.58, 6334.66, 23.8), --HAIR ON HAWICK AVE
		heading = 134.1, --Must be a float value. This means it needs a decimal and a number after the decimal.
		gender = "male", --Use male or female
		--animDict = "", --The animation dictionary. Optional. Comment out or delete if not using.
		--animName = "", --The animation name. Optional. Comment out or delete if not using.
	    isRendered = false,
        ped = nil,
    },
	
	{ --Blue usb
		model = "u_m_m_griff_01",
		coords = vector3(1444.63, 6331.95, 23.9), --H
		heading = 48.97,
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{ --red usb
		model = "a_m_y_business_02",
		coords = vector3(-1237.86, -909.83, 2.15), --
		heading = 166.53, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{ --gold usb
		model = "a_m_m_hasjew_01",
		coords = vector3(-96.8, -821.74, 44.04), --
		heading = 43.35, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	----------------------------------------
	---          DRUG PROCESS IN LOCATIONS            ---
	----------------------------------------
	{ --METH
		model = "a_m_m_hillbilly_02",
		coords = vector3(-1187.73, -445.27, 43.91), --
		heading = 289.45, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{ --COCAINE
		model = "a_m_m_mlcrisis_01",
		coords = vector3(812.49, -2399.59, 23.66), --
		heading = 223.1, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },

	{ --WEED
		model = "mp_f_weed_01",
		coords = vector3(-716.12, -2470.5, 13.95), --
		heading = 14.29, 
		gender = "female", 
	    isRendered = false,
        ped = nil,
    },
	
	{ --POPPY 
		model = "mp_m_shopkeep_01",
		coords = vector3(1413.67, -2041.67, 52.0), --SENORA FWY NORTH
		heading = 181.04, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	----------------------------------------
	---         Taxi spawn ped           ---
	----------------------------------------

	{
		model = "a_m_m_indian_01", --The model name. See above for the URL of the list.
		coords = vector3(901.34, -170.06, 74.08), --HAIR ON HAWICK AVE
		heading = 228.81, --Must be a float value. This means it needs a decimal and a number after the decimal.
		gender = "male", --Use male or female
		animDict = "abigail_mcs_1_concat-0", --The animation dictionary. Optional. Comment out or delete if not using.
		animName = "csb_abigail_dual-0", --The animation name. Optional. Comment out or delete if not using.
	    isRendered = false,
        ped = nil,
    },


		----------------------------------------
	---         Boosting Tablet spawn ped           ---
	----------------------------------------
	
	{
		model = "a_m_m_afriamer_01",
		coords = vector3(-1361.64, -758.64, 22.5), --SONORA FWY EAST
		heading = 312.54, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	

	-- POLICE MRPD PEDS
	{
		model = "ig_trafficwarden",
		coords = vector3(436.72, -972.98, 25.7), --HARMONY WEST
		heading = 181.9, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{
		model = "ig_trafficwarden",
		coords = vector3(467.31, -1026.99, 28.27), --BARBARENO RD
		heading = 280.04, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{
		model = "ig_trafficwarden",
		coords = vector3(466.06, -1019.78, 28.08), --BARBARENO RD
		heading = 91.81, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	----------------------------------------
	---      Drug Process Peds     ---
	----------------------------------------

	{
		model = "mp_m_shopkeep_01",
		coords = vector3(-679.62, 5800.59, 17.33), --INESENO RD
		heading = 153.17, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{
		model = "a_m_m_trampbeac_01",
		coords = vector3(2503.35, -427.38, 92.99), --CLINTON AVE VINEWOOD
		heading = 177.12, 
		gender = "male", 
	    isRendered = false,
        ped = nil,
    },
	
	{
	 	model = "a_f_m_fatwhite_01",
	 	coords = vector3(vector4(-589.39, -1068.72, 22.34, 0.01)), ---UWU SHOP
	 	heading = 340.0, 
	 	gender = "male", 
	    isRendered = false,
        ped = nil,
     },
	

		----------------------------------------
	---     Fishing Peds     ---
	----------------------------------------

	{
		model = "s_m_y_ammucity_01",                            -- Boat/Gear Menu
		coords = vector3(-806.17, -1496.57, 1.6),               
		heading = 100.0,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "u_m_m_filmdirector",                            -- Boat/Gear Menu
		coords = vector3(-1604.236, 5256.483, 2.073),               
		heading = 291.202,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "s_m_o_busker_01",                            -- Boat/Gear Menu
		coords = vector3(3373.215, 5183.515, 1.46),               
		heading = 266.111,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "ig_cletus",                            -- Boat/Gear Menu
		coords = vector3(1694.811, 39.927, 161.767),               
		heading = 191.786,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "a_m_m_hillbilly_01",                            -- Boat/Gear Menu
		coords = vector3(1299.665, 4231.885, 33.909),               
		heading = 81.693,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
    {
		model = "s_m_y_busboy_01",
		coords = vector3(-1816.406, -1193.334, 14.305),         -- Regular/Exotic Fish Sells
		heading = 325.172,
		gender = "male",
        scenario = "WORLD_HUMAN_CLIPBOARD"
	},



	-- {
	-- 	model = "mp_m_shopkeep_01",
	-- 	coords = vector3(1165.0246582031,-324.23849487305,69.205039978027), --WEST MIRROR DR
	-- 	heading = 90.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_shopkeep_01",
	-- 	coords = vector3(-706.06341552734,-914.91168212891,19.215585708618), --PALOMINO AVE
	-- 	heading = 90.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_shopkeep_01",
	-- 	coords = vector3(24.404470443726,-1347.4686279297,29.497045516968), --INNOCENCE BLVD
	-- 	heading = 270.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_shopkeep_01",
	-- 	coords = vector3(-47.652774810791,-1759.0969238281,29.420993804932), --DAVIS AVE
	-- 	heading = 50.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- ----------------------------------------
	-- ---         CLOTHING SHOPS           ---
	-- ----------------------------------------
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(1.1977746486664,6508.5395507812,31.877857208252), --PALETO BAY DISCOUNT STORE
	-- 	heading = 330.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(1695.0007324219,4817.4858398438,42.063064575195), --GRAPESEED DISCOUNT STORE
	-- 	heading = 360.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(126.91351318359,-224.2897644043,54.557823181152), --SUB URBAN HAWICK AVE
	-- 	heading = 90.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-709.06402587891,-151.46015930176,37.415130615234), --PONSBYS PORTOLA DR
	-- 	heading = 120.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-1448.4134521484,-237.53671264648,49.813484191895), --PONSBYS COUGAR AVE
	-- 	heading = 60.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-165.23820495605,-303.62130737305,39.733280181885), --PONSBYS LAS LAGUNAS BLVD
	-- 	heading = 260.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-1194.0968017578,-767.08703613281,17.316204071045), --SUB URBAN NORTH ROCKFORD DR
	-- 	heading = 220.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(425.87637329102,-811.50103759766,29.491125106812), --BINCO SINNER STREET
	-- 	heading = 20.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-818.19885253906,-1070.4300537109,11.328114509583), --BINCO SOUTH ROCKFORD DR
	-- 	heading = 120.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(75.195365905762,-1387.6209716797,29.376121520996), --INNOCENCE BLVD DISCOUNT STORE
	-- 	heading = 210.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(613.03576660156,2762.4909667969,42.088146209717), --GRAPESEED
	-- 	heading = 280.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(1201.97265625,2710.7973632812,38.222652435303), --HARMONY
	-- 	heading = 100.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-1097.9622802734,2714.6166992188,19.107763290405), --ROUTE 68
	-- 	heading = 140.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "s_f_m_shop_high",
	-- 	coords = vector3(-3169.3762207031,1043.1839599609,20.863208770752), --GREAT OCEAN HWY
	-- 	heading = 50.0, 
	-- 	gender = "female", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- ----------------------------------------
	-- ---           AMMUNATION             ---
	-- ----------------------------------------
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(-330.94049072266,6085.6987304688,31.454765319824), --GREAT OCEAN HWY
	-- 	heading = 200.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(1692.8041992188,3762.0256347656,34.705307006836), --SANDY SHORES
	-- 	heading = 200.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(-1118.6530761719,2700.1198730469,18.554126739502), --ROUTE 68
	-- 	heading = 200.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(2566.9831542969,292.54681396484,108.73484802246), --PALOMINO FWY
	-- 	heading = 0.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(253.47956848145,-51.635822296143,69.941047668457), --SPANISH AVE
	-- 	heading = 80.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(-661.20977783203,-933.51782226562,21.829214096069), --PALOMINO AVE
	-- 	heading = 160.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(841.49786376953,-1035.3450927734,28.194841384888), --ELGIN AVE
	-- 	heading = 340.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(23.803026199341,-1105.8958740234,29.797002792358), --OLYMPIC FWY
	-- 	heading = 120.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_weapexp_01",
	-- 	coords = vector3(809.4541015625,-2159.08203125,29.618989944458), --POPULAR ST
	-- 	heading = 0.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- ----------------------------------------
	-- ---          ROBS LIQUOR             ---
	-- ----------------------------------------
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(1392.5979003906,3606.3920898438,34.980934143066), --SANDY SHORES
	-- 	heading = 200.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(1165.7758789062,2710.8713378906,38.157657623291), --HARMONY
	-- 	heading = 200.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(-2966.3356933594,391.17147827148,15.043302536011), --HARMONY
	-- 	heading = 100.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(-1486.4750976562,-377.71398925781,40.163383483887), --PROSPERITY ST
	-- 	heading = 130.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "mp_m_execpa_01",
	-- 	coords = vector3(-1391.7106933594,-605.59777832031,30.31957244873), --BAHAMA MAMA'S MARATHON AVE
	-- 	heading = 130.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(-1221.6925048828,-908.20947265625,12.326344490051), --SAN ANDREAS AVE
	-- 	heading = 20.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- {
	-- 	model = "cs_nervousron",
	-- 	coords = vector3(1134.2102050781,-982.88604736328,46.415798187256), --EL RANCHO BLVD
	-- 	heading = 300.0, 
	-- 	gender = "male", 
	--     isRendered = false,
    --     ped = nil,
    -- },
	
	-- ----------------------------------------
	-- ---         MECHANIC SHOPS           ---
	-- ----------------------------------------
	-- {
	-- 	model = "s_m_y_xmech_02",
	-- 	coords = vector3(106.11213684082,6627.7666015625,31.787231445312), --PALETO BAY MECHANIC
	-- 	heading = 20.0, 
	-- 	gender = "male", 
	-- 	animDict = "missmechanic", 
	-- 	animName = "work_base",
	--     isRendered = false,
    --     ped = nil,
    -- },
	
}