extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var main = get_tree().current_scene
		var instance = DialogLoader.DialogTest2.instance()
		main.add_child(instance)
		instance.rect_global_position = Vector2.ZERO
		queue_free()
