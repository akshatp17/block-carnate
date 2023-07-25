extends ColorRect


func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play('transition_anim')
	await $AnimationPlayer.is_playing()
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("transition_anim")
