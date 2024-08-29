extends Node

class_name Dice

func _init(diceName: String, faceCount: int, faces: Array, health: int) -> void:
	self.faceCount = faceCount
	self.faces = faces
	self.diceName = diceName
	self.health = health
	self.usable = false if faceCount < len(faces) else true


func addFace(face: Face) -> void:
	if len(self.faces) < self.faceCount:
		self.usable = false
	elif len(self.faces) == self.faceCount:
		self.usable = true
	else:
		print("Player tried to add more than the face count")
		return
	self.faces.append(face)
	
func removeFace(face: Face) -> void:
	
	for f in self.faces:
		if (face.equals(f)):
			self.faces.remove_at(self.faces.find(f))
			
func setName(name:String) -> void:
	self.diceName = name
	
func getData() -> Dictionary:
	var dice_data  = {
		'name' : self.diceName,
		'facecount' : self.faceCount,
		'usable' : self.usable,
		'faces' : self.faces
	}
	return dice_data


func roll():
	if self.usable:
		var randomNumber = randi() % (self.faceCount + 1)
		return self.faces[randomNumber]
	else:
		print('This Dice Is not rollable because of the number of faces.')
