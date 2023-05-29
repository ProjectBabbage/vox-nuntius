extends Node2D

var soldierScene = preload("res://scenes/Soldier.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var soldier = soldierScene.instance()
	soldier.translate(Vector2.RIGHT * 200 + Vector2.DOWN * 100)
	add_child(soldier)
	add_child(soldierScene.instance())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass