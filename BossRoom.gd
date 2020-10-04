extends Node2D

onready var initGameTimer = $InitGameTimer
onready var fireAttackAnimation = $YSort/FireAttack/FireAttackAnimation
onready var hiddenRoom1 = $Background/HiddenRoom1
onready var hiddenRoom2 = $Background/HiddenRoom2
onready var brokenWall = $Background/BrokenWall
onready var rightDestructableArea = $RightDestructableArea

func _ready():
	VisualServer.set_default_clear_color(Color.black)


func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://FinalRoom.tscn")


func _on_Boss1_hide():
	initGameTimer.start()


func _on_InitGameTimer_timeout():
	fireAttackAnimation.play("FireWave")


func _on_RightDestructableArea_body_entered(body):
	hiddenRoom1.visible = true
	hiddenRoom2.visible = true
	brokenWall.visible = false
	rightDestructableArea.queue_free()
	pass
