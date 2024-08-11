extends Node

class_name Dice

var faceCount: int
var faces: Array
var diceName: String
var health: int

func _init(faceCounts: int, facess: Array, hp: int):
	self.faceCount = faceCounts
	self.faces = facess
	self.diceName = "My_Dice"
	self.health = hp
	
func _ready():
	pass
func _process(delta):
	pass

func addFace(face: Face):
	if (faceCount <= faces.size()):
		return false
	self.faces.append(face)
	return true
	
func removeFace(face: Face):
	for f in faces:
		if (face.equals(f)):
			faces.remove_at(faces.find(f))
			
func roll():
	return faces[randi() % faceCount]
