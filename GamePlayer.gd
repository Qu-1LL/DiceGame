extends Node

class_name GamePlayer

var equippedDice = []
var hp: int

func _init(dice: Array):
	self.equippedDice = dice
	self.hp = 0
	for d in dice:
		self.hp += d.health


func _ready():
	pass 

func _process(delta):
	pass
