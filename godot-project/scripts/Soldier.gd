extends Unit
class_name Soldier, "res://assets/IconPack/Spear.png"

var order: Order
var velocity = Vector2.UP * 15
onready var life_bar: ProgressBar = $LifeBar
onready var timer: Timer = $Timer

func _ready():
	life_bar.value = health.current_health
	attack_dmg = 6
	timer.start(1)


func _physics_process(delta):
	life_bar.value = health.current_health

	if timer.time_left <= 0:
		attack()
		timer.start()

	if order:
		if order.target.distance_to(position) < 1:
			order = null
		else:
			move_and_collide(position.direction_to(order.target) * delta * 100)


func pickMessage(message):
	order = message.order
	message.queue_free()

func _on_CombatArea2D_area_entered(area:Area2D):
	var parent = area.get_parent()
	if parent is Unit:
		if parent.team != team:
			units_to_attack.push_back(parent)
			print("added enemy ", parent)
	elif area is Message:
		pickMessage(area)
	else:
		print("entered ", parent)

func _on_CombatArea2D_area_exited(area:Area2D):
	var parent = area.get_parent()
	if not (parent is Unit):
		return
	var unit : Unit = parent
	if unit.team != team:
		units_to_attack.remove(units_to_attack.find(unit))
		print("enemy exited ", unit)
