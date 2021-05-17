extends HBoxContainer

var title = load("res://SheetTemplate/Moves/MovesGroupTitle.tscn")
var menu = load("res://SheetTemplate/Moves/MenuMoveButton.tscn")

func _ready() -> void:
	var count = 0
	for item in Global.moves_menu:
		if item.type == "Title":
			var new_title = title.instance()
			$Margin/InnerMargin/SideMenu/Margin/M/List.add_child(new_title)
			new_title._set_text(item.name)
		elif item.type == "Move":
			count += 1
			var new_menu = menu.instance()
			$Margin/InnerMargin/SideMenu/Margin/M/List.add_child(new_menu)
			new_menu._deploy(
				item.name,
				Color("#3c3c44") if count % 2 == 0 else Color("#33333a")
			)
