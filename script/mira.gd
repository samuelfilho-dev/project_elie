extends Node2D

var mouse_sensitivity := 0.3

func  _input(event):
	if event is InputEventMouseMotion:
		print("Colision")
