QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 50
            },
        },
	},
    ['edmc'] = {
		label = 'EDM Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'PDM Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['police'] = {
		label = 'Law Enforcement',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 250
            },
			['1'] = {
                name = 'Officer',
                payment = 500
            },
			['2'] = {
                name = 'Senior officer',
                payment = 575
            },
			['3'] = {
                name = 'Corporal',
                payment = 625
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 725
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 875
            },
            ['6'] = {
                name = 'Captain ',
                payment = 1000
            },
            ['7'] = {
                name = 'Assistant Chief',
                payment = 1250
            },
			['8'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 1600
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
        type = "ems",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'EMT',
                payment = 250
            },
			['1'] = {
                name = 'Advanced EMT',
                payment = 500
            },
			['2'] = {
                name = 'Paramedic',
                payment = 750
            },
			['3'] = {
                name = 'Senior Paramedic',
                payment = 875
            },
            ['4'] = {
                name = 'Doctor',
                payment = 1125
            },
            ['5'] = {
                name = 'Surgeon',
                payment = 1400
            },
			['6'] = {
                name = 'Medical Chief',
				isboss = true,
                payment = 1900
            },
        },
	},
    ['weedshop'] = { 
        label = 'Weedshop',
        defaultDuty = true, 
        offDutyPay = false, 
        grades = { 
            ['0'] = { name = 'Harvester', payment = 600 }, 
            ['1'] = { name = 'Bagger', payment = 900 }, 
            ['2'] = { name = 'Roller', payment = 1400 }, 
            ['3'] = { name = 'Boss', isboss = true, payment = 2000 },
        }, 
    },
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 750
            },
			['2'] = {
                name = 'Business Sales',
                payment = 1000
            },
			['3'] = {
                name = 'Finance',
                payment = 1325
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 1875
            },
        },
	},
    ['carsales'] = {
		label = 'Vehicle Reseller',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
                name = 'Valuer',
                payment = 1000
            },
			['1'] = {
                name = 'Manager',
                payment = 1225
            },
			['2'] = {
                name = 'Owner',
				isboss = true,
                payment = 1900
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 625
            },
			['1'] = {
                name = 'Novice',
                payment = 825
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 1250
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 1500
            },
        },
	},
    ['tuners'] = {
		label = 'Tuners',
        type = "tuners",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 625
            },
			['1'] = {
                name = 'Novice',
                payment = 825
            },
			['2'] = {
                name = 'Experienced',
                payment = 1000
            },
			['3'] = {
                name = 'Advanced',
                payment = 1250
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 1500
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 5000
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 1750
            },
            ['1'] = {
                name = 'Lawyer',
                payment = 2800
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 150
            },
        },
	},
    ['electrical'] = {
		label = 'Electrical',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Electrician',
                payment = 150
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 150
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 25
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 25
            },
        },
	},
	["burgershot"] = {
		label = "Burgershot Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 400
            },
			['1'] = {
                name = "Employee",
                payment = 1000
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 1325
            },
			['3'] = {
                name = "Manager",
                payment = 1500
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 1875
            },
        },
	},
	['uwu'] = {
		label = 'Uwu Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 750
			},
			['1'] = {
				name = 'Crew Member',
				payment = 1000
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 1325
			},
			['3'] = {
				name = 'Manager',
				payment = 1500
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 1875
			},
		},
	},
}
