extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var configfile = File.new()
	configfile.open("res://how_to/load_json/example.json", File.READ)
	var json = JSON.parse(configfile.get_as_text())
	print(json.result["races"])