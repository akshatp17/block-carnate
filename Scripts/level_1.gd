extends Node2D

signal level1_complete
signal level1_buttonrelease
signal gravity_change
signal complete_death

@onready var brick = preload("res://Scenes/brick.tscn")
@onready var button = preload("res://Scenes/buttons.tscn")
@onready var gameover_screen = load("res://Scenes/game_over.tscn")
@onready var player = $Player

var button_counter = 0
var button_total = 1
var brick_total = 0
var brick_left = 0

var button_list = [1,1,1,1,2,1,3,3,3,3]
var brick_list = [5,6,5,4,3,3,5,4,5,6]

var release_lock = false

func _ready():
	var cur_level = get_tree().get_current_scene().get_name().to_int()
	
	for i in range(1,11):
		if cur_level == i:
			button_total = button_list[i-1]
			brick_total = brick_list[i-1]
			brick_left = brick_list[i-1]
			break
			
	$CanvasLayer/Info/button_done.set_text(str(button_counter) + "/" + str(button_total))
	$CanvasLayer/Info/block_left.set_text(str(brick_left) + "/" + str(brick_total))

#When Player Dies, the brick will be spawned at the position
func _on_player_death(player_death_pos):
		brick_left -= 1
		emit_signal("complete_death",brick_left)
		
		if brick_left > -1:
			#Instancing the brick
			var brick_instance = brick.instantiate()
			
			#Setting the position of the brick
			brick_instance.position.x = player_death_pos.x
			brick_instance.position.y = player_death_pos.y
			
			#Blitting Brick in the level
			call_deferred("add_child",brick_instance)
			
			$CanvasLayer/Info/block_left.set_text(str(brick_left)  + "/" + str(brick_total))
	

func _on_buttons_button_pressedd():
	button_counter += 1
	if button_counter > button_total:
		button_counter = button_total
	$CanvasLayer/Info/button_done.set_text(str(button_counter) + "/" + str(button_total))
	if button_counter == button_total:
		release_lock = true
		emit_signal("level1_complete")

func _on_buttons_button_released():
	button_counter -= 1
	if button_counter < 0:
		button_counter = 0
	$CanvasLayer/Info/button_done.set_text(str(button_counter) + "/" + str(button_total))
	if release_lock:
		emit_signal("level1_buttonrelease")
		release_lock = false


#Level 6 Teleport
func _on_teleport_body_entered(body):
	var x_pos = body.position.x
	body.set_position(Vector2(x_pos,-50))


func _on_player_call_gameoverscreen():
	#var gameover_instance = gameover_screen.instantiate()
	#gameover_instance.set_position(Vector2(0,0))
	#call_deferred("add_child",gameover_instance)
	pass


func _on_teleporter_body_entered(body):
	pass # Replace with function body.


func _on_teleporter_body_entered_lvl10(body):
	var x_pos = body.position.x
	body.set_position(Vector2(810,2275))
