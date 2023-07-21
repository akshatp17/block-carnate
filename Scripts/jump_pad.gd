extends Area2D

func _on_player_jump_trampoline():
	$AnimationPlayer.play("jump")
