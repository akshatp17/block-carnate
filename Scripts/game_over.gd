extends Control

var current_level
var previous_scene
@onready var panel = $Panel

func _ready():
	pass
	
func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_try_again_button_pressed():
	current_level = GloabScene.give_cur_level(current_level)
	get_tree().change_scene_to_file("res://Scenes/Levels/" + current_level.to_lower() + ".tscn")
