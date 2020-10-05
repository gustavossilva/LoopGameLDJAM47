extends Node2D

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = false


func _on_Area2D_body_entered(_body):
	var _load = get_tree().change_scene("res://BossRoom.tscn")
