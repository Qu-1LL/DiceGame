extends Control

var inventoryManager = InventoryManager.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_test_button_pressed() -> void:
	inventoryManager.createDie('', 20)
