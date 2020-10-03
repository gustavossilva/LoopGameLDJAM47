extends "res://UI/Dialog.gd"

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		hide()
