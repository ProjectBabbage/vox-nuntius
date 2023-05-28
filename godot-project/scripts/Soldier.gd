extends Unit
class_name Soldier, "res://assets/IconPack/Spear.png"

var order: Order
var velocity = Vector2.UP * 15
var current_target_point_index: int = 1

onready var timer: Timer = $Timer
		
func _ready():
	var parent_towncenter: TownCenter = get_parent()
	assert(parent_towncenter is TownCenter, "Soldier is supposed to be spawned as a child of a TownCenter")
	team = parent_towncenter.team
	attack_dmg = 6
	timer.start(1)


func _physics_process(delta):
	if timer.time_left <= 0:
		attack()
		timer.start()

	if order:
		if order.points[current_target_point_index].distance_to(global_position) < 10:
			current_target_point_index += 1
			if current_target_point_index >= order.points.size():
				order = null
		else:
			move_and_collide(global_position.direction_to(order.points[current_target_point_index]) * delta * 100)


func pickMessage(message):
	order = message.order
	current_target_point_index = 1
	message.queue_free()

func _on_CombatArea2D_area_entered(area:Area2D):
	var parent = area.get_parent()
	if parent is Unit or parent is Building:
		if parent.team != team:
			units_to_attack.push_back(parent)
	elif area is Message:
		pickMessage(area)

func _on_CombatArea2D_area_exited(area:Area2D):
	var parent = area.get_parent()
	if not (parent is Unit) and not(parent is Building):
		return
	if parent.team != team:
		units_to_attack.remove(units_to_attack.find(parent))
