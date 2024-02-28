Config	= {}


Config.WheelPos = {x = 990.28, y = 42.84, z = 70.52, h =328.0}	-- Where the wheel prop will spawn OR where wheel prop is
Config.startingPrice = 5000
Config.VehiclePrize = 'jester'
Config.VehicleSpawnCoords = vector4(933.29, -2.82, 78.76, 144.6)
Config.VehiclePlateText = 'Diamond'


Config.LimitedSpins = false				-- [true = players spin once per day for free] [false= $5000 a spin]
Config.LimitedSpinResetTime = 3600000 	-- 1 hour real time

 


-- type = [weapon, money, item, car] (for money it will give only in bank)
-- name = item in the database 
-- count = amount to receive
-- sound = [car, cash, clothes, chips, mystery, win]


Config.Prices = {
	[1]  = {type = 'car', 		name = 'car', 					count = 1, 		sound = 'car', 		probability = {a =   0, b =   1}},	--  0.1 %   0.1 -- VEHICLE
	[2]  = {type = 'money', 	name = 'money', 				count = 15000, 	sound = 'cash', 	probability = {a =   1, b =   5}},	--  0.4 %   0.5 -- 15.000 RP
	[3]  = {type = 'money', 		name = 'water_bottle', 			count = 1, 		sound = 'clothes', 	probability = {a =   5, b =  55}},	--  5 %   5.5 -- CLOTHING
	[4]  = {type = 'money', 		name = 'money', 		count = 2500, 	sound = 'cash', 	probability = {a =  55, b =  105}},	--  5.0 %   10.5 -- 25.000 chips
	[5]  = {type = 'money', 	name = 'money', 				count = 4000, 	sound = 'cash', 	probability = {a =  105, b =  120}},	--  1.5 %   12.0 -- 40.000 $
	[6]  = {type = 'money', 	name = 'money', 				count = 1000, 	sound = 'cash', 	probability = {a =  120, b =  170}},	--  5.0 %   17.0 -- 10.000 RP
	[7]  = {type = 'item', 		name = 'sandwich', 				count = 1, 		sound = 'clothes', 	probability = {a =  170, b =  270}},	--  10.0 %   27.0 -- CLOTHING
	[8]  = {type = 'item', 		name = 'pistol_ammo',  			count = 1, 		sound = 'mystery', 	probability = {a =  270, b = 320}},	--  5.0 %  32.0 -- MYSTERY
	[9]  = {type = 'money', 		name = 'money', 		count = 2000, 	sound = 'cash', 	probability = {a = 320, b = 350}},	--  5.0 %  35.0 -- 20.000 chips
	[10] = {type = 'money', 	name = 'money', 				count = 750, 	sound = 'cash', 	probability = {a = 350, b = 415}},	--  6.5 %  41.5 -- 7.500 RP
	[11] = {type = 'item',		name = 'water_bottle', 				count = 1, 		sound = 'clothes', 	probability = {a = 415, b = 505}},	--  9.0 %  50.5 -- CLOTHING
	[12] = {type = 'money', 		name = 'money', 		count = 1500, 	sound = 'cash', 	probability = {a = 505, b = 535}},	--  3.0 %  53.5 -- 15.000 chips
	[13] = {type = 'money', 	name = 'money', 				count = 3000, 	sound = 'cash', 	probability = {a = 535, b = 555}},	--  2.0 %  55.5 -- 30.000 $
	[14] = {type = 'money', 	name = 'money', 				count = 500, 	sound = 'cash', 	probability = {a = 555, b = 620}},	--  6.5 %  62.0 -- 5.000 RP
	[15] = {type = 'weapon', 	name = 'weapon_snspistol',	 		count = 1, 		sound = 'mystery', 	probability = {a = 620, b = 630}},	--  1.0 %  63.0 -- DISCOUNT
	[16] = {type = 'money',		name = 'money', 		count = 1000, 	sound = 'cash', 	probability = {a = 630, b = 680}},	--  5.0 %  68.0 -- 10.000 chips
	[17] = {type = 'money',		name = 'money', 				count = 2000, 	sound = 'cash', 	probability = {a = 680, b = 710}},	--  3.0 %  71.0 -- 20.000 $
	[18] = {type = 'money', 	name = 'money', 				count = 250, 	sound = 'cash', 	probability = {a = 710, b = 800}},	--  9.0 %  80.0 -- 2.500 RP
	[19] = {type = 'item', 		name = 'sandwich', 				count = 1, 		sound = 'clothes', 	probability = {a = 800, b = 900}},	--  10.0 %  90.0 -- CLOTHING
	[20] = {type = 'money', 	name = 'money', 				count = 50, 	sound = 'cash', 	probability = {a = 900, b = 1000}},	--  10.0 %       -- 50.000 $ 
}
