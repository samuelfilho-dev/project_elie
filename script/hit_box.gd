extends Area2D


func _on_area_entered(area):
	if area.is_in_group("bullets"):
		area.queue_free()
		owner.queue_free()
