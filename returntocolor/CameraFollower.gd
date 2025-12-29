extends Node2D

export var children: Array

func _process(delta):
	var combined_pos = Vector2.ZERO
	
	var index = 0
	var distance = (get_node(children[0] as NodePath) as Node2D).global_position.distance_to((get_node(children[1] as NodePath) as Node2D).global_position)
	
	distance /= 1400
	
	distance = clamp(distance, 0.5, 2)
	
	$Camera2D.zoom = Vector2(distance, distance)
	
	for child in children:
		if(get_node(child as NodePath) == null):
			index += 1
			continue
		var child_node = get_node(child as NodePath)
		
		combined_pos += child_node.global_position
	combined_pos /= children.size()
	global_position = combined_pos
