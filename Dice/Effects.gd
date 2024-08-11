extends Node


class_name Effect
	
var type: String
var instant: bool
	
func _init(name: String, instant: bool):
	self.effectName = name
	self.instant = instant
