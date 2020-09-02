extends Node2D

export var level_loader_path = "res://Levels/LevelLoader.tscn"

func _on_Play_pressed() -> void:
	get_tree().change_scene(level_loader_path)


func _on_Quit_pressed() -> void:
	get_tree().quit()


func _on_Credits_pressed() -> void:
	get_tree().change_scene("res://Menus/Credits.tscn")
