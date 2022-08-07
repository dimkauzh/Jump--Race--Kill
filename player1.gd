extends KinematicBody2D

var speed = 300
var jump_speed = -800
var gravity = 1200
var change = Vector2()
var vel = Vector2()
var jumping = false

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

