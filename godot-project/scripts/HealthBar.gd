extends ProgressBar


func _ready():
	assert(get_parent() is Building or get_parent() is Unit, "Parent has no health")
	var team = get_parent().team
	if team == "player":
		self.get("custom_styles/fg/bg_color").set_bg_color(Color(110, 0, 110, 110))
	else:
		self.get("custom_styles/fg/bg_color").set_bg_color(Color(0, 110, 110, 110))


func _process(_delta):
	value = get_parent().health.current_health
