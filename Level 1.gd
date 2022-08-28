extends Node2D

var ladder_speed = 50
var jump_speed = -800
var gravity = 1200
var player = Global.player
var moving = [Input.is_action_pressed("ui_right"),
Input.is_action_pressed("ui_left"),
Input.is_action_pressed("jump")]


func _on_Area2D_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	Global.lose_hearts()
	Global.hearts_scenes_level()
	
func _on_ladder_checker_body_entered(body):
	if body.is_in_group("Climber"):
		if body.climbing == false:
			body.climbing = true
	

func _on_ladder_checker_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing == true:
				body.climbing = false
				body.walk_animation()



func _on_Portal_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	$Player.position.x = 3528
	$Player.position.y = -738
