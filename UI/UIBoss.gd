extends CanvasLayer


onready var boss1 = $Boss1
onready var bossCrystalBreak = $BossCrystalBreak


func _on_Timer_timeout():
	boss1.show_dialog()

func crystal_break():
	bossCrystalBreak.show_dialog()
