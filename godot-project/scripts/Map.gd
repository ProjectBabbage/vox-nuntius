extends Area2D
class_name Map

var isWritingPath := false
var currentLine: Line2D

const Order = preload("res://scripts/Order.gd")
var messengerScene = preload("res://scenes/Messenger.tscn")

var game 

func _process(_delta):
	if isWritingPath:
		currentLine.points[currentLine.points.size() - 1] = get_global_mouse_position()
	if isWritingPath and Input.is_action_just_pressed("cancel"):
		currentLine.queue_free()
		isWritingPath = false


func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if isWritingPath and Input.is_action_pressed("chain"):
			currentLine.add_point(get_global_mouse_position())
		elif isWritingPath:
			isWritingPath = false
			currentLine.add_point(get_global_mouse_position())
			var end_position = get_global_mouse_position()
			var order = Order.new(currentLine.points)
			rpc("send_messenger", order.toDict())
			currentLine.queue_free()
		else:
			isWritingPath = true
			currentLine = Line2D.new()
			currentLine.antialiased = true
			currentLine.default_color = Color(0, 0, 0, 1)
			currentLine.width = 3
			currentLine.add_point(get_global_mouse_position())
			currentLine.add_point(get_global_mouse_position())
			add_child(currentLine)

remotesync func send_messenger(orderDict: Dictionary):
	var order = Order.new(orderDict["points"])
	var player_id = get_tree().get_rpc_sender_id()
	var messenger = messengerScene.instance()
	messenger.position = get_node(game.players[player_id].town_center).position
	messenger.order = order
	add_child(messenger)
