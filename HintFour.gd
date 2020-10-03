extends "res://Dialogs/Dialog.gd"

func _ready():
	visible = false
	set_process(false)

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		GameManager.isInteracting = false
		self.visible = false
		hide()
		animationPlayer.play("Idle")
		set_process(false)


func _on_HintThree_hide():
	self.visible = true
	set_process(true)
	animationPlayer.play("Write")
