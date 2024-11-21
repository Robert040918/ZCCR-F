extends Node2D


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://HUD/main_hud.tscn")
