extends Node

class_name IdGenerator

func truncateString(string : String, length : int):
	if len(string) < length:
		print("Can't truncate a string smaller than the given length.")
		return null
	else:
		var output_string : String
		for letter_index in range(length + 1):
			output_string += string[letter_index]
		return output_string
		
func generateGuid() -> String:
	var time_part = str(Time.get_unix_time_from_system()).replace(',', '')
	var random_array = OS.get_entropy(8)
	var random_number = ""
	for numbers in random_array:
		random_number += str(numbers)
	var id_string = truncateString(truncateString(time_part, 8) + random_number, 16)
	return id_string
	
func generateDiceName() -> String:
	var names = load('res://GameData/Name.gd').new()
	var adjectiveList = names.first_words
	var descriptorList = names.second_words
	var adjective = adjectiveList[randi() % adjectiveList.size()]
	var descriptor = descriptorList[randi() % descriptorList.size()]
	return (adjective + ' ' + descriptor)
