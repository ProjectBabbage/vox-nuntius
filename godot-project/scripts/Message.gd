extends Area2D
class_name Message

var order: Order
var line: Line2D

func set_order(_order: Order):
	order = _order
	# show line of order
	line = Line2D.new()
	line.add_point(Vector2.ZERO)
	for i in range(1, order.points.size()):
		line.add_point(_order.points[i] - _order.points[0])
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
