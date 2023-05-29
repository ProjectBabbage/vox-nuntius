class_name Order

var order
var points: PoolVector2Array


func _init(my_points: PoolVector2Array):
	points = my_points


func toDict():
	var dict = {}
	dict["points"] = points
	return dict
