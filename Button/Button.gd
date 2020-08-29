extends Area2D

onready var anim = $AnimatedSprite

export var active: bool = false

var bodies = 0

func _on_Button_body_entered(body: Node) -> void:
	bodies += 1
	active = true
	anim.play('active')


func _on_Button_body_exited(body: Node) -> void:
	bodies -= 1
	if bodies == 0:
		active = false
		anim.play('idle')
