class_name Oracles extends Resource

export (String) var type
export (String) var oracle_name
export (String) var module
export (String,MULTILINE) var data

func get_data_as_object():
	var oracle_data = {
		"type" : type,
		"oracle_name" : oracle_name,
		"module" : module,
		"data" : data
	}
	
	return oracle_data
