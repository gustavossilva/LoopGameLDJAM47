extends Control

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _on_Button_pressed():
	var _changescene = get_tree().change_scene("res://FirstRoom.tscn")

func _on_Button2_pressed():
	get_tree().quit()


func _on_ToolButton_pressed():
	var _changescene = get_tree().change_scene("res://FirstRoom.tscn")


func _on_ToolButton2_pressed():
	get_tree().quit()


func _on_ToolButton3_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
