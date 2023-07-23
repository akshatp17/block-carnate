extends Area2D
@onready var boing_sfx = $AudioStreamPlayer2D

func _process(delta):
	if boing_sfx.get_playback_position() > 1.525:
		boing_sfx.stop()

func _on_player_jump_trampoline():
	$AnimationPlayer.play("jump")
	boing_sfx.play()


func _on_player_jump_trampoline_1_LVL10():
	$AnimationPlayer.play("jump")
	boing_sfx.play()


func _on_player_jump_trampoline_2_LVL10():
	$AnimationPlayer.play("jump")
	boing_sfx.play()


func _on_player_jump_trampoline_4_LVL10():
	$AnimationPlayer.play("jump")
	boing_sfx.play()


func _on_player_jump_trampoline_5_LVL10():
	$AnimationPlayer.play("jump")
	boing_sfx.play()


func _on_player_jump_trampoline_6_LVL10():
	$AnimationPlayer.play("jump")
	boing_sfx.play()
