extends Node2D

onready var light = $Light2D
onready var timer = $Timer

func _physics_process(delta):
	if timer.time_left == 0:
		light.energy = rand_range(0.8,1)
		timer.start()
