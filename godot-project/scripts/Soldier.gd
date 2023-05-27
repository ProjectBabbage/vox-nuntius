extends KinematicBody2D
class_name Soldier, "res://assets/IconPack/Spear.png"

var order: Order

var velocity = Vector2.UP * 15
func _ready():
	
	print("ready unit")
	var kinematic_body := move_and_collide(Vector2.DOWN * 10)
	print(kinematic_body)


func _physics_process(delta):
	if order:
		if order.target.distance_to(position) < 1:
			order = null
			return
		var collision_info: KinematicCollision2D =  move_and_collide(
			Vector2.move_toward(order.target, delta * 100)
		)
		var collider = collision_info.collider
		if collider is Message:
			pickMessage(collider)


func pickMessage(message):
	order = message.order
	message.queue_free()