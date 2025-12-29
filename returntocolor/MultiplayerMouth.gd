extends Area2D

var chewing: bool = false
var spit_object
var disabled = false


func _body_entered(body):
	
	if(!chewing && !disabled && body is KinematicBody2D && body.player_owner != $'../../'):
		body.hide()
		body.disabled = true
		body.player_owner = $'../../'
		spit_object = body
		
		chewing = true
		$Sprites/Chewing.show()
		$Sprites/Mouth.hide()
		$Timer.start()
		


func _on_timeout():
	chewing = false
	$Sprites/Chewing.hide()
	$Sprites/Mouth.show()
	
	spit_object.show()
	spit_object.disabled = false
	spit_object.global_position = global_position
	spit_object.speed += 40
	disabled = true
	$Sprites/Error.show()
	$ReadyTimer.start()


func _on_ready_timeout():
	$Sprites/Error.hide()
	disabled = false
