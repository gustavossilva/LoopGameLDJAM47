extends CanvasLayer

onready var bookDialog = $HintOne

func _on_Book_open_book():
	bookDialog.play_dialog()
