extends KinematicBody2D

var speed: float = 100
var deathday: int
var distance: int
var sine: float = 1
var sine_slowdown: float = 5

export var disabled: bool = true
var player_owner: Node2D = null

export var player1_ref: NodePath
var player1: Node2D

var start_pos

export var player2_ref: NodePath
var player2: Node2D

func _ready():
	player1 = get_node(player1_ref)
	player2 = get_node(player2_ref)
	start_pos = global_position


func _process(delta):
	$Label.text = str(speed / 100)
	
	if(disabled || player_owner == null):
		return;
	
	var target: Node2D = null
	if(player1 == player_owner):
		target = player2
	
	if(player2 == player_owner):
		target = player1
	
	var last_pos = global_position
	if(test_move(transform, Vector2.ZERO)):
		global_position += (target.global_position - (global_position)).normalized() * speed * delta
		return
	move_and_slide((target.global_position - (global_position)).normalized() * speed)

func reset_position():
	global_position = start_pos
