extends CanvasLayer

func _ready():
	pass

func _on_Temple_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		visible = not visible

func _on_Button_pressed():
	var new_soldier = Soldier.instance()
	new_soldier.position = get_viewport().get_mouse_position()
	add_child(new_soldier)
