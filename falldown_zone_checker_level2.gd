extends Area2D



func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.lose_hearts()
	Global.hearts_scenes_level2()
