extends KinematicBody2D
class_name Message

const Order = preload("res://scripts/Order.gd")

var order: Order


func _ready():
	print(order)
