extends Node2D

onready var initGameTimer = $InitGameTimer
onready var fireAttackAnimation = $YSort/FireAttack/FireAttackAnimation

func _ready():
	VisualServer.set_default_clear_color(Color.black)


func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://FinalRoom.tscn")


func _on_Boss1_hide():
	initGameTimer.start()


func _on_InitGameTimer_timeout():
	fireAttackAnimation.play("FireWave")
