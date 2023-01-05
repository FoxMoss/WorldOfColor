extends KinematicBody2D

export var speed: float
export var friction: float

var velocity_raw: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var respawn: Node2D

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
	

func _respawn_change():
	respawn.get_node("Sprite").texture = respawn.sprite1


func _entered_hurtbox(body):
	position = respawn.position
