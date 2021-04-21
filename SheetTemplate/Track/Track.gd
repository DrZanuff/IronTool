extends HBoxContainer

var score = -1
enum LEVEL_TYPE {TROUBLESOME , DANGEROUS , FORMIDABLE , EXTREME, EPIC}

func _ready() -> void:
	for opt in get_children():
		if opt is OptionButton:
			opt.connect("item_selected",self,"trigger_mark",[opt.get_index()])

func trigger_mark(tick_value, box_index):
	unmark()
	mark(box_index , tick_value)

func _mark_progress(level : int):
	match level:
		LEVEL_TYPE.TROUBLESOME:
			mark(score+3 , 4)
			
		LEVEL_TYPE.DANGEROUS:
			mark(score+2 , 4)
			
		LEVEL_TYPE.FORMIDABLE:
			mark(score+1 , 4)
			
		LEVEL_TYPE.EXTREME:
			tick_box(2)
		
		LEVEL_TYPE.EPIC:
			tick_box(1)


func tick_box(value):
	var node = get_child( clamp(score,0,9) )
	if node is OptionButton:
		var current_tick = node.selected
		
		var remainder = abs( value - current_tick )
		
		if current_tick+value >= 4:
			score = clamp(score+1,1,9)
			node.select(4)
			if current_tick+value > 4:
				if score < 9:
					get_child( score ).select(remainder)
		else:
			node.select(current_tick+value)
		
func unmark():
	for opt in get_children():
		if opt is OptionButton:
			opt.select(0)

func mark(n , last_tick):
	score = 0
	n = min(9,n)
	for i in range(n):
		var node = get_child(i)
		if node is OptionButton:
			node.select(4)
	
	get_child(n).select(last_tick)
	score = n if last_tick == 4 else n-1

func get_score() -> int:
	return score+1

func _clear():
	score = -1
	unmark()

#func _input(event: InputEvent) -> void:
#	if event is InputEventKey:
#		if event.pressed:
#			match event.scancode:
#				KEY_1:
#					_mark_progress(0)
#				KEY_2:
#					_mark_progress(1)
#				KEY_3:
#					_mark_progress(2)
#				KEY_4:
#					_mark_progress(3)
#				KEY_5:
#					_mark_progress(4)
#				KEY_6:
#					_clear()
#
#func _physics_process(delta: float) -> void:
#	print(score)
