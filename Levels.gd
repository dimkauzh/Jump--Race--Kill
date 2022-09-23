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
	
func _physics_process(delta):
	on_off_ladder_checker()

func _on_ladder_checker_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing == true:
				body.climbing = false
				off_off_ladder_checker()
				body.walk_animation()



func _on_Portal_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	$Player.position.x = 3528
	$Player.position.y = -738

func on_off_ladder_checker():
	if Input.is_action_pressed("ui_down"): 
		for child in $Off_Ladder_Block.get_children(): child.set_deferred("disabled", true)
		#get_node("Off_Ladder_Block/CollisionShape2D").set_deferred("disabled", true)
		#get_node("Off_Ladder_Block/CollisionShape2D2").set_deferred("disabled", true)
	
func off_off_ladder_checker():
	for child in $Off_Ladder_Block.get_children(): child.set_deferred("disabled", false)
		
	#$Off_Ladder_Block/CollisionShape2D.set_deferred("disabled", false)
	#$Off_Ladder_Block/CollisionShape2D2.set_deferred("disabled", false)
	#$Off_Ladder_Block/CollisionShape2D3.set_deferred("disabled", false)
	#$Off_Ladder_Block/CollisionShape2D4.set_deferred("disabled", false)
	#$Off_Ladder_Block/CollisionShape2D5.set_deferred("disabled", false)

#func _on_Area2D_body_entered(body):
#	if Input.is_action_pressed("ui_down"): $StaticBody2D/CollisionShape2D.set_deferred("disabled", true)



#func _on_Area2D_body_exited(body):
#	$StaticBody2D/CollisionShape2D.set_deferred("disabled", false)


#func _on_above_ladder_checker_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
#	$StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
