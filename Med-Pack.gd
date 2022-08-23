extends Area2D



func _on_MedPack_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if Global.hearts < Global.hearts_max:
		Global.add_hearts()
		queue_free()


func _physics_process(delta):
	$AnimatedSprite.play("default")
