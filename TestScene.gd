extends Node

export (String , MULTILINE) var data 

var table = []

func _ready() -> void:
	table = JSON.parse(data).result
	
	for element in table:
		var array = element.range.split(",")
		element.range = new_range(array)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		randomize()
		var roll = ( randi() % 100 ) + 1
#		var roll = 39
		
		for element in table:
			if roll in element.range:
				var numbers = str(element.range[0])+( "-"+str(element.range[-1]) if element.range.size() > 1 else "" )
				printt( numbers , element.name )
				return
	
func new_range(a : Array):
	var start = int( a[0] )
	var end = int( a[-1] )+1 if a.size() > 1 else int( a[0] )+1
	return range( start, end )
	
	
	


