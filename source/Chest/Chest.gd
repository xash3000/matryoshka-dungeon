extends KinematicBody2D

class_name Chest

func push(vel: Vector2) -> void:
	move_and_slide(vel)
