extends VBoxContainer

func _ready() -> void:
	for o in Global.oracles:
		var btn = Button.new()
		btn.rect_min_size.x = 180
		$OracleMenu.add_child(btn)
		btn.text = o
		if o == "IRONSWORN":
			$OracleMenu.move_child(btn,0)
		if o == "DELVE":
			$OracleMenu.move_child(btn,1)
	
