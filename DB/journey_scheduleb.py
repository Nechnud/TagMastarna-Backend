import datetime as dt

date = dt.datetime.now()

sthlm_gbg_route_id = 1
sthlm_gbg_start1 = '07:00'
sthlm_gbg_start2 = '18:00'

gbg_sthlm_route_id = 2
gbg_sthlm_start1 = '12.30'
gbg_sthlm_start2 = '23:00'

gbg_hyllie_route_id = 3
gbg_hyllie_start1 = '12:00'
gbg_hyllie_start2 = '23:00'

hyllie_gbg_route_id = 4
hyllie_gbg_start1 = '07:00'
hyllie_gbg_start2 = '15.40'

hbg_trelle_route_id = 5
hbg_trelle_start1 = '07:00'
hbg_trelle_start2 = '11:00'
hbg_trelle_start3 = '14:00'
hbg_trelle_start4 = '18:00'
hbg_trelle_start5 = '22:00'

trelle_hbg_route_id = 6
trelle_hbg_start1 = '09:00'
trelle_hbg_start2 = '12:00'
trelle_hbg_start3 = '16:00'
trelle_hbg_start4 = '20:00'
trelle_hbg_start5 = '00:00'

routes = []
routes.append(
    {
        'route_id': sthlm_gbg_route_id, 
        'train_set': 1, 
        'departures': [sthlm_gbg_start1, sthlm_gbg_start2]
    }
)
routes.append(
    {
        'route_id': gbg_sthlm_route_id, 
        'train_set': 1, 
        'departures': [gbg_sthlm_start1, gbg_sthlm_start2]
        }
)
routes.append(
    {
        'route_id': gbg_hyllie_route_id, 
        'train_set': 2, 
        'departures': [gbg_hyllie_start1, gbg_hyllie_start2]
    }
)
routes.append(
    {
        'route_id': hyllie_gbg_route_id, 
        'train_set': 2, 
        'departures': [hyllie_gbg_start1, hyllie_gbg_start2]
    }
)
routes.append(
    {
        'route_id': hbg_trelle_route_id, 
        'train_set': 3, 
        'departures': [hbg_trelle_start1, hbg_trelle_start2,hbg_trelle_start3,hbg_trelle_start4,hbg_trelle_start5]
    }
)
routes.append(
    {
        'route_id': trelle_hbg_route_id, 
        'train_set': 3, 
        'departures': [trelle_hbg_start1, trelle_hbg_start2,trelle_hbg_start3,trelle_hbg_start4,trelle_hbg_start5]
    }
)

with open(fr'', 'w') as file:
    for i in range(100):
        if i > 0:
            date = date.today()+dt.timedelta(i)
        for j in routes:
            for x in j['departures']:
                if x == hbg_trelle_start5 and j['route_id'] == hbg_trelle_route_id or \
                    x == trelle_hbg_start5 and j['route_id'] == trelle_hbg_route_id:
                    if date.weekday() == 5 or date.weekday() == 6:
                        continue
                sql = f'INSERT INTO Journey (route_id, trainSet_id, depFromFirstStationTime) ' + \
                        f'VALUES ({j["route_id"]}, {j["train_set"]}, "{date.year}-{date.month}-{date.day}:{x}");\n'                
                file.write(sql)
                print(sql)
