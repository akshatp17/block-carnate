extends CharacterBody2D

signal death
signal jump_trampoline

@onready var animsprite_2d = $Sprite2D

const SPEED = 200.0

var JUMP_VELOCITY = -425.0
var initial_pos
var death_pos

var jump_nerf = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	initial_pos = get_position()

func _physics_process(delta):
	
	if jump_nerf:
		JUMP_VELOCITY = -350.0
	else:
		JUMP_VELOCITY = -425.0
	
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

#Death
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		on_death()
	
#Function to respawn and giving the position
func on_death():
	death_pos = get_position()
	set_position(initial_pos)
	emit_signal("death",death_pos)


func _on_spike_body_entered(body):
	if body.name == "Player":
		on_death()


func _on_jump_pad_body_entered(body):
	velocity.y = -750
	move_and_slide()
	emit_signal("jump_trampoline")


func _on_water_body_entered(body):
	if body.name == "Player":
		jump_nerf = true


func _on_water_body_exited(body):
	if body.name == "Player":
		jump_nerf = false