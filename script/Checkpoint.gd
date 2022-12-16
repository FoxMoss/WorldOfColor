extends Area2D

export var sprite1: Texture
export var sprite2: Texture


func _body_entered(body):
	body._respawn_change()
	body.respawn = self
	$Sprite.texture = sprite2
