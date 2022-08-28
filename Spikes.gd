extends Area2D

func _physics_process(_delta):
	if Global.hearts == 0:
		Global.hearts_scenes_level()

func _on_Spikes_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	Global.lose_hearts()
	get_tree().reload_current_scene()
