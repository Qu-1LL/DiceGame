extends Node

class_name StarterDataGenerator
var constants = load('res://GameData/Constants.gd').new()
var idGenerator = IdGenerator.new()

func generate():
	var start_data = constants.START_DATA_FORMAT
	var dice_dupe = start_data['dice'].duplicate()
	var idGenerator = IdGenerator.new()
	start_data['dice'] = {}
	for die in dice_dupe:
		var face_dupe = die['faces'].duplicate()
		die['faces'] = {}
		for face in face_dupe:
			var faceId = idGenerator.generateGuid()
			die['faces'][faceId] = face
		var diceId = idGenerator.generateGuid()
		start_data['dice'][diceId] = die
		start_data['dice'][diceId] = die
		
	return start_data
