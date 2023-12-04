extends CharacterBody2D

@onready var animaEnemy = $anime as AnimatedSprite2D
@onready var wallDetector = $wall_detector as RayCast2D

const GRAVITY = 9.8
const ENEMY_SPEED = 700

var direction = -1 

func isOnFloor():
	if is_on_floor() == false:
		velocity.y += GRAVITY


func wallDec():
	if wallDetector.is_colliding():
		direction *= -1
		wallDetector.scale.x *= -1
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isOnFloor()
	
	wallDec()
	
	if direction == 1:
		animaEnemy.scale.x = -2.25
	else :
		animaEnemy.scale.x = 2.25
	
	velocity.x = direction * ENEMY_SPEED * delta
	animaEnemy.play("walking")
	
	move_and_slide()
