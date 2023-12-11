extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://characters/npc/dialog_box_npc.tscn")


var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://recursos/Sprite Pack 7/1 - Diego/Standing (32 x 48).png",
		"dialog": "Olá, como você chegou aqui",
		"title": "Diego"
	},
	
	1: {
		"faceset": "res://recursos/Projeto_Extinction/Character/Pause/Pause01.png",
		"dialog": "Abri uma porta do térreo do hospital que veio parar direto para o esgoto",
		"title": "Elen"
	},
	
	2: {
		"faceset": "res://recursos/Projeto_Extinction/Character/Pause/Pause01.png",
		"dialog": "Você sabe o que aconteceu",
		"title": "Elen"
	},
	
	3: {
		"faceset": "res://recursos/Sprite Pack 7/1 - Diego/Standing (32 x 48).png",
		"dialog": "Pelo que ouvi, uma empresa responsável por dados médicos vendeu nossos dados para uma farmacêutica do mal, Logo começou zumbis para todo lugar",
		"title": "Diego"
	},
	
	4: {
		"faceset": "res://recursos/Sprite Pack 7/1 - Diego/Standing (32 x 48).png",
		"dialog": "Agora nós sobrevivemos a esse mundo",
		"title": "Diego"
	},
}

@export_category("Objects")
@export var _hud: CanvasLayer = null


func _on_exit_area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://cenas/credits.tscn")


func _on_dialog_area_body_entered(body):
	if body.name == "Player":
			var _new_dialog: dialog_box_npc = _DIALOG_SCREEN.instantiate()
			_new_dialog.data = _dialog_data
			_hud.add_child(_new_dialog)
	


func _on_dialog_area_body_exited(body):
	if body.name == "Player":
		pass
