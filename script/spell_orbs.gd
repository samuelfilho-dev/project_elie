extends Area2D

const SPEED := 10

var velocity := Vector2.ZERO
var target := Vector2.ZERO
var direction := 1
var dir_unica := true

func set_direction(dir):
	direction = dir
	if direction == 1:
		$anima.flip_h = false
	else:
		$anima.flip_h = true

func _process(delta):
	$anima.play("idle")
	
	if dir_unica:
		look_at(get_global_mouse_position())
		dir_unica = false
	
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	translate(velocity)
	


func _on_visibility_screen_exited():
	queue_free()
