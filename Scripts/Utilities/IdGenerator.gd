extends Node

class_name IdGenerator

func generateGuid() -> String:
	
	var time_part = str(Time.get_ticks_msec())
	var crypto = Crypto.new()
	var random_part = str(crypto.generate_random_bytes(8))

	return time_part + "-" + random_part
