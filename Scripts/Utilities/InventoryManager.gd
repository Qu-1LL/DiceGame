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
		print('Cannot create dice because a duplicate name exists.')
		return true
	
	diceData['name'] = diceName
	diceData['id'] = diceId
	diceData['faceCount']  = faceCount
	player_dice.append(diceData)
	return false
	
func deleteDie(diceId:String):
	for index in range(player_dice.size):
		if player_dice[index]['id'] == diceId:
			player_dice.remove(index)
			print('Die successfully deleted.')
			return
	print('Die not found and cannot be deleted.')
						
func idFromName(diceName:String):
	for die in player_dice:
		if die['name'] == diceName:
			return die['id']
	print('Die either doesn\'t exist or wrong name was inputted.')

func dataFromId(Id:String): #searches 
	for face in player_inventory:
		if face['id'] == Id:
			return face
	print('No faces in player inventory with inputted Id.')
	for die in player_dice:
		if die['id'] == Id:
			return die
		for face in die['faces']:
			if face['id'] == Id:
				return face
	print('Id does not exist')
	
func importCreateDie(dieId:String, faceCount:int): #Creates a die with higher face count from an existing die.
	var dice_data = dataFromId(dieId)
	if dice_data['faceCount'] > faceCount:
		return true
		
	var dice_data_dupe = dice_data.duplicate()
	dice_data_dupe['usable'] = false
	deleteDie(dieId)

func getFaceInventory() -> Dictionary:
	return player_inventory

func getDice() -> Dictionary:
	return player_dice
	
