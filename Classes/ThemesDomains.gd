extends Resource

class_name ThemesDomains

export (String) var _name
export (String) var description
export (Array,String) var features
export (Array,String) var dangers

func get_data_as_object():
	var data = {
		"NAME"        : _name,
		"DESCRIPTION" : description,
		"FEATURES"    : features,
		"DANGERS"     : dangers,
	}
	return data

func get_name():
	return _name
