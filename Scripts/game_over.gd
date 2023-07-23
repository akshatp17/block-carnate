extends Control

func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
