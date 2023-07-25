extends Node
var current_lvl
var prev_lvl

# Called when the node enters the scene tree for the first time.
func _ready():
	current_lvl = get_tree().get_current_scene().get_name()
	if current_lvl != "GameOver":
		prev_lvl = current_lvl
	else:
		current_lvl = prev_lvl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_current_scene().get_name() != current_lvl:
		_ready()
		
func give_cur_level(level):
	level = current_lvl
	return level
