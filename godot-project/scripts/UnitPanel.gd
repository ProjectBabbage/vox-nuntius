extends Control

export var unit_points = 10000

# import instance of solider
var Soldier = preload("res://scenes/Soldier.tscn")

func _ready():
	$UnitPointsLabel.text = str(unit_points) + " unit points"

func _on_BuySoldierButton_pressed():
	if unit_points >= 100:
		var map = get_parent().get_parent()
		assert(map is Map, "double parent of UnitPanel is not the Map")
		var town_center = map.get_node("TownCenter")
		unit_points -= 100
		$UnitPointsLabel.text = str(unit_points) + " unit points"
		var newSoldier = Soldier.instance()
		newSoldier.position = Vector2(rand_range(-100, 100), rand_range(-100, 100))
		town_center.add_child(newSoldier)
		emit_signal("buy_soldier")
	else:
		$UnitPointsLabel.text = "Not enough unit points"
