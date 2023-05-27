extends KinematicBody2D
class_name Unit, "res://assets/IconPack/Spear.png"

var order: Order

var velocity = Vector2.UP * 15
func _ready():
	print("ready unit")
	var kinematic_body := move_and_collide(Vector2.DOWN * 10)
	print(kinematic_body)


func _physics_process(delta):
	if order:
		print("in order")
		move_and_collide(
			Vector2.move_toward(order.target, delta * 100)
		)
	else: 		
		var collision_info: KinematicCollision2D = move_and_collide(velocity * delta)
		if collision_info:
			# var collision_point = collision_info.position
			# print(collision_info.collider.get_script() is Message)
			var collider = collision_info.collider
			if collider is Message:
				order = collider.order
				collider.queue_free()

