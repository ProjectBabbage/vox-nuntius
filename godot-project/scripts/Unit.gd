extends KinematicBody2D
class_name Unit

export var team: String # player or ai

var health: Health = Health.new(100)
var units_to_attack = []

## Attacking
var attack_dmg: int = 2
var attack_timer: Timer

func attack():
	for unit in units_to_attack:
		unit.lose_health(attack_dmg)

func lose_health(amount: int):
	print("lose health ", health.current_health)
	health.current_health -= amount
	if health.current_health <= 0:
		queue_free()
