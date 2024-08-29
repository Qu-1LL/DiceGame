extends Node

var MAX_FACES = 20
var MIN_FACES = 4
var MAX_DICE = 20
var MIN_DICE = 0

var START_DATA_FORMAT = {
			'currency' : 0,
			'inventory' : {},
			'statistics' : 
				{
					'wins' : 0,
					'loses' : 0,
					'ties' : 0,
				},
			'dice' : 
				[
					{
						'name' : 'Die1',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 1
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 2
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 3
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 4
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
								{
									'effect' : 'attack',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Die2',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 1
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 2
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 3
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 4
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
								{
									'effect' : 'block',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Die3',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Die4',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 1
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 2
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 3
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 4
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
								{
									'effect' : 'fire',
									'value' : 5
								},
							]
						
					},
					{
						'name' : 'Dice5',
						'faceCount' : 20,
						'usable' : true,
						'faces' : 
							[
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 1
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 2
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 3
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 4
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
								{
									'effect' : 'poison',
									'value' : 5
								},
							]
						
					},
				]
		}	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
