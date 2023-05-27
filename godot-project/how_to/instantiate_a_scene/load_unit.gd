extends Node2D

var resource = preload("res://scenes/Unit.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var unit = resource.instance()
	unit.translate(Vector2.RIGHT * 200 + Vector2.DOWN * 100)
	add_child(unit)
	add_child(resource.instance())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass