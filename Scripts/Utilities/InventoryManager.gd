extends Node

class_name InventoryManager
###########################################
# Functions in this class manipulate player save data.
# Functions edit dice, move faces, and generate faces.
###########################################

var saveManager = SaveManager.new()
var player_data = saveManager.loadData()
var player_inventory = player_data['inventory']
var player_dice = player_data['dice']
var constants = load('res://GameData/Constants.gd').new()

func generateFace(face : Dictionary):
	var idGenerator = IdGenerator.new()
	var id = idGenerator.generateGuid()
	player_inventory[id] = face
	idGenerator = null

func deleteFace(faceId : String):
	player_inventory[faceId].erase()
	saveManager.saveData(player_data)
	
func diceToInventory(dieId : String, faceId : String):
	for die in player_dice:
		if die['id'] == dieId:
			for face in die:
				if face['id'] == faceId:
					var duplicated_face = face.duplicate().erase('id')
					player_inventory[faceId] = duplicated_face
					face = null
					saveManager.saveData(player_data)
					return
		print('Face: ', faceId, ' does not exist.')
	print('Dice: ', dieId, ' does not exist.')
 
func inventoryToDice(dieId : String, faceId : String):
	if faceId in player_inventory:
		var face_duplicate = player_inventory[faceId].duplicate()
		face_duplicate['id'] = faceId
		player_inventory[faceId].erase()
		for die in player_dice:
			if die['id'] == dieId:
				die['faces'].append(face_duplicate)			
				saveManager.saveData(player_data)
				return
		print("Dice: ", dieId, " does not exist.")
		return
	else:
		print("Face: ", faceId, " is not in player's inventory.")
		
func isDuplicate(diceName:String) -> bool:
	for die in player_dice:
		if die['name'] == diceName:
			return true
	return false
	
func createDie(diceName:String, faceCount:int):
	var idGenerator = IdGenerator.new()
	var diceId = idGenerator.generateGuid()
	var diceData = constants.DICE_FORMAT
	
	if diceName == "":
		diceName = idGenerator.generateDiceName()
	if isDuplicate(diceName):
		return true
		
	diceData['name'] = diceName
	diceData['id'] = diceId
	diceData['faceCount']  = faceCount
	
func importCreateDie(diceId:String, faceCount:int):
	pass

func getFaceInventory() -> Dictionary:
	return player_inventory

func getDice() -> Dictionary:
	return player_dice
	
