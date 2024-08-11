extends Node

class_name Dice

var faceCount: int
var faces: Array
var diceName: String

func _init(faceCount: int, faces: Array):
	self.faceCount = faceCount
	self.faces = faces
	self.diceName = "My_Dice"
	
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
