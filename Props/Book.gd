extends StaticBody2D

onready var bookAnimationPlayer = $Sprite/Book2/AnimationPlayer

func _on_Area2D_body_entered(body):
	print("oi")
	bookAnimationPlayer.play("Animate")


func _on_Area2D_body_exited(body):
	print("tchau")
	bookAnimationPlayer.play("Idle")
