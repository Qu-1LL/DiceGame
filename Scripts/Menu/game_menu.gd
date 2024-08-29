extends Control





func _on_dice_editor_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/DiceEditor.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
