extends Node2D

onready var initGameTimer = $InitGameTimer
onready var fireAttackAnimation = $YSort/FireAttack/FireAttackAnimation
onready var crystalAnimation = $YSort/Cryistals/CrystalAnimation
onready var hiddenRoom1 = $Background/HiddenRoom1
onready var hiddenRoom2 = $Background/HiddenRoom2
onready var brokenWall = $Background/BrokenWall
onready var rightDestructableArea = $RightDestructableArea
onready var rightDoorDestructable = $RightDoorDestructable
onready var bossSword1 = $BossSword
onready var bossSword2 = $BossSword2
onready var swordAttackTimer = $SwordAttackTimer
onready var uiboss = $UIBoss

var earthAttack = false
var swordAttack = false
var eyeAttack = false
var crystals = 4

func set_earth_attack():
	earthAttack = true

func set_sword_attack():
	earthAttack = false
	swordAttack = true
	bossSword1.visible = true
	bossSword2.visible = true
	crystalAnimation.play("Spawn")
	swordAttackTimer.start()

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _process(delta):
	if swordAttackTimer.time_left == 0 && crystals != 0 && swordAttack:
		swordAttack = false
		bossSword1.attack()
		bossSword2.attack()

func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://FinalRoom.tscn")


func _on_Boss1_hide():
	initGameTimer.start()


func _on_InitGameTimer_timeout():
	fireAttackAnimation.play("FireWave")


func _on_RightDestructableArea_area_entered(area):
	if earthAttack:
		hiddenRoom1.visible = true
		hiddenRoom2.visible = true
		brokenWall.visible = false
		rightDoorDestructable.queue_free()
		rightDestructableArea.queue_free()

func _on_Area2DCrystal_area_entered(area):
	crystals -= 1
	print(crystals)
	if crystals == 0:
		bossSword1.queue_free()
		bossSword2.queue_free()
		uiboss.crystal_break()
