extends Area2D


func _on_body_entered(body):
	$anim.play("collect")
	


func _on_anim_animation_finished():
	queue_free()
