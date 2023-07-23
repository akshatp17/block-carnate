extends Control

var current_level
@onready var panel = $Panel

func _ready():
	current_level = get_tree().get_current_scene().get_name()
	panel.set_position(Vector2(128,207))
	
func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/" + current_level.to_lower() + ".tscn")
