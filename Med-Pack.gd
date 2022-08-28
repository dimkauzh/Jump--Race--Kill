extends Area2D



func _on_MedPack_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if Global.hearts < Global.hearts_max:
		Global.add_hearts()
		queue_free()


func _physics_process(_delta):
	$AnimatedSprite.play("default")
