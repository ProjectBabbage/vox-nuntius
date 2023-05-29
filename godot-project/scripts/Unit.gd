extends KinematicBody2D
class_name Unit

export(String, "player", "ai") var team

var health: Health = Health.new(100)
var units_to_attack = []

## Attacking
var attack_dmg: int = 2
var attack_timer: Timer

func attack():
	var size = units_to_attack.size()
	if size != 0:
		var unit = units_to_attack[rand_range(0, size)]
		get_node("AttackAnimation").play("attack")
		unit.lose_health(attack_dmg)

func lose_health(amount: int):
	health.current_health -= amount
	if health.current_health <= 0:
		queue_free()
