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
	var faceId  = idGenerator.generateGuid()
	player_inventory[faceId] = face
	idGenerator = null
	saveManager.saveData(player_data)
	
func dataFromId(Id:String): #Checks if an Id exists and returns its assoicated data.
	if Id in player_inventory:
		return player_inventory[Id]
	elif Id in player_dice:
		return player_dice[Id]
	else:
		for dieId in player_dice:
			if Id in player_dice[dieId]['faces']:
				return player_dice[dieId]['faces'][Id] 
			else:
				print('Id does not exist. (dataFromId)')
	
func isNameDuplicate(diceName:String) -> bool: #returns true if another dice has the same name inputted.
	for dieId in player_dice:
		if player_dice[dieId]['name'] == diceName:
			print('Another dice alread has the name: ', diceName)
			#error message trigger goes here
			return true
	return false

func idFromDiceName(diceName:String): #gets the guid of dice from its name.
	for dieId in player_dice:
		if player_dice[dieId]['name'] == diceName:
			return dieId
	print('Id does not exist. (idFromDiceName)')
	
func verifyDie(dieId:String) -> bool: #returns true if the dice has an issue.
	var dice_data = dataFromId(dieId)
	var dice_faceCount = dice_data['faceCount']
	if isNameDuplicate(dice_data['name']):
		return true
	elif dice_faceCount in constants.FACE_COUNTS:
		print('Face count on dice is not valid.')
		return true
	elif dice_data['faces'].count > dice_faceCount:
		print('Dice with Id:', dieId, ' has a face count greater than allowed on dice.')
		#error message trigger goes here
		return true
	elif dice_data['faces'].count < dice_faceCount:
		dice_data['usable'] = false
		
	return false
			
func moveFaceTo(dieId : String, faceId : String, where: String): #used to move a face to a die or the inventory.
	var face_data_copy = dataFromId(faceId).duplicate(true)
	var dice_data_copy = dataFromId(dieId).duplicate(true)
	if where == 'inventory':
		player_dice['faces'].erase(faceId)
		player_inventory[faceId] = face_data_copy
	elif where == 'die':
		player_inventory.erase(faceId)
		player_dice[dieId]['faces'][faceId] = face_data_copy
	else:
		print('Invalid location input. (moveFaceTo)')
		
	if verifyDie(dieId):
		print('Cannot save dice data because of issue above ^.')
		print('Reverting to die\'s previous state.')
		player_inventory[faceId] = face_data_copy
		player_dice[dieId] = dice_data_copy
		saveManager.saveData(player_data)
	else:
		saveManager.saveData(player_data)

func changeFaceCount(dieId:String, faceCount:int):
	if player_dice[dieId]['faceCount'] > faceCount:
		if player_dice[dieId]['faces'].count > faceCount:
			pass
	
func importCreateDie(dieId:String, faceCount:int): #Creates a die with higher face count from an existing die.
	pass
	
func createDie(diceName:String, faceCount:int):
	pass
	
func getFaceInventory() -> Dictionary:
	return player_inventory

func getDice() -> Dictionary:
	return player_dice
	
