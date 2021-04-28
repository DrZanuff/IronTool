extends MarginContainer

onready var body = $Body/Creator/Body/Itens
onready var list = $Body/Creator/Body/ItensOpt/HBox/OptItens
onready var text = $ItensRef/Text
onready var skill = $ItensRef/Skill
onready var topic = $ItensRef/Topic
onready var property = $ItensRef/Property
onready var track = $ItensRef/Track
onready var named_track = $ItensRef/NamedTrack


func _on_ButtonAddItens_pressed() -> void:
	match list.get_item_text( list.selected):
		"TEXT":
			body.add_child( text.duplicate() )
		
		"SKILL":
			body.add_child( skill.duplicate() )

		"TOPIC":
			print("OOk")
			body.add_child( topic.duplicate() )

		"PROPERTY":
			body.add_child( property.duplicate() )

		"TRACK":
			body.add_child( track.duplicate() )

		"NAMED TRACK":
			body.add_child( named_track.duplicate() )
