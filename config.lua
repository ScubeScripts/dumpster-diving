-- ░██████╗░█████╗░██╗░░░██╗██████╗░███████╗░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
-- ██╔════╝██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ╚█████╗░██║░░╚═╝██║░░░██║██████╦╝█████╗░░╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
-- ░╚═══██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
-- ██████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
-- ╚═════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░   

Config = {}

Config.Locale = 'en'

--Bulletin Config
Config.BulletinEnable = false
Config.Position = 'topright'

--Default Config
Config.Timer = 10 * 60000
Config.searchTime = 10000

Config.dumpsterItems = {
    [1] = {chance = 2, id = 'glassbottle', name = 'Glass Bottle', quantity = math.random(1,3), limit = 10},
    [2] = {chance = 4, id = 'wallet', name = 'Wallet', quantity = 1, limit = 4},
    [3] = {chance = 2, id = 'oldshoe', name = 'Old Shoe', quantity = 1, limit = 10},
    [4] = {chance = 2, id = 'mouldybread', name = 'Mouldy Bread', quantity = 1, limit = 10},
    [5] = {chance = 3, id = 'plastic', name = 'Plastic', quantity = math.random(1,8), limit = 0},
    [6] = {chance = 4, id = 'WEAPON_BAT', name = 'Baseball Bat', quantity = 1, limit = 2},
    [7] = {chance = 8, id = 'electronics', name = 'Electronics', quantity = math.random(1,2), limit = 0},
    [8] = {chance = 5, id = 'lowgradefemaleseed', name = 'Female Seed', quantity = 1, limit = 0},
    [9] = {chance = 5, id = 'lowgrademaleseed', name = 'Male Seed', quantity = 1, limit = 0},
    [10] = {chance = 2, id = 'deadbatteries', name = 'Dead Batteries', quantity = 1, limit = 10},
    [11] = {chance = 4, id = 'cellphone', name = 'Broken Phone', quantity = 1, limit = 0},
    [12] = {chance = 3, id = 'rubber', name = 'Rubber', quantity = math.random(1,3), limit = 0},
    [13] = {chance = 2, id = 'brokenfishingrod', name = 'Broken Fishing Rod', quantity = 1, limit = 10},
    [14] = {chance = 7, id = 'cartire', name = 'Car Tire', quantity = 1, limit = 4},
    [15] = {chance = 8, id = 'oldring', name = 'Old Ring', quantity = 1, limit = 10},
    [16] = {chance = 7, id = 'lockpick', name = 'Lockpick', quantity = 1, limit = 15},
    [17] = {chance = 2, id = 'expiredburger', name = 'Expired Burger', quantity = 1, limit = 10}
}

Translation = {
    ['en'] = {
        ['input'] = '~INPUT_CONTEXT~ Search trash can',
        ['search_2'] = 'This dumpster has already been searched',
        ['find'] = 'You found ',
        ['find_1'] = 'You found a ',
        ['find_2'] = 'You have found nothing',
        ['error'] = ' but cannot carry any more of this item',
        ['empty'] = 'The wallet was empty',
        ['cash'] = 'You found $',
        ['cash_1'] = ' inside the wallet',
        ['search'] = 'Searching ...',
    },
}