extends Control

export var unit_points = 10000

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# import instance of solider
var Soldier = preload("res://scenes/Soldier.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$UnitPointsLabel.text = str(unit_points) + " unit points"

func _on_BuySoldierButton_pressed():
	if unit_points >= 100:
		var map = get_parent().get_parent()
		assert(map is Map, "double parent of unit panel is not the map")
		unit_points -= 100
		$UnitPointsLabel.text = str(unit_points) + " unit points"
		var newSoldier = Soldier.instance()
		newSoldier.position = Vector2(rand_range(-4750, -4000), rand_range(2000, 2500))
		map.add_child(newSoldier)
		emit_signal("buy_soldier")
	else:
		$UnitPointsLabel.text = "Not enough unit points"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
