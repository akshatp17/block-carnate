extends Node2D

@onready var bgm = $BGM
@onready var menu = $Menu

var bgm_music = true
var menu_music = true

var current_lvl
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_lvl = get_tree().get_current_scene().get_name()
	
	if current_lvl in ["Home","Credits"]:
		if menu_music:
			menu.play()
			bgm.stop()
			menu_music = false
			bgm_music = true
			pass
	
	elif current_lvl in ["GameOver","Finish"]:
		bgm.stop()
		menu.stop()
		menu_music = true
		bgm_music = true
	
	else:
		if bgm_music:
			bgm.play()
			menu.stop()
			bgm_music = false
			menu_music = true
