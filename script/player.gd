extends CharacterBody2D

const ORB = preload("res://characters/items/spell_orbs.tscn")

@onready var animaPlayer = $anima_player as AnimatedSprite2D
@onready var spellPoint = $spell_point as Marker2D
@onready var cooldown = $cooldown as Timer

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
	
	if sign(spellPoint.position.x) == -1:
		spellPoint.position.x *= -1
	
	

func moveRight():
	direction = -2.25
	if direction == -2.25:
		animaPlayer.scale.x = direction
		animaPlayer.play("running")
		velocity.x += -25
		
	if sign(spellPoint.position.x) == 1:
		spellPoint.position.x *= -1

func spell_lauch():
	var spell_instance = ORB.instantiate()
	if sign(spellPoint.position.x) == 1:
		spell_instance.set_direction(1)
	else:
		spell_instance.set_direction(-1)
	
	add_sibling(spell_instance)
	spell_instance.position = spellPoint.global_position
	
	var target = get_global_mouse_position()
	spell_instance.target = target
	
	cooldown.start()
	

func isOnFloor():
	if is_on_floor() == false:
		velocity.y += GRAVITY

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if cooldown.is_stopped():
				spell_lauch()


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
