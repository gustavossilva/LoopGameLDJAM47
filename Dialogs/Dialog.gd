extends Control

export(float) var SPEED_UP = 2.5

onready var animationPlayer = $AnimationPlayer

func _process(_delta):
	if Input.is_action_pressed("dialog_speedup"):
		animationPlayer.playback_speed = SPEED_UP
	else:
		animationPlayer.playback_speed = 1

func show_dialog():
	self.visible = true
	animationPlayer.play("Write")
	set_process(true)
	GameManager.isInteracting = true
