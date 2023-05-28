extends CanvasLayer

var soldierScene = preload("res://scenes/Soldier.tscn")

func _ready():
	pass

func _on_Temple_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		visible = not visible

func _on_Button_pressed():
	var new_soldier = soldierScene.instance()
	new_soldier.position = get_viewport().get_mouse_position()
	get_parent().add_child(new_soldier)
