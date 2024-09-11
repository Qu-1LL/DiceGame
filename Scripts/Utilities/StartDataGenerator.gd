extends Node

class_name StarterDataGenerator
var constants = load('res://GameData/Constants.gd').new()
var idGenerator = IdGenerator.new()

func generate():
	var start_data = constants.START_DATA_FORMAT
	var dice_dupe = start_data['dice'].duplicate()
	start_data['dice'] = {}
	return start_data
