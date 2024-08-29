extends Node

class_name SaveManager
var json = JSON.new()
var save_path = "user://data.json"

func firstTimeLoad():
	if FileAccess.file_exists(save_path):
		print('Player Data Exists')
	else:
		print('Generating New Player Data...')
		var start_data = {
			'currency' : 0,
			'inventory' : {},
			'statistics' : 
				{
					'wins' : 0,
					'loses' : 0,
					'ties' : 0,
				},
			'dice' : 
				[
					{
						'name' : 'Dice1',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Dice2',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Dice3',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Dice4',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Dice5',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
							]
						
					},
				]
		}	
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_string(json.stringify(start_data))
		file.close()
		start_data = null
func saveData(data):
	if FileAccess.file_exists(save_path):
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
		return content
	else:
		print('Save file missing.')
