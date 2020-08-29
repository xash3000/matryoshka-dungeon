extends Area2D

onready var anim = $AnimatedSprite

export var active: bool = false

func _physics_process(delta: float) -> void:
	if false:
		print("Col")

func _on_Button_body_entered(body: Node) -> void:
	active = true
	anim.play('active')


func _on_Button_body_exited(body: Node) -> void:
	active = false
	anim.play('idle')
