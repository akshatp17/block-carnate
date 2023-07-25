extends Area2D

@onready var door = $Door
@onready var animation_player = $AnimationPlayer
@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var open_sfx = $open
@onready var close_sfx = $close

var lock = true
var end = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Door Opening sprite
func door_open():
	if not lock:
		animation_player.play("Open")
		open_sfx.play()
		
func door_close():
	if end:
		animation_player.play_backwards("Open")
		close_sfx.play()
		end = false
	

#Door opened and now player ready to go
func _on_body_entered_level_end(body):
	if not lock:
		if body.name == "Player":
			if get_tree().get_current_scene().get_name() != "Level_10":
				SceneTransition.change_scene_to_file("res://Scenes/Levels/level_" + str ( ( get_tree().get_current_scene().get_name() ).to_int() + 1 ) + ".tscn")
			else:
				SceneTransition.change_scene_to_file("res://Scenes/finish.tscn")


func _on_level_1_level_1_complete():
	lock = false
	end = true
	door_open()


func _on_level_1_level_1_buttonrelease():
	lock = true
	door_close()


func _on_level_2_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_2_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_3_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_3_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_4_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_4_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_5_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_5_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_6_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_6_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_7_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_7_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_8_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_8_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_9_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_9_level_1_complete():
	_on_level_1_level_1_complete()


func _on_level_10_level_1_buttonrelease():
	_on_level_1_level_1_buttonrelease()


func _on_level_10_level_1_complete():
	_on_level_1_level_1_complete()
