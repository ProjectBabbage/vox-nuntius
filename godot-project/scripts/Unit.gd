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
		var target = units_to_attack[0]
		var minimum = units_to_attack[0].health.max_health
		for unit in units_to_attack:
			if unit.health.current_health < minimum:
				minimum = unit.health.current_health
				target = unit		

		get_node("AttackAnimation").play("attack")
		target.lose_health(attack_dmg)

func lose_health(amount: int):
	health.current_health -= amount
	if health.current_health <= 0:
		queue_free()
