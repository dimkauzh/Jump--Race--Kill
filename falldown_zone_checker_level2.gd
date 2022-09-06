extends Area2D



func _on_Area2D_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	Global.lose_hearts()
	Global.hearts_scenes_level()
