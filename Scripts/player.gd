extends CharacterBody2D

signal death
signal jump_trampoline

@onready var animsprite_2d = $Sprite2D
@onready var timer

const SPEED = 200.0

var JUMP_VELOCITY = -425.0
var wait_time = 3.0
var initial_pos
var death_pos

var jump_nerf = false
var movement = true
var complete_death = false
var brick_stop = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	initial_pos = get_position()
	jump_nerf = false
	movement = true
	complete_death = false
	
	if ( get_tree().get_current_scene().get_name() ).to_int() in [3,4,5,6,7,8,9,10]:
		timer = $"../Water/Timer"
		timer.set_wait_time(wait_time)

func _physics_process(delta):
	
	if jump_nerf:
		JUMP_VELOCITY = -350.0
	else:
		JUMP_VELOCITY = -425.0
	
	#If player dies completely, then scene change
	if complete_death:
		if not animsprite_2d.is_playing():
			get_tree().change_scene_to_file("res://Scenes/home.tscn")
	
	#Complete loop of movement, it stops when the player dies completly
	if movement:
		
		if not is_on_floor():
			velocity.y += gravity * delta
	
		var direction = Input.get_axis("move_left", "move_right")
		
		#Jumping
		if Input.is_action_just_pressed("move_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
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

#Death only Level 1
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if not brick_stop:
			on_death()
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


func _on_water_body_exited(body):
	if body.name == "Player":
		jump_nerf = false
		timer.stop()
		timer.set_wait_time(wait_time)

#Player death from staying in water for 3 seconds
func _on_timer_timeout():
	
	if jump_nerf:
		movement = false
		timer.stop()
		animsprite_2d.play("dead")
		complete_death = true

#All level signals for player death if block ends
func _on_level_1_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_2_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_3_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_4_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_5_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_6_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_7_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_8_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_9_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true


func _on_level_10_complete_death(brick_death):
	if brick_death == 0:
		brick_stop = true
	
	if brick_death == -1:
		movement = false
		animsprite_2d.play("dead")
		complete_death = true
