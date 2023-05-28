extends Control

export var unit_points = 10000

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UnitPointsLabel.text = str(unit_points) + " unit points"

func _on_BuySoldierButton_pressed():
	if unit_points >= 100:
		unit_points -= 100
		$UnitPointsLabel.text = str(unit_points) + " unit points"
		emit_signal("buy_soldier")
	else:
		$UnitPointsLabel.text = "Not enough unit points"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
