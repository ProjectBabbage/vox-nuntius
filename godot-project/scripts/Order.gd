class_name Order

var order

var origin: Vector2
var target: Vector2


func _init(my_origin: Vector2, my_target: Vector2):
	origin = my_origin
	target = my_target


func toDict():
	var dict = {}
	dict["origin"] = origin
	dict["target"] = target
	return dict
