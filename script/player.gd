extends CharacterBody2D

@onready var animaPlayer = $anima_player as AnimatedSprite2D

const GRAVITY = 9.8

var direction = 2.25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func normalPosition():
	animaPlayer.play("idle")

func moveUp():
	animaPlayer.play("up")

func moveDown():
	animaPlayer.play("down")

func moveJummping():
	velocity.y += -300
	animaPlayer.play("jump")

func moveLeft():
	direction = 2.25
	if direction == 2.25:
		animaPlayer.scale.x = direction
		animaPlayer.play("running")
		velocity.x += 25 

func moveRight():
	direction = -2.25
	if direction == -2.25:
		animaPlayer.scale.x = direction
		animaPlayer.play("running")
		velocity.x += -25

func isOnFloor():
	if is_on_floor() == false:
		velocity.y += GRAVITY

func _process(delta):
	isOnFloor()
		
	if Input.is_key_pressed(KEY_D):
		moveLeft()
	elif Input.is_key_pressed(KEY_A):
		moveRight()
	elif Input.is_key_pressed(KEY_W):
		moveUp()
	elif Input.is_key_pressed(KEY_S):
		moveDown()
	else:
		velocity.x = 0
		normalPosition()
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		moveJummping()
		
	
	move_and_slide()
