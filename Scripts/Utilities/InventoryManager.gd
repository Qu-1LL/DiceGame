extends Node

class_name InventoryManager

var saveManager = SaveManager.new()
var player_data = saveManager.loadData()
var player_inventory = player_data['inventory']
var player_dice = player_data['dice']

func generateFace(face : Dictionary):
	var idGenerator = IdGenerator.new()
	var id = idGenerator.generateGuid()
	player_inventory[id] = face

func deleteFace(faceId : String):
	player_inventory[faceId].erase()
	saveManager.saveData(player_data)
	
func diceToInventory(diceName : String, faceId : String):
	for die in player_dice:
		if die['name'] == diceName:
			for face in die['name'][diceName]:
				if face['id'] == faceId:
					var duplicated_face = face.duplicate().erase('id')
					player_inventory[faceId] = duplicated_face
					face = null
					saveManager.saveData(player_data)
					return
		print('Face: ', faceId, ' does not exist.')
	print('Dice: ', diceName, ' does not exist.')

					
 
func inventoryToDice(diceName : String, faceId : String):
	if faceId in player_inventory:
		var face_duplicate = player_inventory[faceId].duplicate()
		face_duplicate['id'] = faceId
		player_inventory[faceId].erase()
		for die in player_dice:
			if die['name'] == diceName:
				die['faces'].append(face_duplicate)			
				saveManager.saveData(player_data)
				return
		print("Dice: ", diceName, " does not exist.")
	else:
		print("Face: ", faceId, " is not in player's inventory.")
		
func getData() -> Dictionary:
	return player_inventory
