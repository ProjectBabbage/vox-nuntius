extends KinematicBody2D

export var movement_speed: float = 200
export var messageScene: PackedScene

var order: Order


func _physics_process(delta):
	if order:
		if order.points[0].distance_to(position) < 10:
			var message = messageScene.instance()
			message.position = order.points[0]
			message.order = order
			get_tree().get_root().add_child(message)
			queue_free()
		else:
			move_and_collide(position.direction_to(order.points[0]) * movement_speed * delta)
