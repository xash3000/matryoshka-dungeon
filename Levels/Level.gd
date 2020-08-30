extends Node2D

export var next_level: PackedScene

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('reset'):
		get_tree().reload_current_scene()

func _physics_process(_delta: float) -> void:
	if check_win():
		pass

func check_win():
	for torch in $Torches.get_children():
		if not torch.active:
			return false
	return true
