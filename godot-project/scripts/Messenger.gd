extends KinematicBody2D

export var movement_speed: float = 100
export var messageScene: PackedScene

var order: Order


func _physics_process(delta):
	if order:
		if order.origin.distance_to(position) < 1:
			var message = messageScene.instance()
			message.position = position
			message.order = order
			get_tree().get_root().add_child(message)
			queue_free()
		else:
			move_and_collide(position.direction_to(order.origin) * movement_speed * delta)
