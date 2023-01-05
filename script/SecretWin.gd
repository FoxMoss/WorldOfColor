extends Node2D

func _input(event):
	if(Input.is_action_just_pressed("move_up") || Input.is_action_just_pressed("move_down") || Input.is_action_just_pressed("move_escape")):
		$Screen.fade_to_white("res://Map.tscn")
