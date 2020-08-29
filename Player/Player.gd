extends KinematicBody2D

onready var anim = $AnimatedSprite
export var speed = 256
var velocity = Vector2.ZERO
export var dir = 'right'
var v = {
	"right": Vector2(1, 0),
	"left": Vector2(-1, 0),
	"up": Vector2(0, -1),
	"down": Vector2(0, 1)
}

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed('ui_right'):
		velocity.x = speed
		velocity.y = 0
		anim.play('right')
		dir = 'right'
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -speed
		velocity.y = 0
		anim.play('left')
		dir = 'left'
	elif Input.is_action_pressed('ui_up'):
		velocity.x = 0
		velocity.y = -speed
		anim.play('up')
		dir = 'up'
	elif Input.is_action_pressed('ui_down'):
		velocity.x = 0
		velocity.y = speed
		anim.play('down')
		dir = 'down'
	else:
		velocity = Vector2.ZERO
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
	position = position.round()
