extends Area2D

func _body_entered(body):
	get_parent().queue_free()
