extends Node

class_name StarterDataGenerator
var constants = load('res://GameData/Constants.gd').new()
var idGenerator = IdGenerator.new()
func generate():
	var start_data = constants.START_DATA_FORMAT
	for die in start_data['dice']:
		for face in die['faces']:
			face['id'] = idGenerator.generateGuid()
	return start_data
