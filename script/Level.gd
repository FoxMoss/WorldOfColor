extends Node2D

var id = 0

func _ready():
	position.x = id*153
	var data = get_node("/root/Static").levels[id]
	$LevelDescr.text = data["name"]
	if(data["color"] == "ffffff"):
		$Icon.texture = load(data["image"])
		$Completed.add_color_override("font_color", Color(0, 0, 0))
	$Icon.modulate = Color(data["color"])
	$Completed.text = "Not Completed"
	if(data["completed"]):
		$Completed.text = "Completed"
