extends "res://Dialogs/Dialog.gd"

func _ready():
	visible = false
	set_process(false)

func _process(_delta):
	if self.visible and Input.is_action_just_pressed("dialog_skip"):
		self.visible = false
		hide()
		animationPlayer.play("Idle")
		set_process(false)


func _on_HintTwo_hide():
	pass
	#self.visible = true
	#set_process(true)
	#animationPlayer.play("Write")


func _on_HintOne_hide():
	self.visible = true
	set_process(true)
	animationPlayer.play("Write")
