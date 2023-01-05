extends CanvasLayer

var fading_stage = 1
var fading_queue = -1
var fading_time = 0
var fading_length = 2
var next_scene = ""
onready var _static = get_node("/root/Static")

func fade_to_white(scene):
	next_scene = scene
	fading_stage = 0

func _process(delta):
	if(Input.is_action_just_pressed("move_time")):
		_static.show_timer = !_static.show_timer
		$Time.text = ""
		if(_static.show_timer):
			_static.levels = _static.og.duplicate(true)
			print(_static.og)
			fade_to_white("res://Map.tscn")
			_static.time_offset = Time.get_ticks_msec()
	if(_static.show_timer):
		var elapsed = (Time.get_ticks_msec()-_static.time_offset)/1000
		var minutes = elapsed / 60
		var seconds = elapsed % 60
		var str_elapsed = "%02d : %02d" % [minutes, seconds]
		$Time.text = str_elapsed
	if(fading_stage == 0):
		fading_time += delta
		$WhiteWipe.modulate = Color(1, 1, 1, lerp(0, 1, fading_time/fading_length))
		if(fading_time >= fading_length):
			fading_time = 0
			fading_stage = -1
			get_tree().change_scene(next_scene)
	elif(fading_stage == 1):
		fading_time += delta
		$WhiteWipe.modulate = Color(1, 1, 1, lerp(1, 0, fading_time/fading_length))
		if(fading_time >= fading_length):
			fading_time = 0
			fading_stage = -1
