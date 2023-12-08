extends Area2D

const SPEED := 100

var velocity := Vector2.ZERO
var target := Vector2.ZERO
var direction := 1

func set_direction(dir):
	direction = dir
	if direction == 1:
		$anima.flip_h = false
	else:
		$anima.flip_h = true

func _process(delta):
	$anima.play("idle")
	
	var direction = (target - position).normalized()
	velocity = direction * SPEED * delta
	translate(velocity)

func _on_visibility_screen_exited():
	queue_free()



func _on_area_entered(area):
	queue_free()
