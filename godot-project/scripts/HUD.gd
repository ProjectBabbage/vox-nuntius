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
	var map = get_parent()
	assert(map is Map, "parent of HUD is supposed to be Map")
	map.add_child(new_soldier)
