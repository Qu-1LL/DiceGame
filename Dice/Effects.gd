extends Node


class_name Effect
	
var type: String
var instant: bool
	
func _init(eName: String, instants: bool):
	self.effectName = eName
	self.instant = instants
