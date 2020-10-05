extends Node2D

onready var animatedSprite = $AnimatedSprite

func attack():
	animatedSprite.play("Attack")
	
func idle():
	animatedSprite.play("Idle")


func _on_AnimatedSprite_animation_finished():
	if animatedSprite.animation == "Attack":
		animatedSprite.play("Idle")


func die():
	animatedSprite.play("Die")
