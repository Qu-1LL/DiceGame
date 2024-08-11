extends Node

class_name Vertex

var EFFECTS = {
	"ATTACK": Effect.new("Attack", false),
	"BLOCK": Effect.new("Block", false),
	"FIRE": Effect.new("Fire", true),
	"WATER": Effect.new("Water", true),
	"POISON": Effect.new("Poison", false)
}

var face: Face
var occupied = false
var adjacent: Array
var board: Board
var p1status = {
	"Fire": 0,
	"Water": 0
}
var p2status = {
	"Fire": 0,
	"Water": 0
}

func _init (my_board: Board):
	self.board = my_board
	
func addDice(dice: Dice, player:int):
	self.face = dice.roll()
	self.occupied = true
	for e in self.face.effects:
		if (e.instant):
			self.instantEffect(face.value,e,player)
			
func instantEffect(value: int, effect: Effect, player: int):
	for v in adjacent:
		if (!occupied):
			if (player == 1 and effect.type == "Fire" or player == 2 and effect.type == "Water"):
				v.p1status.effect.type += value
			elif (player == 2 and effect.type == "Fire" or player == 1 and effect.type == "Water"):
				v.p2status.effect.type += value
			
func setAdjacent(adjacents: Array):
	self.adjacent = adjacents

func _ready():
	pass 

func _process(delta):
	pass
