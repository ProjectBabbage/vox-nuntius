extends Node2D
class_name Game

var my_player_id: int
var players = {}
var role: String
var map: Map
export var mapScene: PackedScene


func _ready():
	add_child(load("res://scenes/Lobby.tscn").instance())


func switch_to_game():
	map = mapScene.instance()
	map.game = self
	add_child(map)



func init_player_1(id):
	players[id] = {
		"name": "Player 1",
		"unit_points": 10000,
		"town_center": "TownCenter",
	}


func init_player_2(id):
	players[id] = {
		"name": "Player 2",
		"unit_points": 10000,
		"town_center": "TownCenterAI",
	}
