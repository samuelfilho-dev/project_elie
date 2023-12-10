extends AnimationPlayer


func _ready():
	speed_scale = 0.5
	play("main")



func _on_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://cenas/cut_scene.tscn")
