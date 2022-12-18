extends Node2D

func _input(event):
	if(Input.is_action_just_pressed("move_up") || Input.is_action_just_pressed("move_down")):
		$Screen.fade_to_white("res://Map.tscn")
