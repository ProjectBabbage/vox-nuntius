extends CanvasLayer

func _ready():
	pass

func _on_Temple_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		visible = not visible
