extends Control

class_name dialog_box_npc

var _step = 0.05
var _id = 0

var data: Dictionary = {}

@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null

func _ready():
	inicial_dialog()
	
func _process(delta):
	if Input.is_action_pressed("ui_accept") and _dialog.visible_ratio < 1:
		_step = 0.01
		return
	
	_step = 0.05
	if Input.is_action_just_pressed("ui_accept"):
		_id += 1
		print("id: ", _id)
		if _id == data.size():
			queue_free()
			return
		
		inicial_dialog()

func inicial_dialog():
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])
	
	_dialog.visible_characters = 0
	
	while _dialog.visible_ratio < 1:
		await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1
