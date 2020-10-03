extends Control

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _on_Button_pressed():
	var _changescene = get_tree().change_scene("res://FirstRoom.tscn")

func _on_Button2_pressed():
	get_tree().quit()
