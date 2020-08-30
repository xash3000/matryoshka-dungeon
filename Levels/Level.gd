extends Node2D

export var next_level: PackedScene

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('reset'):
		get_tree().reload_current_scene()

func _physics_process(_delta: float) -> void:
	if check_win():
		for player in $Players.get_children():
			player.speed = 0
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		get_tree().change_scene_to(next_level)

func check_win():
	for torch in $Torches.get_children():
		if not torch.active:
			return false
	return true
