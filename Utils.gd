extends Node

func instance_ui_scene_on_main(scene):
	var main = get_tree().current_scene
	var instance = scene.instance()
	main.add_child(instance)
	instance.rect_global_position = Vector2.ZERO
	
func instance_scene_on_main(scene, position):
	var main = get_tree().current_scene
	var instance = scene.instance()
	main.add_child(instance)
	instance.global_position = position
