extends Node2D

var id = 0
var size

func _ready():
	var lvl = load("res://scene/Level.tscn")
	size = get_node("/root/Static").levels.size()
	for a in range(0, size):
		var ins = lvl.instance()
		ins.id = a
		add_child(ins)

func _input(event):
	if(Input.is_action_just_pressed("move_right")):
		id += 1
	if(Input.is_action_just_pressed("move_left")):
		id -= 1
	if(Input.is_action_just_pressed("move_up") || Input.is_action_just_pressed("move_down")):
		$Screen.fade_to_white(get_node("/root/Static").levels[id]["path"])
	id = clamp(id, 0, size - 1)
	$Player.position.x = 51+153*id
