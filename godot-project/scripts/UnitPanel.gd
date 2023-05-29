extends Control

# import instance of solider
var soldierScene = preload("res://scenes/Soldier.tscn")

onready var game: Game = get_tree().root.get_node("Game")

func _ready():
	$UnitPointsLabel.text = str(game.players[game.my_player_id]["unit_points"]) + " unit points"

func _on_BuySoldierButton_pressed():
	rpc("spawn_soldier")

remotesync func spawn_soldier():
	var player_id = get_tree().get_rpc_sender_id()
	if game.players[player_id]["unit_points"] >= 100:
		var map = game.map
		game.players[player_id]["unit_points"] -= 100
		var newSoldier = soldierScene.instance()
		var town_center: TownCenter = map.get_node(game.players[player_id]["town_center"])
		newSoldier.position = Vector2(rand_range(-100, 100), rand_range(-100, 100))
		town_center.add_child(newSoldier)
		if player_id == game.my_player_id:
			$UnitPointsLabel.text = str(game.players[player_id]["unit_points"]) + " unit points"
	else:
		$UnitPointsLabel.text = "Not enough unit points"
