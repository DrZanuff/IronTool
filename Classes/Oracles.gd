class_name Oracles extends Resource

export (String) var type
export (String) var oracle_name
export (String) var module
export (String,MULTILINE) var data
export (int) var type_order 
export (int) var oracle_order 

func get_data_as_object():
	var oracle_data = {
		"type" : type,
		"oracle_name" : oracle_name,
		"module" : module,
		"data" : data,
		"type_order" : type_order,
		"oracle_order" : oracle_order
	}
	
	return oracle_data
