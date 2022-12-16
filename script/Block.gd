extends Area2D

func _body_entered(body):
	body.queue_free()
