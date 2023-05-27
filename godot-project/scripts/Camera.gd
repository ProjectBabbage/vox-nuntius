extends Camera2D

export var camera_speed = 1000

export var zoom_speed = 0.4
export var min_zoom = 5
export var max_zoom = 0.25

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += camera_speed * delta * zoom.x
	if Input.is_action_pressed("ui_left"):
		position.x -= camera_speed * delta * zoom.x
	if Input.is_action_pressed("ui_up"):
		position.y -= camera_speed * delta * zoom.y
	if Input.is_action_pressed("ui_down"):
		position.y += camera_speed * delta * zoom.y

	if Input.is_action_just_released('wheel_down') and zoom.x < min_zoom and zoom.y < min_zoom:
		zoom.x += zoom_speed
		zoom.y += zoom_speed
	if Input.is_action_just_released('wheel_up') and zoom.x > max_zoom and zoom.y > max_zoom:
		zoom.x -= zoom_speed
		zoom.y -= zoom_speed
