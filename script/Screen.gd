extends CanvasLayer

var fading_stage = 1
var fading_queue = -1
var fading_time = 0
var fading_length = 2
var next_scene = ""

func fade_to_white(scene):
	next_scene = scene
	fading_stage = 0

func _process(delta):
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
