extends KinematicBody2D

enum {
	MOVE,
	ATTACK
}

var velocity = Vector2.ZERO

export(int) var MAX_SPEED = 75
const ACCELERATION = 500
const FRICTION = 1000

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var state = MOVE

var timePressingAttack = 0
export(float) var timeToChargeAttack = 1.5

func _ready():
	animationTree.active = true

func _physics_process(delta):
	if GameManager.isInteracting:
		animationState.travel("Idle")
		return
	match state:
		MOVE:
			move(delta)
		ATTACK:
			attack(delta)

func move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if(input_vector != Vector2.ZERO):
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = input_vector.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("attack"):
		timePressingAttack += delta
		
	if Input.is_action_just_released("attack"):
		if(timePressingAttack >= timeToChargeAttack):
			print("charge attack")
			state = ATTACK
		else:
			state = ATTACK
		timePressingAttack = 0
		
func attack(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func on_finished_attack():
	state = MOVE

