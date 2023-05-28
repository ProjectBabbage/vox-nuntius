extends Node2D

export (PackedScene) var healthBarPlayer = preload("res://scenes/sub_scenes/HealthBarPlayer.tscn")
export (PackedScene) var healthBarAI = preload("res://scenes/sub_scenes/HealthBarAI.tscn")
var health_bar
var is_team_setup: bool

func _ready():
	assert(get_parent().health != null, "Parent has no health")

func _process(_delta):
	if not is_team_setup:
		var team = get_parent().team
		if not team: 
			return
		if team == "player":
			health_bar = healthBarPlayer.instance()
			add_child(health_bar)
		else:
			health_bar = healthBarAI.instance()
			add_child(health_bar)
		
		health_bar.max_health = get_parent().health.current_health

		is_team_setup = true
	health_bar.value = get_parent().health.current_health
	
