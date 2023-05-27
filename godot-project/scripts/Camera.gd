extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello from GDScript!")
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
