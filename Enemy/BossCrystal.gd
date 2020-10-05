extends Node2D


onready var animationPlayer = $AnimationPlayer

func _on_Area2DCrystal_area_entered(_area):
	animationPlayer.play("Broken")
