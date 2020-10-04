extends KinematicBody2D

enum {
	MOVE,
	ATTACK,
	CHARGE_ATTACK
}

var velocity = Vector2.ZERO

export(int) var MAX_SPEED = 75
const ACCELERATION = 500
const FRICTION = 1000

export(int) var MAX_SPEED_ATTACKING = 40

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var footParticle = $FootParticle2D
onready var lightSprite = $Light

var state = MOVE

var timePressingAttack = 0
export(float) var timeToChargeAttack = 1.5

func _ready():
	animationTree.active = true

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_home"):
		GameManager.isDead = true
		return
	if GameManager.isInteracting:
		animationState.travel("Idle")
		return
	if GameManager.isDead:
		footParticle.emitting = false
		velocity = Vector2.ZERO
		animationState.travel("Die")
		return
	match state:
		MOVE:
			move(delta)
		ATTACK:
			attack(delta)
		CHARGE_ATTACK:
			charge_attack(delta)

func move(delta):
	var max_speed = MAX_SPEED_ATTACKING if state == CHARGE_ATTACK else MAX_SPEED 
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if(input_vector != Vector2.ZERO):
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		if state != CHARGE_ATTACK:
			animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * max_speed, ACCELERATION * delta)
		footParticle.emitting = true
	else:
		if state != CHARGE_ATTACK:
			animationState.travel("Idle")
		footParticle.emitting = false
		velocity = input_vector.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("attack") && state != CHARGE_ATTACK && state != ATTACK:
		timePressingAttack += delta
		var moduleAlpha = int(timePressingAttack * 100)
		lightSprite.modulate.a8 = clamp(moduleAlpha, 0, 150)
		
	if Input.is_action_just_released("attack"):
		if(timePressingAttack >= timeToChargeAttack):
			print("charge attack")
			state = CHARGE_ATTACK
		else:
			state = ATTACK
		lightSprite.modulate.a = 0
		timePressingAttack = 0
		
func attack(delta):
	footParticle.emitting = false
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func charge_attack(delta):
	animationState.travel("ChargeAttack")
	move(delta)
	
func on_finished_attack():
	state = MOVE

func reset_game():
	GameManager.resetToGameLoop()
