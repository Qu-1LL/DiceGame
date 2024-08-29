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
	var time_part = str(Time.get_unix_time_from_system())
	var random_array = OS.get_entropy(8)
	var random_number = ""
	for numbers in random_array:
		
		random_number += str(numbers)
	
	var id_string = time_part + "-" + random_number
	return truncateString(id_string, 24)
