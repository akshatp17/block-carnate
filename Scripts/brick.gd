extends CharacterBody2D

@onready var gravity_scene = preload("res://Scenes/gravity.tscn")
@onready var appear_sfx = $appear_sfx

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_area = false

func _ready():
	appear_sfx.play()
	
	var cur_level = get_tree().get_current_scene().get_name().to_int()
	if cur_level == 7:
		if (position.x > 245 and position.x < 305) and (position.y < 349 and position.y > 82):
			gravity_area = true
	elif cur_level == 8:
		if ( (position.x > 503 and position.x < 538) or (position.x > 922 and position.x < 1080) ) and (position.y < 538 and position.y > 56):
			gravity_area = true
		
func _physics_process(delta):
	
	if not is_on_floor() and not gravity_area:
		velocity.y += gravity * delta
	
	if gravity_area:
		velocity.y -= gravity * delta
	
	move_and_slide()
	
func change_gravity():
	gravity_area = true
