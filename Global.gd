extends Node

var themes = {}
var domains = {}
var assets_types = ["COMPANION","PATH","COMBAT TALENT","RITUAL","CUSTOM"]
var assets = {}
var oracles = {}


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
		
	dir.open("res://Classes/Assets/")
	dir.list_dir_begin()
	file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			var asset = load("res://Classes/Assets/"+file_name)
			
			if assets.has(asset.type) == false:
				assets[asset.type] = {}
			assets[asset.type][asset.asset_name] = asset.get_data_as_object()
			 
		file_name = dir.get_next()

	dir.open("res://Classes/Oracles/")
	dir.list_dir_begin()
	file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			var oracle = load("res://Classes/Oracles/"+file_name)
			
			if oracles.has(oracle.module) == false:
				oracles[oracle.module] = {}
			
			if oracles[oracle.module].has(oracle.type) == false:
				oracles[oracle.module][oracle.type] = {}
			
			oracles[oracle.module][oracle.type][oracle.oracle_name] = oracle.get_data_as_object()
			 
		file_name = dir.get_next()
	


