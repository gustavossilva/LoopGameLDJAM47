extends "res://UI/Dialog.gd"


func _process(_delta):
	if Input.is_action_just_pressed("dialog_skip"):
		queue_free()
