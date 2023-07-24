extends Area2D

@onready var camera_2d_lvl_10 = $"../Camera2D_lvl10"

var b1 = false
var b2 = false
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	set_modulate(100)
	if player.position.y < 1500:
		camera_2d_lvl_10.set_position(Vector2(525, 356))

	if player.position.y > 1500:
		camera_2d_lvl_10.set_position(Vector2(533, 4024))
		
