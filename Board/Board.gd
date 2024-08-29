extends Node

class_name Board

var verticies = {}
var gp1: GamePlayer
var gp2: GamePlayer
var p1 = []
var p2 = []

func _init():
	self.verticies = {
		"A1": Vertex.new(self),
		"B1": Vertex.new(self),
		"B2": Vertex.new(self),
		"B3": Vertex.new(self),
		"B4": Vertex.new(self),
		"C1": Vertex.new(self),
		"C2": Vertex.new(self),
		"D1": Vertex.new(self),
		"E1": Vertex.new(self),
		"E2": Vertex.new(self)
	}
	verticies.A1.setAdjacent([verticies.B1,verticies.B2,verticies.B3,verticies.B4])
	verticies.B1.setAdjacent([verticies.A1,verticies.B2,verticies.C1,verticies.E1])
	verticies.B2.setAdjacent([verticies.A1,verticies.B1,verticies.B2,verticies.C1])
	verticies.B3.setAdjacent([verticies.A1,verticies.B2,verticies.B4,verticies.C2])
	verticies.B4.setAdjacent([verticies.A1,verticies.B3,verticies.C2,verticies.E2])
	verticies.C1.setAdjacent([verticies.B1,verticies.B2,verticies.D1,verticies.E1])
	verticies.C2.setAdjacent([verticies.B3,verticies.B4,verticies.D1,verticies.E2])
	verticies.D1.setAdjacent([verticies.C1,verticies.C2,verticies.E1,verticies.E2])
	verticies.E1.setAdjacent([verticies.B1,verticies.C1,verticies.D1,verticies.E2])
	verticies.E2.setAdjacent([verticies.B4,verticies.C2,verticies.D1,verticies.E1])
	
func placeDice(pos: String, player: int, dice: Dice):
	if (player == 1):
		p1.append(self.verticies.pos)
	else:
		p2.append(self.verticies.pos)
	self.verticies.pos.addDice(dice,player)
	
func score():
	var p1a = 0
	var p1d = 0
	var p2a = 0
	var p2d = 0
	var fire = "Fire"
	var water = "Water"
	for v in p1:
		for e in v.face.effects:
			if (e.type == "Attack"):
				p1a += v.face.value + v.p1status.fire - v.p1status.water
			elif (e.type == "Block"):
				p1d += v.face.value + v.p1status.fire - v.p1status.water
			elif (e.type == "Poison"):
				p1a += v.face.value + v.p1status.fire - v.p1status.water
				p2d -= 2 * (v.face.value + v.p1status.fire - v.p1status.water)
	for v in p2:
		for e in v.face.effects:
			if (e.type == "Attack"):
				p2a += v.face.value + v.p2status.fire - v.p2status.water
			elif (e.type == "Block"):
				p2d += v.face.value + v.p2status.fire - v.p2status.water
			elif (e.type == "Poison"):
				p2a += v.face.value + v.p2status.fire - v.p2status.water
				p1d -= 2 * (v.face.value + v.p2status.fire - v.p2status.water)
	if (p1a > p2d):
		gp2.health -= p1a - p2d
	if (p2a > p1d):
		gp1.health -= p2a - p1d

func _ready():
	pass 

func _process(delta):
	pass
