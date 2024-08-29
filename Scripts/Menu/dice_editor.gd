extends Control

var saveManager = SaveManager.new()
var player_data = saveManager.loadData()

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func save_dice() -> void:
	pass
	
func _on_save_and_exit_pressed() -> void:
	save_dice()
	get_tree().change_scene_to_file("res://Scenes/GameMenu.tscn")
