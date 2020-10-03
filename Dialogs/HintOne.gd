extends "res://Dialogs/Dialog.gd"

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		hide()
		self.visible = false
		animationPlayer.play("Idle")

func play_dialog():
	self.visible = true
	animationPlayer.play("Write")
