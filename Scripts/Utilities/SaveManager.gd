extends Node

class_name SaveManager
var json = JSON.new()
var save_path = "user://data.json"
var constants = load("res://GameData/Constants.gd").new()


func firstTimeLoad():
	if FileAccess.file_exists(save_path):
		print('Player Data Exists')
	else:
		var start_data = constants.START_DATA
		print('Generating New Player Data...')
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_string(json.stringify(start_data))
		file.close()
		start_data = null

func saveData(data):
	if FileAccess.file_exists(save_path):
		verifyData(data)
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_string(json.stringify(data))
		file.close()
		file = null
	else:
		print('Save file missing.')
		
func loadData():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var content = json.parse_string(file.get_as_text())
		verifyData(content)
		return content
	else:
		print('Save file missing.')

func verifyData(data) -> Dictionary:
	print("Verifying Data...")
	var start_data = constants.START_DATA
	var error = 0
	for key in start_data.keys():
		if key in data:
			pass
		else:
			print(key, "is missing from the main player dataset. Adding it back now.")
			data[key] = start_data[key]
			error += 1
	if error > 0:
		pass
	else:
		print("No errors detected")	
		
	return data
			
