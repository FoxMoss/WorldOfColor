extends Node2D

func _process(delta):
	for child in get_children():
		child.position = child.to_global(Vector2.UP*child.speed*delta*60)
		if(child.sine != 0):
			child.position = child.to_global(Vector2.RIGHT*sin((Time.get_ticks_msec()-child.deathday)/child.sine_slowdown)*child.sine*delta*60)
		if(child.position.distance_to(get_node("/root/Main/Player").position) > child.distance):
			child.queue_free()
		if(child.deathday < Time.get_ticks_msec()):
			child.queue_free()
