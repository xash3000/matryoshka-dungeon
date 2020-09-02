extends KinematicBody2D

export var can_spawn: bool = true
export var next_doll: PackedScene
export var max_energy = 1.0
onready var anim = $AnimatedSprite
export var speed = 256
var velocity = Vector2.ZERO

export var dir = 'down'
var v = {
	"right": Vector2(1, 0),
	"left": Vector2(-1, 0),
	"up": Vector2(0, -1),
	"down": Vector2(0, 1)
}

func init(_dir):
	dir = _dir
	$AnimatedSprite.play(dir)

func _ready() -> void:
	$AnimatedSprite.play(dir)
	$Light2D.energy = max_energy

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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("spawn"):
		spawn()
		
		
func spawn():
	if not can_spawn:
		return
	
	$Pop.play()
	can_spawn = false
	
	var new_doll = next_doll.instance()
	new_doll.set_as_toplevel(true)
	new_doll.position = position
	
	if dir == 'right':
		new_doll.position.x += 32
	elif dir == 'left':
		new_doll.position.x -= 32
	elif dir == 'up':
		new_doll.position.y -= 32
	elif dir == 'down':
		new_doll.position.y += 32
		
	new_doll.init(dir)
	
	get_parent().add_child(new_doll)
