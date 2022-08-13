extends KinematicBody2D

const speed = 180
var jump_speed = -400
var gravity = 1200
var jumping = false

func _physics_process(delta):
	var vel = Vector2.ZERO
	
	$AnimatedSprite.play("walking")
	
	if Input.is_action_pressed("ui_right"):
		vel.x = speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = vel.x > 0
		
	if Input.is_action_pressed("ui_left"):
		vel.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = vel.x > 0
		
	if Input.is_action_just_pressed("jump"):
		jumping = true
		$AnimatedSprite.play("jump")
		
	vel.y += gravity * delta
	
	if jumping and is_on_floor():
		jumping = false
	vel = move_and_slide(vel, Vector2(0, -1))
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 0
	
	vel.y = vel.y + 75
	move_and_slide(vel)
