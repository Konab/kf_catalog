select obj.name as name,
	obj.address as address,
	obj.floor as floor,
	obj.area as area,
	t.name as type,
	array_agg(ss.name) as subway_stations
from object__subway_station o_ss
join object obj
on obj.id = o_ss.object_id
join subway_station ss
on ss.id = o_ss.subway_station_id
join type t
on t.id = obj.type_id
where obj.id = $obj_id
group by obj.id, t.id

