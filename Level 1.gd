extends Node2D

var ladder_speed = 50
var jump_speed = -800
var gravity = 1200
var player = Global.player


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


#func _on_Resume_pressed():
#	get_tree().paused = false
#func _on_Restart_pressed():
#	get_tree().reload_current_scene()
#func _on_Exit_pressed():
#	get_tree().change_scene("res://Levels.tscn")
#	if Global.hearts == 0:
#		get_tree().change_scene("res://gameover.tscn")
#	else:
#		get_tree().change_scene("res://Level 1.tscn")
#func _on_ladder_checker_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	if body.is_in_group("Climber"):
#		if body.Climber == false:
#			body.Climber = true
	#Input.action_release("jump")
	#if Input.is_action_pressed("ui_up"):
	#	Global.player.vel.y += ladder_speed
	#if Input.is_action_pressed("ui_down"):
	#	Global.player.vel.y -= ladder_speed
	#Global.player.moveandslide()
#func _on_ladder_checker_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
#	if body.is_in_group("Climber"):
#		if body.Climber == true:
#			body.Climber = false
	#Global.player.gravity = gravity
	#Input.action_release("ui_down")
	#Input.action_release("ui_up")

