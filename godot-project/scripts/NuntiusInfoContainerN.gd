extends MarginContainer

onready var game: GameN = get_tree().root.get_node("GameN")


func _process(_delta):
	var my_id = get_tree().get_network_unique_id()
	var available_nuntius = game.players[my_id]["available_nuntius"]
	var max_nuntius = game.players[my_id]["max_nuntius"]
	$NuntiusLabel.text = "%s/%s" % [available_nuntius, max_nuntius]
