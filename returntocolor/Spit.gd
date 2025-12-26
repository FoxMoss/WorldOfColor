extends Area2D


var velocity: Vector2 = Vector2.ZERO
var max_velocity = 5

var lifetime = 1
var total_lifetime = lifetime

func _process(delta):
	var closest_shooter = null
	var closest_distance = INF
	for child_raw in get_node("/root/Main/ShooterManager").get_children():
		var child = child_raw as Node2D
		
		var direction = (child.position - self.position)
		var length = (child.position - self.position).length()
		if(closest_distance > length):
			closest_distance = length
			closest_shooter = direction
	
	if(closest_shooter == null):
		self.queue_free()
		return;
	
	velocity += closest_shooter
	velocity = velocity.normalized() * min(velocity.length(), max_velocity)
	position += velocity
	velocity *= 0.9
	lifetime -= delta
	
	if(lifetime <= 0):
		self.queue_free()
	
	var percent_lifetime = lifetime/total_lifetime
	self.scale = Vector2(percent_lifetime,percent_lifetime);

func _body_entered(body):
	self.queue_free()
	body.health -= 0.5
