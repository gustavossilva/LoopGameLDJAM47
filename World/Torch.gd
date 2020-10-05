extends Node2D

onready var farLight = $FarLight
onready var mediumLight = $MediumLight
onready var timer = $Timer

func _physics_process(_delta):
	if timer.time_left == 0:
		farLight.energy = rand_range(0.9,1.1)
		mediumLight.energy = rand_range(1.0,1.2)
		timer.start()
