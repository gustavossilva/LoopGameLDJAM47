extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		GameManager.reset_game()
		var _load = get_tree().change_scene("res://Menus/StartMenu.tscn")
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = false
