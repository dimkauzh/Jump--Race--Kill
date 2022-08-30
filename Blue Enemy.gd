extends KinematicBody2D

var vel = Vector2()
export var direction = -1
export var color = "ffffff"
var speed = 50
var gravity = 20
var coin

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Blue")
	change_color()
	
func change_color():
	color = set_modulate(color)
func _physics_process(_delta):

	if is_on_wall() or not $RayCast2D.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = true
		if direction == -1:
			$AnimatedSprite.flip_h = false
	
	vel.y = vel.y + gravity
	vel.x = speed * direction
	
	vel = move_and_slide(vel, Vector2.UP)


func _on_up_collision_body_entered(_body):
	speed = 0
	$AnimatedSprite.play("squash")
	$Squash.play()	

func _on_up_collision_body_exited(_body):
	queue_free()
	
func _on_middle_collision_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.ouch(position.x)
