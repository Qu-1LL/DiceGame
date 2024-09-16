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

func generateFace(face : Dictionary): #gives face data an id and puts it in the inventory
	var idGenerator = IdGenerator.new()
	var faceId  = idGenerator.generateGuid()
	player_inventory[faceId] = face
	idGenerator = null
	saveManager.saveData(player_data)
	
func deleteFace(faceId:String): #deletes face and returns where it was deleted. if it was a dice it returns all the dice data
	if faceId in player_inventory:
		player_inventory.erase(faceId)
		return 'inventory'
	else:
		for dieId in player_dice:
			if faceId in player_dice[dieId]['faces']:
				var dice_data_copy = player_dice[dieId].duplicate(true)
				player_dice[dieId]['faces'].erase(faceId)
				return {dieId : dice_data_copy}
		print('Id does not exist. (deleteFace)')
		
func dataFromId(Id:String): #checks if an Id exists and returns its assoicated data.
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
	var faceNameCount = 0
	for dieId in player_dice:
		if player_dice[dieId]['name'] == diceName:
			faceNameCount += 1
			if faceNameCount > 1:
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
	print(dice_data)
	print(dice_data['faces'].length)
	if isNameDuplicate(dieId):
		return true
	elif dice_faceCount not in constants.FACE_COUNTS:
		print(constants.FACE_COUNTS)
		print('Face count(', dice_faceCount, ') on dice is not valid.')
		return true
	elif dice_data['faces'].count > dice_faceCount:
		print('Dice with Id:', dieId, ' has a face count greater than allowed on dice.')
		#error message trigger goes here
		return true
	if dice_data['faces'].count < dice_faceCount:
		dice_data['usable'] = false
	elif dice_data['faces'].count == dice_faceCount:
		dice_data['usable'] = true
	return false
			
func moveFaceTo(dieId : String, faceId : String, where: String): #used to move a face to a die or the inventory.
	var face_data_copy = dataFromId(faceId).duplicate(true) #deep copy
	var dice_data_copy = dataFromId(dieId).duplicate(true)
	var from = deleteFace(faceId) 
	if where == 'inventory':
		player_inventory[faceId] = face_data_copy
	elif where == 'die':
		player_dice[dieId]['faces'][faceId] = face_data_copy
	else:
		print('Invalid location input. (moveFaceTo)')
	if verifyDie(dieId):
		print('Cannot save dice data because of issue above ^.')
		print('Reverting to die\'s previous state.')
		if from == 'inventory':
			player_inventory[faceId] = face_data_copy
		else:
			player_dice[dieId] = dice_data_copy
			player_dice.merge(from, true)
		saveManager.saveData(player_data)
	else:
		saveManager.saveData(player_data)

func changeFaceCount(dieId:String, faceCount:int): #changes face count sending excess faces to inventory
	var dice_data = dataFromId(dieId)
	var dice_data_copy = dice_data.duplicate(true)
	if dice_data['faces'].count > faceCount: #moves excess faces on die if the face count change is smaller than the face count
		var number_of_faces_to_move = dice_data[dieId]['faces'].count - faceCount
		for faceId in dice_data['faces']:
			if number_of_faces_to_move == 0:
				break
			else:
				moveFaceTo(dieId, faceId, 'inventory')
	dice_data['faceCount'] = faceCount
	if verifyDie(dieId):
		print('Cannot save dice data because of issue above ^.')
		print('Reverting to die\'s previous state.')
		player_dice[dieId] = dice_data_copy
		saveManager.saveData(player_data)
	else:
		saveManager.saveData(player_data)
			
func createDie(diceName:String, faceCount:int):
	var idGenerator = IdGenerator.new()
	var diceId = idGenerator.generateGuid()
	var dice_data = constants.DICE_FORMAT
	if diceName == '':
		dice_data['name'] = idGenerator.generateDiceName()
	else:
		dice_data['name'] = diceName
	dice_data['faceCount'] = faceCount
	player_dice[diceId] = dice_data
	if verifyDie(diceId):
		print('Cannot save dice data because of issue above ^.')
		print('Reverting to die\'s previous state.')
	else:
		saveManager.saveData(player_data)
	
func deleteDie(dieId):
	if dieId in player_dice:
		for  faceId in player_dice[dieId]['faces']:
			moveFaceTo(dieId, faceId, 'inventory')
		saveManager.saveData(player_data)
	else:
		print('Die with id: ', dieId, ' cannot be found in dice inventory.')	
		
func getFaceInventory() -> Dictionary:
	return player_inventory

func getDice() -> Dictionary:
	return player_dice
	
