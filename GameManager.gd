extends Node

enum deathTypes {
	NONE, FIRE, SWORD, EARTH,  EYE
}

var isInteracting = false setget set_interacting
var isDead = false setget set_isDead
var loopTimes = 0
var actualDeathType = deathTypes.NONE
var firedeath = 0
var sworddeath = 0
var earthdeath = 0
var eyedeath = 0

func set_fire_death():
	firedeath += 1
	actualDeathType = deathTypes.FIRE

func set_sword_death():
	sworddeath += 1
	actualDeathType = deathTypes.SWORD

func set_earth_death():
	earthdeath += 1
	actualDeathType = deathTypes.EARTH

func set_eye_death():
	eyedeath += 1
	actualDeathType = deathTypes.EYE

func set_interacting(value):
	isInteracting = value
	
func set_isDead(value):
	isDead = value

func resetToGameLoop():
	loopTimes += 1
	isDead = false
	#insert reset code
	get_tree().change_scene("res://FirstRoom.tscn")
	
