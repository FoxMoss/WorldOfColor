extends Node

var levels
var og = [
	{
		"completed_req": 0,
		"name": "Level Pink:\nIntro",
		"color": "e53d63",
		"path": "res://Tutorial.tscn",
		"completed": false,
		"invisible": false
	},
	{
		"completed_req": 1,
		"completed": false,
		"invisible": true
	},
	{
		"completed_req": 1,
		"name": "Level Purple:\nKeys",
		"color": "975cac",
		"path": "res://Level1.tscn",
		"completed": false,
		"invisible": false
	},
	{
		"completed_req": 1,
		"name": "Level Yellow:\nShields",
		"color": "e6c369",
		"path": "res://Level2.tscn",
		"completed": false,
		"invisible": false
	},
	{
		"completed_req": 1,
		"name": "Level Peach:\nBullet Waves",
		"color": "f8a095",
		"path": "res://Level3.tscn",
		"completed": false,
		"invisible": false
	},
	{
		"completed_req": 1,
		"name": "Level Sky:\nFollower",
		"color": "93aae2",
		"path": "res://Level4.tscn",
		"completed": false,
		"invisible": false
	},
	{
		"completed_req": 5,
		"completed": false,
		"invisible": true
	},
	{
		"completed_req": 5,
		"name": "Level Rainbow:\nThe End",
		"color": "ffffff",
		"image": "res://textures/wall/4.png",
		"path": "res://Level5.tscn",
		"completed": false,
		"invisible": false
	}
]

var returntocolor_levels
var returntocolor_og = [
	{
		"completed_req": 0,
		"name": "I have no mouth.",
		"color": "93aae2",
		"path": "res://returntocolor/Level1.tscn",
		"completed": false,
		"invisible": false
	},
	
	{
		"completed_req": 0,
		"name": "I must scream.",
		"color": "93aae2",
		"path": "res://returntocolor/Multiplayer.tscn",
		"completed": false,
		"invisible": false
	},
]

var show_timer = false
var time_offset = 0

func _ready():
	levels = og.duplicate(true)
	returntocolor_levels = returntocolor_og.duplicate()
