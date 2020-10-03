extends StaticBody2D

onready var bookAnimationPlayer = $Sprite/Book2/AnimationPlayer

signal open_book()

var isColliding = false

func _process(_delta):
	if isColliding and not GameManager.isInteracting and Input.is_action_just_pressed("interact"):
		GameManager.isInteracting = true
		emit_signal("open_book")

func _on_Area2D_body_entered(_body):
	print("oi")
	bookAnimationPlayer.play("Animate")
	isColliding = true


func _on_Area2D_body_exited(_body):
	print("tchau")
	bookAnimationPlayer.play("Idle")
	isColliding = false
