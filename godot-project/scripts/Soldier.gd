extends Unit
class_name Soldier, "res://assets/IconPack/Spear.png"

var order: Order
var velocity = Vector2.UP * 15
var timer: Timer

func _ready():
	attack_dmg = 6
	timer = $Timer
	timer.start(1)


func _physics_process(delta):
	if timer.time_left <= 0:
		attack()
		timer.start()

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

func _on_CombatArea2D_area_entered(area:Area2D):
	var unit : Unit = area.get_parent()
	if unit.team != team:
		units_to_attack.push_back(unit)
		print("added enemy ", unit)

func _on_CombatArea2D_area_exited(area:Area2D):
	var unit : Unit = area.get_parent()
	if unit.team != team:
		units_to_attack.remove(units_to_attack.find(unit))
		print("enemy exited ", unit)
