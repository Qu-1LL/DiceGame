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
	pass
	
func deleteFace(faceId : String):
	pass
	
func diceToInventory(dieId : String, faceId : String):
	pass
	
func inventoryToDice(dieId : String, faceId : String):
	pass 
	
func isDuplicate(diceName:String):
	pass
	
func createDie(diceName:String, faceCount:int):
	pass
func deleteId(Id:String):
	pass
	
func idFromName(diceName:String):
	pass

func dataFromId(Id:String): #searches 
	pass


func importCreateDie(dieId:String, faceCount:int): #Creates a die with higher face count from an existing die.
	pass
	
func getFaceInventory() -> Dictionary:
	return player_inventory

func getDice() -> Dictionary:
	return player_dice
	
