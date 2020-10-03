extends KinematicBody2D


var velocity = Vector2.ZERO

const MAX_SPEED = 100
const ACCELERATION = 200
const FRICTION = 100

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if(input_vector != Vector2.ZERO):
		animationPlayer.play("RunRight")
		velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCELERATION * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = input_vector.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
