extends StaticBody2D

export var delay: float
export var shots: int
export var speed: float
export var rotation_speed: float
export var move_length: float = 5
export var color: Color
export var lifespan: int = 6000
export var distance: int = 800
export var sine: float = 0
export var sine_slowdown: float = 100
export var follow_player: bool = false

var timer
var bullet
var added_rotation = 0
var life: float = 0

var p1: Vector2
var p2: Vector2
var dist_from_player: Vector2

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.one_shot = false
	timer.connect("timeout", self, "_shoot")

func _ready():
	bullet = preload("res://scene/Bullet.tscn")
	timer.wait_time = delay
	$Sprite.modulate = color
	p1 = $p1.global_position
	p2 = $p2.global_position
	dist_from_player = get_node("/root/Main/Player").position - position

func _process(delta):
	if(!follow_player):
		life += delta
		if(life < move_length):
			position = lerp(p1, p2, life/move_length)
		elif(life > move_length*2):
			life = life - move_length*2
		elif(life > move_length):
			position = lerp(p2, p1, life/move_length-1)
		$MainBody.rotation = lerp_angle($MainBody.rotation, added_rotation/10, 0.1)
	else:
		position = get_node("/root/Main/Player").position - dist_from_player
		position.x = clamp(position.x, p1.x, p2.x)
		position.y = clamp(position.y, p1.y, p2.y)

func _shoot():
	added_rotation += rotation_speed
	for x in range(0, shots):
		var bul = bullet.instance()
		bul.position = position
		bul.rotation = rotation + (PI*2/shots*x) + added_rotation/10
		bul.get_node("Sprite").modulate = color
		bul.speed = speed
		bul.deathday = Time.get_ticks_msec()+lifespan
		bul.distance = distance
		bul.sine=sine
		bul.sine_slowdown = sine_slowdown
		
		get_node("/root/Main/BulletManager").add_child(bul)
		
		

