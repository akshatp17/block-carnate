extends CanvasLayer

func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play('transition_in')
	$sfx.play()
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("transition_in")
	
