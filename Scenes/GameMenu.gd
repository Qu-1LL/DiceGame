extends Control




func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_edit_dice_pressed():
	get_tree().change_scene_to_file("res://Scenes/DiceEditor.tscn")


func _on_join_pressed():
	pass # Replace with function body.


func _on_host_pressed():
	pass # Replace with function body.


func _on_solo_pressed():
	pass # Replace with function body.
