extends Area2D
class_name Message

var order: Order
var line: Line2D

func set_order(_order: Order):
	order = _order
	# create Line2D
	# var new_line = Line2D.new()
	# new_line.add_point(Vector2.ZERO)
	# new_line.add_point(Vector2.RIGHT * 500)
	# new_line.antialiased = true
	# new_line.default_color = Color(200, 0, 0, 1)
	# new_line.width = 5
	# add_child(new_line)
	# test add to Map



	line = Line2D.new()
	line.add_point(Vector2.ZERO)
	line.add_point(_order.points[1] - _order.points[0])
	line.antialiased = true
	line.default_color = Color(0, 0, 0, 1)
	line.width = 3
	add_child(line)
	line.visible = false

func _on_Message_mouse_exited():
	if line:
		line.visible = false

func _on_Message_mouse_entered():
	if line:
		line.visible = true
