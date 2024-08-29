extends Node

class_name Inventory

var saveManager = SaveManager.new()
var player_data = saveManager.loadData()
var player_inventory = player_data['inventory']

func addFace(face : Dictionary):
	var idGenerator = IdGenerator.new()
	var id = idGenerator.generateGuid()
	player_inventory[id] = face

func diceToInventory(diceName : String, faceId : String):
	pass

func inventoryToDice(diceName : String,FaceId : String):
	pass
