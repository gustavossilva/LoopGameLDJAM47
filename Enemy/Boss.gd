extends Node2D

onready var animatedSprite = $AnimatedSprite
onready var collision = $AnimatedSprite/Hurtbox/HurtboxCollision

func attack():
	animatedSprite.play("Attack")
	
func idle():
	animatedSprite.play("Idle")


func _on_AnimatedSprite_animation_finished():
	if animatedSprite.animation == "Attack":
		animatedSprite.play("Idle")


func die():
	animatedSprite.position.y = -100
	animatedSprite.play("Die")
	collision.set_deferred("disabled", true)
