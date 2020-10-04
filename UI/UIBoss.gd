extends CanvasLayer


onready var boss1 = $Boss1

func _on_Timer_timeout():
	boss1.show_dialog()
