extends Node2D

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.lose_hearts()
	get_tree().change_scene("res://Level 1.tscn")
