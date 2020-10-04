extends Node2D

onready var mirrorDialog = $CanvasLayer/AdventurerMirror

var canInteract = false

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _process(delta):
	if Input.is_action_just_pressed("interact") && canInteract && !GameManager.isInteracting:
		GameManager.isInteracting = true
		mirrorDialog.show_dialog()

func _on_Area2D_body_entered(body):
	canInteract = true


func _on_Area2D_body_exited(body):
	canInteract = false
