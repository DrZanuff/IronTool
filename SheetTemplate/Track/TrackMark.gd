extends MarginContainer

func _ready() -> void:
	for opt in $HBox.get_children():
		if opt is OptionButton:
			opt.connect("item_selected",self,"trigger_mark",[opt.get_index()])
			opt.connect("toggled",self,"update_mark",[opt.get_index()])

func update_mark(pressed , index ):
	if !pressed:
		trigger_mark($HBox.get_child(index).selected , index)

func trigger_mark(tick_value, box_index):
	unmark()
	mark(box_index , tick_value)

func unmark():
	for opt in $HBox.get_children():
		if opt is OptionButton:
			opt.select(0)

func mark(n , last_tick):
#	score = 0
	n = min(3,n)
	for i in range(n):
		var node = $HBox.get_child(i)
		if node is OptionButton:
			node.select(1)
	
#	if n > 0:
	$HBox.get_child(n).select(last_tick)
