extends Node

var themes = {}
var domains = {}


func _ready() -> void:
	var dir = Directory.new()
	dir.open("res://Classes/Themes/")
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			themes[load("res://Classes/Themes/"+file_name).get_name()] = (
				load("res://Classes/Themes/"+file_name).get_data_as_object()
			)
		file_name = dir.get_next()
		
	dir.open("res://Classes/Domains/")
	dir.list_dir_begin()
	file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			domains[load("res://Classes/Domains/"+file_name).get_name()] = (
				load("res://Classes/Domains/"+file_name).get_data_as_object()
			)
		file_name = dir.get_next()
	


