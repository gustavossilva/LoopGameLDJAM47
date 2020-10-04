extends "res://Dialogs/Dialog.gd"

func _ready():
	set_process(false)
	
func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		self.visible = false
		hide()
		animationPlayer.play("Idle")
		set_process(false)
		GameManager.isInteracting = false
