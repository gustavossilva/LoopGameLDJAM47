extends "res://UI/Dialog.gd"

func _process(_delta):
	if Input.is_action_just_pressed("dialog_skip"):
		Utils.instance_ui_scene_on_main(DialogLoader.DialogTest2)
		queue_free()
