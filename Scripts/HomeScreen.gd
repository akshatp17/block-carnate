extends Control

@onready var start_door = $StartDoor
@onready var credit_door = $CreditDoor
@onready var player = $Player

var player_run = false
var start = false
var credit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_run:
		if start:
			player.position.x -= 150 * delta
			if player.position.x <= 287:
				get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
				
		elif credit:
			player.position.x += 150 * delta
			if player.position.x >= 877:
				get_tree().change_scene_to_file("res://Scenes/credits.tscn")

#Start Button Pressed :
func _on_start_button_pressed():
	start_door.play("open")
	player.set_flip_h(true)
	player.play("Run")
	player_run = true
	start = true


func _on_credit_button_pressed():
	credit_door.play("open")
	player.set_flip_h(false)
	player.play("Run")
	player_run = true
	credit = true
