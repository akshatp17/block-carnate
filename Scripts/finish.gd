extends Control

@onready var victory_bg = $victory_bg

# Called when the node enters the scene tree for the first time.
func _ready():
	victory_bg.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	SceneTransition.change_scene_to_file("res://Scenes/home.tscn")
