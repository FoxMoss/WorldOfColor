extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var player1_ref: NodePath
var player1: Node2D
var player1_score: float = 0.5

export var player2_ref: NodePath
var player2: Node2D
var player2_score: float = 0.5

func _ready():
	player1 = get_node(player1_ref)
	player2 = get_node(player2_ref)


func call_loss(player_name):
	player1.reset_position()
	player2.reset_position()
	$MultiplayerBall.reset_position()
	$MultiplayerBall.speed = 100
	$MultiplayerBall.disabled = true
	$MultiplayerBall.player_owner = null
	
	if(player_name == "player1"):
		player2_score += 100/4
	if(player_name == "player2"):
		player1_score += 100/4
	
	if(player1_score >= 100 || player2_score >= 100):
		player1.global_position = $Management/Player1Tp.global_position
		player2.global_position = $Management/Player2Tp.global_position
		var player_color = ""
		if(player1_score > player2_score):
			player_color = "Green"
		else:
			player_color = "Purple"
		$Management/Winner.text = player_color + " won!"
	
	$CameraFollower/Camera2D/Screen/Player1Bar.value = player1_score
	$CameraFollower/Camera2D/Screen/Player2Bar.value = 100 - player2_score
