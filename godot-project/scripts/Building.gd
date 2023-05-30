extends KinematicBody2D
class_name Building

var health: Health = Health.new(1000)


func lose_health(amount: int):
	health.current_health -= amount
	if health.current_health <= 0:
		queue_free()
