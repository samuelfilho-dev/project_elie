extends CharacterBody2D

@onready var animaPlayer = AnimatedSprite2D

var GRAVITY = 9.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func isOnFloor():
	if is_on_floor() == false:
		velocity.y += GRAVITY


func _process(delta):
	isOnFloor()
	
	move_and_slide()
