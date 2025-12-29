extends Area2D

export var level: String 
export var id: int 

func _body_entered(body):
	get_node("/root/Main/CameraFollower/Camera2D/Screen").fade_to_white(level)
	get_node("/root/Static").levels[id]["completed"] = true
