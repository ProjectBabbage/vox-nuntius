extends Node2D
class_name GameN

export var mapScene: PackedScene
var my_player_id: int
var players = {}
var role: String
var map: MapN


func _ready():
	add_child(load("res://scenes/LobbyN.tscn").instance())


func switch_to_game():
	map = mapScene.instance()
	map.game = self
	add_child(map)


func init_player_1(id):
	players[id] = {
		"name": "Player 1",
		"unit_points": 10000,
		"available_nuntius": 10,
		"max_nuntius": 10,
		"town_center": "TownCenter",
	}


func init_player_2(id):
	players[id] = {
		"name": "Player 2",
		"unit_points": 10000,
		"available_nuntius": 5,
		"max_nuntius": 5,
		"town_center": "TownCenterAI",
	}
