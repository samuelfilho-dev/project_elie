extends NinePatchRect

@onready var text := $Text as RichTextLabel
@onready var timer := $Timer as Timer

var msg_queue: Array = [
	"BBCode [color=green]test[/color]",
	"Olá, Tudo Bem",
	"Essa mesagem vai ser como exemplo"
]

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()
		
		
func show_message():
	if not timer.is_stopped():
		text.visible_characters = text.text.length()
		return
	
	if msg_queue.size() == 0:
		get_tree().change_scene_to_file("res://cenas/fase_1.tscn")
		return
	
	var _msg = msg_queue.pop_front()
	
	text.visible_characters = 0
	text.bbcode_text = _msg
	print(msg_queue)
	timer.start()

	
func _on_timer_timeout():
	if text.visible_characters == text.text.length():
		timer.stop()
	text.visible_characters += 1
