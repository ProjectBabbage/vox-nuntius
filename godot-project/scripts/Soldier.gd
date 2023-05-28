extends Unit
class_name Soldier, "res://assets/IconPack/Spear.png"

var order: Order
var velocity = Vector2.UP * 15
onready var life_bar: ProgressBar = $LifeBar
onready var timer: Timer = $Timer

func _ready():
	var parent_towncenter: TownCenter = get_parent()
	assert(parent_towncenter is TownCenter, "Soldier is supposed to be spawned as a child of a TownCenter")
	team = parent_towncenter.team
	life_bar.value = health.current_health
	# var new_style_box:StyleBoxFlat = life_bar.get_stylebox("normal").duplicate() # Gets the current stylebox, overriden or not for normal and duplicates it (This will only work if one is already set!)
	# new_style_box.bg_color = Color(1,0,0,1) # Changes the duplicate's color to red
	# var style = StyleBoxFlat.new()
	# style.fg_color = Color(1,0,0,1)
	# life_bar.add_stylebox_override("normal", style)# Now we have replaced the override with our new, red one
	# life_bar.add_stylebox_override("Theme Overrides/styles/fg").set_bg_color(Color(1, 0, 0) if team == "ai" else Color(0, 0, 1))
	attack_dmg = 6
	timer.start(1)


func _physics_process(delta):
	life_bar.value = health.current_health

	if timer.time_left <= 0:
		attack()
		timer.start()

	if order:
		if order.target.distance_to(global_position) < 1:
			order = null
		else:
			move_and_collide(global_position.direction_to(order.target) * delta * 100)


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

func _on_CombatArea2D_area_exited(area:Area2D):
	var parent = area.get_parent()
	if not (parent is Unit):
		return
	var unit : Unit = parent
	if unit.team != team:
		units_to_attack.remove(units_to_attack.find(unit))
