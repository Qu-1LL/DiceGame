extends Node

class_name Dice

var faceCount: int
var faces: Array
var diceName: String

func _init(faceCount: int, faces: Array):
	self.faceCount = faceCount
	self.diceName = "My_Dice"
	
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addFace(face: Face):
	if (faceCount > faces.size()):
		return false
		
