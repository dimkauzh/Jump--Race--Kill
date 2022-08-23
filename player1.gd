extends KinematicBody2D


var speed = 300
var ladder_speed = 150
var jump_speed = -800
var gravity = 1200
var vel = Vector2()
var jumping := false
var jumpforce = 50
var jump_ouch = 3000
export var climbing = false
var anim_ladder := false
var jump_count = 0
var extrajumps = 1

func anim_ladder():
	if anim_ladder == true:
		$AnimatedSprite.play("ladder")
	if anim_ladder == false:
		get_input()
		$AnimatedSprite.play("walk")
func get_input():
	vel.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("ui_up")
	
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
		vel.x = 0
		$AnimatedSprite.play("idle")
		$AnimatedSprite.stop()
#		$AnimatedSprite.frame = 0
	if not is_on_floor():
		$AnimatedSprite.play("jump")

func _ready():
	Global.player = self

func ladder_animation():
	$AnimatedSprite.play("ladder")

func walk_animation():
	$AnimatedSprite.play("walk")
	get_input()

func _physics_process(delta):
	anim_ladder()
	if jumping and is_on_floor():
		jumping = false
	if climbing == false:
		vel.y += gravity * delta
		get_input()
		anim_ladder = false
	elif climbing == true:
		vel.y = 0
		vel.x = 0
		anim_ladder = true
		if Input.is_action_pressed("ui_up"):
			vel.y -= speed
		elif Input.is_action_pressed("ui_down"):
			vel.y += speed
		elif Input.is_action_pressed('ui_right'):
			vel.x += ladder_speed
		elif Input.is_action_pressed('ui_left'):
			vel.x -= ladder_speed
		else:
			$AnimatedSprite.stop()
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



func moveandslide():
	vel = move_and_slide(vel, Vector2(0, -1))
