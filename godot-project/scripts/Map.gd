extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("hi")
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("click")
		var position = get_global_mouse_position()
		var l := Line2D.new()
		l.antialiased = true
		l.default_color = Color(0, 0, 0, 1)
		l.width = 3
		l.add_point(Vector2(0, 0))
		l.add_point(position)
		add_child(l)
	pass  # Replace with function body.
