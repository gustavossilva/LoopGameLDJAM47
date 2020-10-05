extends Node2D

onready var mirrorDialog = $CanvasLayer/AdventurerMirror
onready var animationPlayer = $AnimationPlayer

var canInteract = false

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _process(_delta):
	if Input.is_action_just_pressed("interact") && canInteract && !GameManager.isInteracting:
		GameManager.isInteracting = true
		mirrorDialog.show_dialog()

func _on_Area2D_body_entered(_body):
	canInteract = true


func _on_Area2D_body_exited(_body):
	canInteract = false


func _on_AdventurerMirror_hide():
	animationPlayer.play("Animate")


func go_to_gameover():
	var _load = get_tree().change_scene("res://GameOverRoom.tscn")
