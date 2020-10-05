extends CanvasLayer


onready var boss1 = $Boss1
onready var bossCrystalBreak = $BossCrystalBreak
onready var bossTired = $BossTired
onready var bossDeath = $BossDeath


func _on_Timer_timeout():
	boss1.show_dialog()

func crystal_break():
	bossCrystalBreak.show_dialog()
	
func tired():
	bossTired.show_dialog()

func death():
	bossDeath.show_dialog()
