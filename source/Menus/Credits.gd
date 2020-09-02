extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_return_pressed() -> void:
	get_tree().change_scene("res://Menus/MainMenu.tscn")


func _on_twitter_pressed() -> void:
	OS.shell_open("http://twitter.com/__aliasf")


func _on_sprites_pressed() -> void:
	OS.shell_open("https://opengameart.org/content/dungeon-crawl-32x32-tiles")


func _on_music_pressed() -> void:
	OS.shell_open("https://opengameart.org/content/spooky-forest-music")
