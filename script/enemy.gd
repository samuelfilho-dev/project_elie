extends CharacterBody2D

@onready var animaEnemy = $anim as AnimatedSprite2D
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
		$texture.flip_h = true
	else:
		$texture.flip_h = false
	
	velocity.x = direction * ENEMY_SPEED * delta
	$anim.play("idle")
	
	move_and_slide()

