extends KinematicBody2D
class_name Soldier, "res://assets/IconPack/Spear.png"

var velocity = Vector2(250, 250)

func _ready():
	print("ready unit")
	var kinematic_body := move_and_collide(Vector2.DOWN * 10)
	print(kinematic_body)


func _physics_process(delta):
	var collision_info: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision_info:
		# var collision_point = collision_info.position
		print(collision_info.collider.get_script() is Object)
