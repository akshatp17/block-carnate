extends CharacterBody2D

signal death
signal jump_trampoline
signal level_info
signal call_gameoverscreen

@onready var animsprite_2d = $Sprite2D
@onready var timer
@onready var jump_sfx = $Jump
@onready var death_sfx = $Death
@onready var counter = $Counter
@onready var label = $Label


const SPEED = 200.0

var JUMP_VELOCITY = -425.0
var wait_time = 3.5
var initial_pos
var death_pos
var current_level
var camera_lvl10

var jump_nerf = false
var movement = true
var complete_death = false
var brick_stop = false
var water_timer = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	
	current_level = ( get_tree().get_current_scene().get_name() ).to_int()
	
	initial_pos = get_position()
	jump_nerf = false
	movement = true
	complete_death = false
	
	if current_level in [3,4,5,6,7,8,9,10]:
		timer = $"../Water/Timer"
		timer.set_wait_time(wait_time)
		
	if current_level == 10:
		camera_lvl10 = $"../Camera2D_lvl10"
		camera_reset()


func _physics_process(delta):
	
	if water_timer:
		label.set_text( str(int (timer.get_time_left() ) ) )
	
	if jump_nerf:
		JUMP_VELOCITY = -350.0
	else:
		JUMP_VELOCITY = -425.0
	
	#If player dies completely, then scene change
	if complete_death:
		if not animsprite_2d.is_playing():
			emit_signal("call_gameoverscreen")

			SceneTransition.change_scene_to_file("res://Scenes/game_over.tscn")
			queue_free()
	
	#Complete loop of movement, it stops when the player dies completly
	if movement:

		if not is_on_floor():
			velocity.y += gravity * delta
	
		var direction = Input.get_axis("move_left", "move_right")
		
		#Jumping
		if Input.is_action_just_pressed("move_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sfx.play()
		
		#Movement
		if direction:
			velocity.x = direction * SPEED
		
			#Left Side Animation
			if Input.is_action_pressed("move_left"):
				#Pushing the Wall
				if is_on_wall() and is_on_floor():
					animsprite_2d.set_flip_h(true)
					animsprite_2d.play("push")
				#Not Pushing
				else:
					animsprite_2d.set_flip_h(true)
					animsprite_2d.play("run")
			#Right Side Animation
			elif Input.is_action_pressed("move_right"):
				#Pushing the Wall
				if is_on_wall() and is_on_floor():
					animsprite_2d.set_flip_h(false)
					animsprite_2d.play("push")
				#Not Pushing
				else:
					animsprite_2d.set_flip_h(false)
					animsprite_2d.play("run")
		#Idle position
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animsprite_2d.play("idle")
	
		move_and_slide()

func camera_reset():
	camera_lvl10.position.x = 585
	camera_lvl10.position.y = 253

#Death only Level 1
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if not brick_stop:
			on_death()
			if current_level == 10:
				camera_reset()
		else:
			death_pos = get_position()
			emit_signal("death",death_pos)
			
#Function to respawn and giving the position
func on_death():
	death_pos = get_position()
	set_position(initial_pos)
	emit_signal("death",death_pos)

#Death level 2
func _on_spike_body_entered(body):
	if body.name == "Player":
		if not brick_stop:
			on_death()
			if current_level == 10:
				camera_reset()
		else:
			death_pos = get_position()
			emit_signal("death",death_pos)


func _on_jump_pad_body_entered(body):
	velocity.y = -750
	move_and_slide()
	emit_signal("jump_trampoline")


func _on_water_body_entered(body):
	if body.name == "Player":
		jump_nerf = true
		timer.start()
		label.set_visible(true)
		water_timer = true
		


func _on_water_body_exited(body):
	if body.name == "Player":
		jump_nerf = false
		timer.stop()
		timer.set_wait_time(wait_time)
		label.set_visible(false)
		water_timer = false

#Player death from staying in water for 3 seconds
func _on_timer_timeout():
	
	if jump_nerf:
		movement = false
		timer.stop()
		label.set_visible(false)
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true

#All level signals for player death if block ends
func _on_level_1_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_2_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_3_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_4_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_5_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_6_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_7_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_8_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_9_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_level_10_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		death_sfx.play()
		complete_death = true


func _on_fake_door_body_entered(body):
	if body.name == "Player":
		set_position(Vector2(505,1325))
		camera_lvl10.set_position(Vector2(545, 1478))


func _on_b_1_body_entered(body):
	if body.name == "Player":
		set_position(Vector2(186,2344))
		camera_lvl10.set_position(Vector2(567, 2467))


func _on_b_2_body_entered(body):
	if body.name == "Player":
		set_position(Vector2(188,3689))
		camera_lvl10.set_position(Vector2(533, 3512))


func _on_fake_door_body_entered_lvl8(body):
	if body.name == "Player":
		set_position(Vector2(615, 139))
