extends CharacterBody2D

const ORB = preload("res://characters/items/spell_orbs.tscn")

@onready var anime = $animator as AnimationPlayer
@onready var spellPoint = $spell_point as Marker2D
@onready var playerLight = $Light as Light2D
@onready var cooldown = $cooldown as Timer
@onready var musicTimer = $music_timer as Timer
@onready var gunShot = $gun_shot as AudioStreamPlayer2D

const GRAVITY = 9.8

var direction := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func normalPosition():
	anime.play("idle")


func moveLeft():
	velocity.x = 30
	anime.play("walking")
	
	$texture.flip_h = false
	playerLight.position.x = 45
	
	if sign(spellPoint.position.x) == -1:
		spellPoint.position.x *= -1
	
	

func moveRight():
	velocity.x = -30
	anime.play("walking")
	
	$texture.flip_h = true
	playerLight.position.x = -45
		
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
	
	gunShot.play()
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
	else:
		velocity.x = 0
		normalPosition()
		
	
	move_and_slide()
