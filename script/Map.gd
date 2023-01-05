extends Node2D

var id = 0
var total_completed = 0
var total_in = 0
var size

func _ready():
	var lvl = load("res://scene/Level.tscn")
	size = get_node("/root/Static").levels.size()
	for a in range(0, size):
		if(get_node("/root/Static").levels[a]["completed"] == true):
			total_completed += 1
		if(get_node("/root/Static").levels[a]["invisible"] == false && get_node("/root/Static").levels[a]["completed_req"] <= total_completed):
			var ins = lvl.instance()
			ins.id = a
			add_child(ins)
			total_in += 1
		elif(get_node("/root/Static").levels[a]["completed_req"] > total_completed):
			a -= 1
		elif(get_node("/root/Static").levels[a]["invisible"] == true):
			total_in += 1

func _input(event):
	if(Input.is_action_just_pressed("move_right")):
		id += 1
	if(Input.is_action_just_pressed("move_left")):
		id -= 1
	if((Input.is_action_just_pressed("move_up") || Input.is_action_just_pressed("move_down")) && !get_node("/root/Static").levels[id]["invisible"]):
		$Screen.fade_to_white(get_node("/root/Static").levels[id]["path"])
	if(Input.is_action_just_pressed("action_unlock") && !get_node("/root/Static").show_timer):
		for a in range(0, size):
			get_node("/root/Static").levels[a]["completed"] = true
			$Screen.fade_to_white("res://Map.tscn")
	id = clamp(id, 0, total_in - 1)
	$Player.position.x = 51+153*id
