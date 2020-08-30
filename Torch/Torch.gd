extends Area2D

export var active: bool = false

var bodies = 0

func _on_Torch_body_entered(body: Node) -> void:
	bodies += 1
	active = true
	$Sprite/Particles2D.emitting = true


func _on_Torch_body_exited(body: Node) -> void:
	bodies -= 1
	if bodies == 0:
		active = false
		$Sprite/Particles2D.emitting = false
