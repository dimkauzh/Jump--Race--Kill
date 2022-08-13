extends KinematicBody2D

var vel = Vector2()
export var direction = -1
export var color = "Blue"
var speed = 50
var gravity = 20
var coin

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Blue")
	change_color()
	
func change_color():
#	if color == "Blue" or color == "blue":
#		pass
#	if color == "Red" or color == "red":
#		set_modulate("ff0000")
#	if color == "Green" or color == "green":
#		set_modulate("ddfd00")
#	if color == "purple" or color == "Purple":
#		set_modulate("9d23e1")
	color = set_modulate(color)
func _physics_process(delta):

	if is_on_wall() or not $RayCast2D.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = true
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
		if direction == -1:
			$AnimatedSprite.flip_h = false
	
	vel.y = vel.y + gravity
	vel.x = speed * direction
	
	vel = move_and_slide(vel, Vector2.UP)

	
func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	speed = 0
	$AnimatedSprite.play("squash")
	
	#Global.add_coin()

func _on_Area2D_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	queue_free()
	
func _on_middle_collision_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	body.ouch(position.x)
#
#Red = ff0000
#Green = ddfd00
#Purple = 9d23e1
#
#
#
#
#
#
#
#
