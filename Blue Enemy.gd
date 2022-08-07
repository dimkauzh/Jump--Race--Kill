extends KinematicBody2D

var vel = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true

func _physics_process(_delta):
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = true
		if direction == -1:
			$AnimatedSprite.flip_h = false
	
	vel.y = vel.y + 20
	vel.x = 50 * direction
	
	vel = move_and_slide(vel, Vector2.UP)
	
