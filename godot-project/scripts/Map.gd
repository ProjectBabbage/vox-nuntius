extends Area2D

var isWritingPath := false
var currentLine: Line2D

export var messengerScene: PackedScene

func _ready():
	pass

const Order = preload("res://scripts/Order.gd")

func _process(delta):
	if isWritingPath:
		currentLine.points[1] = get_global_mouse_position()


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if isWritingPath:
			isWritingPath = false
			var end_position = get_global_mouse_position()
			var messenger = messengerScene.instance()
			messenger.position = Vector2(0, 0)
			messenger.order = Order.new(currentLine.points[0], end_position)
			add_child(messenger)
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
