extends Node2D

var id = 0

func _ready():
	position.x = id*153
	var data = get_node("/root/Static").levels[id]
	$LevelDescr.text = data["name"]
	$Icon.modulate = Color(data["color"])
	$Completed.text = "Not Completed"
	if(data["completed"]):
		$Completed.text = "Completed"
