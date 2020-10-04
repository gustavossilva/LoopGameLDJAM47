extends Node2D

onready var animationPlayer = $AnimationPlayer

func attack():
	animationPlayer.play("Rotate")
