extends Node2D


func shake_on_spawn():
	Events.emit_signal("add_screenshake", 0.4, 0.5)
