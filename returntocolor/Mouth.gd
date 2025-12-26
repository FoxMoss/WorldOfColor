extends Area2D

var chewing: bool = false
var spit

func _ready():
	spit = preload("res://returntocolor/Spit.tscn")

func _body_entered(body):
	if(!chewing):
		body.queue_free()
		chewing = true
		$Sprites/Chewing.show()
		$Sprites/Mouth.hide()
		$Timer.start()
		


func _on_timeout():
	chewing = false
	$Sprites/Chewing.hide()
	$Sprites/Mouth.show()
	
	var spit_instace = spit.instance()
	get_node("/root/Main/SpitManager").add_child(spit_instace)
	spit_instace.global_position = self.global_position
