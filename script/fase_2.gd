extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$open_door.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://cenas/credits.tscn")
