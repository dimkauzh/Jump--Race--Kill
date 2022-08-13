extends KinematicBody2D

var speed = 300
var jump_speed = -800
var gravity = 1200
var vel = Vector2()
var jumping := false
var jumpforce = 50
var jump_ouch = 3000
var on_ladder := false

func get_input():
	vel.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('jump')
	
	
	if jump and is_on_floor():
		jumping = true
		vel.y = jump_speed
			
	elif right:
		vel.x += speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = vel.x < 0
	elif left:
		vel.x -= speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = vel.x < 0
	else:
		$AnimatedSprite.play("idle")
#		$AnimatedSprite.stop()
#		$AnimatedSprite.frame = 0
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
func _physics_process(delta):
	get_input()
	vel.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	vel = move_and_slide(vel, Vector2(0, -1))
	
func ouch(var pos_x):
	Global.lose_hearts()
	set_modulate("c82020")
	vel.y = jump_speed * 0.5
	$Timer.start()	
	if position.x < pos_x:
		vel.x = position.x - jump_ouch
				
	elif position.x > pos_x:
		vel.x = jump_ouch
		
	Input.action_release("ui_left")
	Input.action_release("ui_right")
	vel = move_and_slide(vel, Vector2(0, -1))


func _on_Timer_timeout():
	set_modulate("ffffff")
