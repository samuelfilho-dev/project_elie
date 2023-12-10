extends NinePatchRect

@onready var text := $Text as RichTextLabel
@onready var timer := $Timer as Timer

var msg_queue: Array = [
	"A sala está imersa em uma penumbra reconfortante,com o suave zumbido dos equipamentos médicos preenchendo o silêncio. A respiração de Elie é calma, mas seus olhos permanecem fechados. Os monitores ao lado da cama começam a emitir sons intermitentes, indicando um aumento nos sinais vitais de Elie.\n [right]Aperta espaço para continuar[/right]",
	"Subitamente, os olhos de Elie se abrem abruptamente. Seu olhar é confuso e desorientado. Ela pisca várias vezes, tentando entender o que está acontecendo. \n [right]Aperta espaço para continuar[/right]",
	"[b]Elie[/b]: Onde... onde estou? \n \n [right]Aperta espaço para continuar[/right]",
	"Ela tenta mover-se, mas seus músculos parecem fracos. Os olhos de Elie examinam o quarto, buscando pistas sobre sua localização. As cortinas estão parcialmente abertas, revelando um vislumbre de luz noturna urbana do lado de fora. \n [right]Aperta espaço para continuar[/right]",
	"O Ano é 2024 e Elie acorda de um coma no [b]Hospital Santa Ana[/b]. \n \n [right]Aperta espaço para continuar[/right]",
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
	timer.start()

	
func _on_timer_timeout():
	if text.visible_characters == text.text.length():
		timer.stop()
	text.visible_characters += 1
