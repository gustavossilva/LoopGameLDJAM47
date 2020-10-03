extends Node

var isInteracting = false setget set_interacting
var isDead = false setget set_isDead
var loopTimes = 0

func set_interacting(value):
	isInteracting = value
	
func set_isDead(value):
	isDead = value

func resetToGameLoop():
	loopTimes += 1
	isDead = false
	#insert reset code
