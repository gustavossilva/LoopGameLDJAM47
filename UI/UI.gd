extends CanvasLayer

onready var dialogTest = $DialogTest

func _on_Book_open_book():
	dialogTest.play_dialog()
	
