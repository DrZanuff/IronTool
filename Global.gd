extends Node

var themes = {}

func _ready() -> void:
	var dir = Directory.new()
	dir.open("res://Classes/Themes/")
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			themes[load("res://Classes/Themes/"+file_name).get_theme_name()] = (
				load("res://Classes/Themes/"+file_name).get_data_as_object()
			)
		file_name = dir.get_next()

var domains = {
	
}
