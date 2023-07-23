extends CharacterBody2D

@onready var gravity_scene = preload("res://Scenes/gravity.tscn")
@onready var appear_sfx = $appear_sfx

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_area = false

func _ready():
	appear_sfx.play()
	
	var cur_level = get_tree().get_current_scene().get_name().to_int()
	if cur_level in [7,8,9,10]:
		#gravity_scene.anti_gravity.connect(change_gravity())
		pass
		
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if gravity_area:
		velocity.y += gravity * delta
	
	move_and_slide()
	
func change_gravity():
	gravity_area = true
