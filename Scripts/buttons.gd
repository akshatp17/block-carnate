extends Area2D

signal button_released
signal button_pressedd

@onready var button_normal = $button_normal
@onready var button_pressed = $button_pressed
@onready var button_pressed_sfx = $ButtonPressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	button_normal.set_visible(false)
	button_pressed.set_visible(true)
	emit_signal("button_pressedd")
	button_pressed_sfx.play()

func _on_body_exited(body):
	button_normal.set_visible(true)
	button_pressed.set_visible(false)
	emit_signal("button_released")
		
