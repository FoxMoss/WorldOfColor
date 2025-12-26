extends Node2D

export var speed: float = 1
export var children: Array
var proxy_children: Array

func _ready():
	for child in children:
		var proxy_child = Node2D.new()
		self.add_child(proxy_child)
		proxy_child.position = to_local(get_node(child as NodePath).global_position)
		proxy_child.global_rotation = get_node(child as NodePath).global_rotation
		proxy_children.append(proxy_child)

func _process(delta):
	self.rotation += delta * speed
	
	var index = 0
	for child in children:
		if(get_node(child as NodePath) == null):
			index += 1
			continue
		get_node(child as NodePath).global_position = proxy_children[index].global_position
		get_node(child as NodePath).global_rotation = proxy_children[index].global_rotation
		index += 1
