extends Control

const LEVEL_01 = preload("uid://dqxb6vdu4lo85") # res://Scenes/Lv1/Level01.tscn




func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_01)
