extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isWritingPath := false
var currentLine: Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isWritingPath:
		currentLine.points[1] = get_global_mouse_position()


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("click")
		if isWritingPath:
			isWritingPath = false
			currentLine.points[1] = get_global_mouse_position()
			currentLine = null
		else:
			isWritingPath = true
			currentLine = Line2D.new()
			currentLine.antialiased = true
			currentLine.default_color = Color(0, 0, 0, 1)
			currentLine.width = 3
			currentLine.add_point(get_global_mouse_position())
			currentLine.add_point(get_global_mouse_position())
			add_child(currentLine)
