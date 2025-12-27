extends KinematicBody2D

export var speed: float
export var friction: float

var velocity_raw: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var respawn: Node2D

var move_rot: float = 0

func _ready():
	respawn = get_node("/root/Main/CheckpointManager/1")

func _input(event):
	if(Input.is_action_just_pressed("move_escape")):
		$Screen.fade_to_white("res://Map.tscn")

func _physics_process(delta):
	velocity_raw.y -= Input.get_action_strength("move_up")
	velocity_raw.y += Input.get_action_strength("move_down")
	velocity_raw.x += Input.get_action_strength("move_right")
	velocity_raw.x -= Input.get_action_strength("move_left")
	
	
	velocity += velocity_raw.normalized() * speed
	
	velocity = move_and_slide(velocity);
	
	velocity /= friction
	velocity_raw = Vector2.ZERO
	
	
	if (velocity != Vector2.ZERO):
		move_rot = velocity.angle()
	
	var direction = 0
	if(((abs(velocity.x) > abs(velocity.y)) && velocity.x < 0) || ((abs(velocity.x) < abs(velocity.y)) && velocity.y > 0)):
		direction = -1
	else:
		direction = 1
	
	# var rot_speed = velocity.length()/100
	var rot_speed = 0.1
	$MouthPivot.rotation = lerp_angle($MouthPivot.rotation, move_rot, rot_speed)
	$MouthPivot/Mouth/Sprites.rotation = -$MouthPivot.rotation

func _respawn_change():
	respawn.get_node("Sprite").texture = respawn.sprite1


func _entered_hurtbox(body):
	position = respawn.position
