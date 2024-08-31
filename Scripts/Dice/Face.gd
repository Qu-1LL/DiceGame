extends Node

class_name Face

var EFFECTS = {
	"ATTACK": Effect.new("Attack", false),
	"BLOCK": Effect.new("Block", false),
	"FIRE": Effect.new("Fire", true),
	"WATER": Effect.new("Water", true),
	"POISON": Effect.new("Poison", false)
}

var value: int
var effects: Array = []
var eCount: int
	
func _init(value: int, effect: Array):
	self.value = value
	for e in effect:
		self.effects.append(EFFECTS.e)
	self.eCount = self.effects.size()


func equals(face: Face) -> bool:
	if(self.value == face.value and self.effect.type == face.effect.type):
		return true
	else:
		return false
		
func getData() -> Dictionary:
	var face_data = {
		'effect' : self.effect,
		'value' : self.value
		
	}
	return face_data
