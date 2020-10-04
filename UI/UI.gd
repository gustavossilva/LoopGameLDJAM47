extends CanvasLayer

onready var bookDialog = $HintOne
onready var adventurerFirst = $AdventurerFirst
onready var adventurerDeathFire1 = $AdventurerDeathFire1
onready var adventurerDeathFire2 = $AdventurerDeathFire2
onready var adventurerSword1 = $AdventurerSword1
onready var adventurerSword2 = $AdventurerSword2
onready var adventurerEye1 = $AdventurerEye1
onready var adventurerEye2 = $AdventurerEye2
onready var adventurerEarthshake1 = $AdventurerEarthshake1
onready var adventurerEarthshake2 = $AdventurerEarthshake2
onready var timer = $Timer

var showDialog = true

func _process(delta):
	if GameManager.loopTimes == 0 and showDialog and timer.time_left == 0:
		adventurerFirst.show_dialog()
		showDialog = false
	if GameManager.loopTimes != 0 and showDialog and timer.time_left == 0:
		match(GameManager.actualDeathType):
			GameManager.deathTypes.FIRE:
				if (GameManager.firedeath <= 1):
					adventurerDeathFire1.show_dialog()
				else:
					adventurerDeathFire2.show_dialog()
			GameManager.deathTypes.EARTH:
				if (GameManager.earthdeath <= 1):
					adventurerEarthshake1.show_dialog()
				else:
					adventurerEarthshake2.show_dialog()
			GameManager.deathTypes.SWORD:
				if (GameManager.sworddeath <= 1):
					adventurerSword1.show_dialog()
				else:
					adventurerSword2.show_dialog()
			GameManager.deathTypes.EYE:
				if (GameManager.eyedeath <= 1):
					adventurerEye1.show_dialog()
				else:
					adventurerEye2.show_dialog()
		showDialog = false

func _on_Book_open_book():
	bookDialog.play_dialog()
