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

func equals(face: Face):
	if(self.value == face.value and self.effect.type == face.effect.type):
		return true
	else:
		return false
	
func _init(values: int, effectss: Array):
	self.value = values
	for e in effectss:
		self.effects.append(EFFECTS.e)
	self.eCount = self.effects.size()

func _ready():
	pass
func _process(delta):
	pass
