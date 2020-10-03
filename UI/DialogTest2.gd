extends "res://UI/Dialog.gd"

func _ready():
	visible = false
	set_process(false)

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		hide()

func _on_DialogTest_hide():
	self.visible = true
	set_process(true)
	animationPlayer.play("Writer")
